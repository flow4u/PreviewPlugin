/**
 * PreviewPlugin.js
 * A simple plugin to preview files in a modal instead of downloading them.
 */

(function () {
    const PreviewPlugin = {
        options: {
            selector: 'a[data-preview]',
            overlayId: 'preview-plugin-overlay',
            containerId: 'preview-plugin-container',
            closeId: 'preview-plugin-close',
            supportedExtensions: [
                'png', 'jpg', 'jpeg', 'gif', 'webp', 'bmp', 'svg', 'eps',
                'csv', 'tsv', 'pdf', 'zip', 'txt', 'log', 'json', 'xml', 'yaml', 'ini',
                'html', 'htm', 'md', 'markdown', 'docx', 'odt',
                'tex', 'latex', 'xlsx', 'xls', 'ods', 'odt', 'rtf',
                'py', 'ps1', 'js', 'sh', 'bat', 'rb', 'pl', 'php', 'go', 'java', 'c', 'cpp', 'cs', 'sql', 'css'
            ],
            jszipUrl: 'https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js',
            markedUrl: 'https://cdnjs.cloudflare.com/ajax/libs/marked/4.3.0/marked.min.js',
            dompurifyUrl: 'https://cdnjs.cloudflare.com/ajax/libs/dompurify/3.0.5/purify.min.js',
            mammothUrl: 'https://cdnjs.cloudflare.com/ajax/libs/mammoth/1.6.0/mammoth.browser.min.js',
            katexUrl: 'https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.16.8/katex.min.js',
            katexCss: 'https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.16.8/katex.min.css',
            xlsxUrl: 'https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js',
            maxFileSize: 25 * 1024 * 1024, // 25MB default limit
            theme: 'auto', // 'light', 'dark', or 'auto' (detects from html/body)
            sri: {
                jszip: 'sha512-XMVd28F1oH/O71fzwBnV7HucLxVwtxf26XV8P4wPk26EDxuGZ91N8bsOttmnomcCD3CS5ZMRL50H0GgOHvegtg==',
                marked: 'sha512-zAs8dHhwlTbfcVGRX1x0EZAH/L99NjAFzX6muwOcOJc7dbGFNaW4O7b9QOyCMRYBNjO+E0Kx6yLDsiPQhhWm7g==',
                dompurify: 'sha512-KqUc2WMPF/gxte9xVjVE4TIt1LMUTidO3BrcItFg0Ro24I7pGNzgcXdnWdezNY+8T0/JEmdC79MuwYn+8UdOqw==',
                mammoth: 'sha512-sG5Q7boJL+ft/weuz6Mmi9XBD+bEzE9AI2FMP4YMFxp3FpTFUQSQQm5K5cSgJCyed6bWs3W8f8h0lp36lHXhQA==',
                katexJs: 'sha512-aoZChv+8imY/U1O7KIHXvO87EOzCuKO0GhFtpD6G2Cyjo/xPeTgdf3/bchB10iB+AojMTDkMHDPLKNxPJVqDcw==',
                katexCss: 'sha512-7nTa5CnxbzfQgjQrNmHXB7bxGTUVO/DcYX6rpgt06MkzM0rVXP3EYCv/Ojxg5H0dKbY7llbbYaqgfZjnGOAWGA==',
                xlsx: 'sha512-r22gChDnGvBylk90+2e/ycr3RVrDi8DIOkIGNhJlKfuyQM4tIRAI062MaV8sfjQKYVGjOBaZBOA87z+IhZE9DA=='
            }
        },

        jsZip: null,
        marked: null,
        domPurify: null,
        mammoth: null,
        katex: null,
        XLSX: null,
        currentZip: null,
        currentPath: '',
        currentObjectUrl: null,
        focusedIndex: -1,
        focusedTablePos: { row: -1, col: -1 },
        hasShownEscHint: false,
        hasShownNavHint: false,
        sessionConsentGiven: false,

        async init() {
            document.addEventListener('click', (e) => {
                const link = e.target.closest(this.options.selector);
                if (link) {
                    e.preventDefault();
                    const url = link.href;
                    const extension = this.getFileSystemExtension(url);
                    this.openPreview(url, extension);
                }

                // Global Theme Sync
                this.initThemeSync();

                // Global Download & Consent Interceptor
                const downloadBtn = e.target.closest('.preview-header-download-btn, .preview-download-btn');
                if (downloadBtn) {
                    if (this.sessionConsentGiven) {
                        this.showHint("<strong>Downloading file...</strong> Don't forget to delete it when no longer needed.", null, 'warning');
                    } else {
                        e.preventDefault();
                        this.showConsentModal(() => {
                            // Create a classless anchor so the intercept listener doesn't catch it
                            const a = document.createElement('a');
                            a.href = downloadBtn.href;
                            a.download = downloadBtn.download || '';
                            a.style.display = 'none';
                            document.body.appendChild(a);
                            a.click();
                            document.body.removeChild(a);
                            this.showHint("<strong>Downloading file...</strong> Don't forget to delete it when no longer needed.", null, 'warning');
                        });
                    }
                }
            });

            // Keyboard Navigation
            document.addEventListener('keydown', (e) => this.handleKeyDown(e));
        },

        handleKeyDown(e) {
            const overlay = document.getElementById(this.options.overlayId);
            if (!overlay || overlay.style.display === 'none') return;

            if (e.key === 'Escape') {
                this.closePreview();
                return;
            }

            // ZIP "Back" support
            if (e.key === 'ArrowLeft') {
                const backBtn = document.querySelector('.preview-back-btn');
                if (backBtn) {
                    e.preventDefault();
                    backBtn.click();
                    return;
                }
            }

            // ZIP Navigation
            const zipList = document.querySelector('.zip-list');
            if (zipList) {
                const items = Array.from(zipList.querySelectorAll('.zip-item'));
                if (items.length > 0) {
                    if (e.key === 'ArrowDown') {
                        e.preventDefault();
                        this.focusedIndex = Math.min(this.focusedIndex + 1, items.length - 1);
                        this.updateZipFocus(items);
                    } else if (e.key === 'ArrowUp') {
                        e.preventDefault();
                        this.focusedIndex = Math.max(this.focusedIndex - 1, 0);
                        this.updateZipFocus(items);
                    } else if (e.key === 'ArrowLeft') {
                        e.preventDefault();
                        const upItem = items.find(item => item.textContent.includes('.. (Up)'));
                        if (upItem) upItem.click();
                    } else if (e.key === 'Enter' && this.focusedIndex >= 0) {
                        e.preventDefault();
                        items[this.focusedIndex].click();
                    }
                }
            }

            // Table Navigation
            const table = document.querySelector('.preview-spreadsheet table, .preview-table');
            if (table) {
                const rows = Array.from(table.querySelectorAll('tr'));
                if (rows.length > 0) {
                    if (['ArrowDown', 'ArrowUp', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
                        e.preventDefault();

                        // Default to first cell if nothing focused
                        if (this.focusedTablePos.row === -1) {
                            this.focusedTablePos = { row: 0, col: 0 };
                        } else {
                            if (e.key === 'ArrowDown') this.focusedTablePos.row = Math.min(this.focusedTablePos.row + 1, rows.length - 1);
                            if (e.key === 'ArrowUp') this.focusedTablePos.row = Math.max(this.focusedTablePos.row - 1, 0);

                            const rowCells = Array.from(rows[this.focusedTablePos.row].querySelectorAll('td, th'));
                            if (e.key === 'ArrowRight') this.focusedTablePos.col = Math.min(this.focusedTablePos.col + 1, rowCells.length - 1);
                            if (e.key === 'ArrowLeft') this.focusedTablePos.col = Math.max(this.focusedTablePos.col - 1, 0);
                        }

                        this.updateTableFocus(table);
                    }
                }
            }
        },

        updateZipFocus(items) {
            items.forEach((item, idx) => {
                if (idx === this.focusedIndex) {
                    item.classList.add('preview-focused');
                    item.scrollIntoView({ block: 'nearest' });
                } else {
                    item.classList.remove('preview-focused');
                }
            });
        },

        updateTableFocus(table) {
            const rows = table.querySelectorAll('tr');
            rows.forEach((row, rIdx) => {
                const cells = row.querySelectorAll('td, th');
                cells.forEach((cell, cIdx) => {
                    if (rIdx === this.focusedTablePos.row && cIdx === this.focusedTablePos.col) {
                        cell.classList.add('preview-focused');
                        cell.scrollIntoView({ block: 'nearest' });
                    } else {
                        cell.classList.remove('preview-focused');
                    }
                });
            });
        },

        async loadDependency(key, globalName, url, isCss = false, integrity = null) {
            if (isCss) {
                if (document.querySelector(`link[href="${url}"]`)) return;
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = url;
                if (integrity) {
                    link.integrity = integrity;
                    link.crossOrigin = 'anonymous';
                }
                document.head.appendChild(link);
                return;
            }

            if (window[globalName]) {
                this[key] = window[globalName];
                return;
            }
            if (key && this[key]) return;

            return new Promise((resolve, reject) => {
                const script = document.createElement('script');
                script.src = url;
                if (integrity) {
                    script.integrity = integrity;
                    script.crossOrigin = 'anonymous';
                }
                script.onload = () => {
                    if (globalName) this[key] = window[globalName];
                    if (!this[key] && globalName === 'XLSX') this[key] = window.XLSX;
                    if (!this[key] && globalName === 'DOMPurify') this[key] = window.DOMPurify;
                    resolve();
                };
                script.onerror = () => reject(new Error(`Failed to load ${globalName}`));
                document.head.appendChild(script);
            });
        },

        async loadDOMPurify() {
            return this.loadDependency('domPurify', 'DOMPurify', this.options.dompurifyUrl, false, this.options.sri.dompurify);
        },

        async loadJSZip() {
            return this.loadDependency('jsZip', 'JSZip', this.options.jszipUrl, false, this.options.sri.jszip);
        },

        async loadMarked() {
            await this.loadDOMPurify();
            return this.loadDependency('marked', 'marked', this.options.markedUrl, false, this.options.sri.marked);
        },

        async loadMammoth() {
            await this.loadDOMPurify();
            return this.loadDependency('mammoth', 'mammoth', this.options.mammothUrl, false, this.options.sri.mammoth);
        },

        async loadKaTeX() {
            await this.loadDOMPurify();
            await this.loadDependency(null, null, this.options.katexCss, true, this.options.sri.katexCss);
            return this.loadDependency('katex', 'katex', this.options.katexUrl, false, this.options.sri.katexJs);
        },

        async loadXLSX() {
            await this.loadDOMPurify();
            return this.loadDependency('XLSX', 'XLSX', this.options.xlsxUrl, false, this.options.sri.xlsx);
        },

        getFileSystemExtension(url) {
            try {
                const path = new URL(url).pathname;
                return path.split('.').pop().toLowerCase();
            } catch (e) {
                return url.split('.').pop().toLowerCase();
            }
        },

        formatBytes(bytes, decimals = 1) {
            if (!+bytes) return '0 Bytes';
            const k = 1024;
            const dm = decimals < 0 ? 0 : decimals;
            const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return `${parseFloat((bytes / Math.pow(k, i)).toFixed(dm))} ${sizes[i]}`;
        },

        getFileName(url) {
            if (url instanceof Blob) return url.name || 'blob';
            try {
                const path = new URL(url).pathname;
                return path.split('/').pop() || 'file';
            } catch (e) {
                return url.split('/').pop() || 'file';
            }
        },

        initThemeSync() {
            if (this.themeObserver) return;
            const target = document.documentElement;
            this.applyTheme();

            this.themeObserver = new MutationObserver(() => this.applyTheme());
            this.themeObserver.observe(target, { attributes: true, attributeFilter: ['data-theme', 'class'] });
        },

        applyTheme() {
            const detected = this.detectTheme();
            const container = document.getElementById(this.options.overlayId);
            if (container) {
                container.setAttribute('data-theme', detected);
            }
            // Also apply to document for consistency if needed, but plugin scope is preferred
            document.querySelectorAll(`.${this.options.overlayId}, .preview-consent-overlay`).forEach(el => {
                el.setAttribute('data-theme', detected);
            });
        },

        detectTheme() {
            if (this.options.theme !== 'auto') return this.options.theme;

            const html = document.documentElement;
            const body = document.body;

            // Priority 1: data-theme attribute
            const themeAttr = html.getAttribute('data-theme') || body.getAttribute('data-theme');
            if (themeAttr) return themeAttr;

            // Priority 2: class names
            if (html.classList.contains('dark') || body.classList.contains('dark')) return 'dark';

            // Priority 3: system preference
            if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) return 'dark';

            return 'light';
        },

        async openPreview(url, extension) {
            const originalName = this.getFileName(url);
            this.showOverlay();
            this.applyTheme(); // Ensure theme is applied on open
            this.showLoading();
            this.focusedIndex = -1;
            this.focusedTablePos = { row: -1, col: -1 };

            const isLocalFile = window.location.protocol === 'file:';
            let blob = null;

            // Handle Blob objects passed directly
            try {
                if (['zip', 'odt'].includes(extension)) await this.loadJSZip();
                if (['md', 'markdown'].includes(extension)) await this.loadMarked();
                if (extension === 'docx') await this.loadMammoth();
                if (['tex', 'latex'].includes(extension)) await this.loadKaTeX();
                if (['xlsx', 'xls', 'ods'].includes(extension)) await this.loadXLSX();

                // Handle Blob objects passed directly
                if (url instanceof Blob) {
                    blob = url;
                    url = URL.createObjectURL(blob);
                }

                if (!blob) {
                    blob = await this.fetchWithProgress(url, (percent) => {
                        this.updateProgress(percent);
                    });
                }

                if (blob.size > this.options.maxFileSize && !this.largeFileOverride) {
                    this.showLargeFileConsentModal((blob.size / 1024 / 1024).toFixed(1), () => {
                        this.largeFileOverride = true;
                        this.openPreview(url, extension); // Retry with override flag
                    }, () => {
                        this.closePreview();
                    });
                    return; // Stop and wait for consent
                }

                if (extension === 'zip') {
                    this.currentZip = await this.jsZip.loadAsync(blob);
                    this.currentPath = '';
                    this.renderZipFolder();
                } else {
                    this.currentObjectUrl = url.startsWith('blob:') ? url : URL.createObjectURL(blob);
                    this.renderContent(this.currentObjectUrl, extension, blob, false, originalName);
                }
            } catch (error) {
                let msg = error.message;
                const asyncTypes = ['zip', 'md', 'markdown', 'docx', 'tex', 'latex', 'xlsx', 'xls', 'ods'];
                if (isLocalFile && !asyncTypes.includes(extension)) {
                    msg = "Browser security blocks direct file access for data files. Please use a local web server.";
                }
                this.renderError(msg);
            }
        },

        showOverlay() {
            let overlay = document.getElementById(this.options.overlayId);
            if (!overlay) {
                overlay = document.createElement('div');
                overlay.id = this.options.overlayId;

                const container = document.createElement('div');
                container.id = this.options.containerId;

                const closeBtn = document.createElement('button');
                closeBtn.id = this.options.closeId;
                closeBtn.innerHTML = '&times;';
                closeBtn.onclick = () => this.closePreview();

                overlay.appendChild(closeBtn);
                overlay.appendChild(container);
                document.body.appendChild(overlay);

                overlay.onclick = (e) => {
                    if (e.target === overlay) this.closePreview();
                };
            }
            overlay.style.display = 'flex';
            this.showEscHint();
        },

        showEscHint() {
            this.showHint('Press <strong>ESC</strong> to close the preview');
        },

        showNavHint() {
            this.showHint('Keyboard navigation supported: <strong>Arrows, Enter, ESC</strong>');
        },

        showHint(message, storageKey, type = 'info') {
            let toast = document.querySelector('.preview-hint-toast');
            if (!toast) {
                toast = document.createElement('div');
                toast.className = 'preview-hint-toast';
                document.body.appendChild(toast);
            }

            // Set type
            toast.classList.remove('info', 'warning');
            toast.classList.add(type);

            const icon = type === 'warning' ? '⚠️' : 'i';
            toast.innerHTML = `<div class="preview-hint-icon">${icon}</div> <span>${message}</span>`;

            // Clear any existing timeout
            if (this.hintTimeout) clearTimeout(this.hintTimeout);

            setTimeout(() => toast.classList.add('show'), 100);

            this.hintTimeout = setTimeout(() => {
                toast.classList.remove('show');
            }, 5000);

            if (storageKey) {
                localStorage.setItem(storageKey, 'true');
            }
        },

        // No longer needed but kept for API stability if used externally
        resetHints() {
            this.showHint('Hints are always enabled!', null);
        },

        closePreview() {
            const overlay = document.getElementById(this.options.overlayId);
            if (overlay) {
                overlay.style.display = 'none';
                const container = document.getElementById(this.options.containerId);

                // Privacy/Security: Clean up Blobs and Object URLs BEFORE clearing DOM
                const media = container.querySelectorAll('img, iframe, embed, video, audio');
                media.forEach(el => {
                    if (el.src && el.src.startsWith('blob:')) URL.revokeObjectURL(el.src);
                    el.src = '';
                    el.remove();
                });

                if (this.currentObjectUrl) {
                    URL.revokeObjectURL(this.currentObjectUrl);
                    this.currentObjectUrl = null;
                }

                container.innerHTML = '';
                this.currentZip = null;
                this.currentPath = '';
                this.focusedIndex = -1;
                this.focusedTablePos = { row: -1, col: -1 };
            }
        },

        showLoading() {
            const container = document.getElementById(this.options.containerId);
            container.innerHTML = `
                <div class="preview-loading-wrapper">
                    <div class="preview-loading">Loading...</div>
                    <div class="preview-progress-container">
                        <div class="preview-progress-bar"></div>
                    </div>
                    <div class="preview-progress-text">Initializing...</div>
                </div>
            `;
        },

        updateProgress(percent) {
            const bar = document.querySelector('.preview-progress-bar');
            const text = document.querySelector('.preview-progress-text');
            if (bar) bar.style.width = `${percent}%`;
            if (text) text.textContent = `${Math.round(percent)}% loaded`;
        },

        async fetchWithProgress(url, onProgress) {
            return new Promise((resolve, reject) => {
                const xhr = new XMLHttpRequest();
                xhr.open('GET', url);
                xhr.responseType = 'blob';

                xhr.onprogress = (event) => {
                    if (event.lengthComputable) {
                        const percent = (event.loaded / event.total) * 100;
                        onProgress(percent);
                    }
                };

                xhr.onload = () => {
                    if (xhr.status >= 200 && xhr.status < 300) {
                        resolve(xhr.response);
                    } else {
                        reject(new Error(`HTTP Error: ${xhr.status}`));
                    }
                };

                xhr.onerror = () => reject(new Error('Network error'));
                xhr.send();
            });
        },

        async renderContent(objectUrl, extension, blob, isZipEntry = false, originalName = null) {
            const container = document.getElementById(this.options.containerId);

            if (isZipEntry) {
                container.innerHTML = '';
                const backBtn = document.createElement('button');
                backBtn.className = 'preview-back-btn';
                backBtn.textContent = '← Back to Zip';
                backBtn.onclick = () => this.renderZipFolder();
                container.prepend(backBtn);
            } else {
                container.innerHTML = '';
            }

            const contentHeader = document.createElement('div');
            contentHeader.className = 'preview-content-header';

            const fileName = originalName || objectUrl.split('/').pop() || (isZipEntry ? objectUrl : `file.${extension}`);
            const fileSizeInfo = blob instanceof Blob ? this.formatBytes(blob.size) : (typeof blob === 'string' ? this.formatBytes(new Blob([blob]).size) : '');

            const fileInfoDiv = document.createElement('div');
            fileInfoDiv.className = 'preview-file-info';

            const nameSpan = document.createElement('span');
            nameSpan.className = 'preview-file-name';
            nameSpan.textContent = fileName;

            fileInfoDiv.appendChild(nameSpan);

            if (fileSizeInfo) {
                const sizeSpan = document.createElement('span');
                sizeSpan.className = 'preview-file-size';
                sizeSpan.textContent = `(${fileSizeInfo})`;
                fileInfoDiv.appendChild(sizeSpan);
            }

            const downloadLink = document.createElement('a');
            downloadLink.className = 'preview-header-download-btn';
            downloadLink.href = objectUrl;
            downloadLink.download = fileName;
            downloadLink.title = 'Download File';
            downloadLink.innerHTML = '<span>⬇️</span> Download';

            contentHeader.appendChild(fileInfoDiv);
            contentHeader.appendChild(downloadLink);
            container.appendChild(contentHeader);

            const contentArea = document.createElement('div');
            contentArea.className = 'preview-content-area';
            container.appendChild(contentArea);

            // Binary Validity Check (Prevent library crashes on 404/Error HTML pages)
            const binaryTypes = ['docx', 'xlsx', 'xls', 'xlsb', 'zip', 'pdf'];
            if (binaryTypes.includes(extension) && blob instanceof Blob && blob.size < 10000) {
                const text = await blob.slice(0, 50).text();
                if (text.trim().startsWith('<!DOCTYPE') || text.trim().startsWith('<html') || text.includes('404: Not Found')) {
                    this.renderError("File download failed: Received HTML error page instead of binary data. Check the link or local server.", contentArea);
                    return;
                }
            }

            const imageExtensions = ['png', 'jpg', 'jpeg', 'gif', 'webp', 'bmp', 'svg', 'tiff', 'tif'];

            if (imageExtensions.includes(extension)) {
                const img = document.createElement('img');
                img.src = objectUrl;
                img.alt = 'Preview';
                contentArea.appendChild(img);
            } else if (['md', 'markdown'].includes(extension)) {
                const text = typeof blob === 'string' ? blob : await blob.text();
                let html = this.marked ? this.marked.parse(text) : `<pre>${text}</pre>`;
                if (this.domPurify) html = this.domPurify.sanitize(html);
                const mdContainer = document.createElement('div');
                mdContainer.className = 'preview-markdown preview-scrollable';
                mdContainer.innerHTML = html;
                contentArea.appendChild(mdContainer);
            } else if (['csv', 'tsv'].includes(extension)) {
                if (blob) {
                    const text = typeof blob === 'string' ? blob : await blob.text();
                    const separator = extension === 'csv' ? ',' : '\t';
                    this.renderTable(text, separator, contentArea);
                } else {
                    this.renderError("Cannot read local data files for preview due to browser security.", contentArea);
                }
            } else if (['html', 'htm', 'pdf'].includes(extension)) {
                const iframe = document.createElement('iframe');
                iframe.src = objectUrl;
                iframe.width = '100%';
                iframe.height = '100%';
                iframe.title = 'File Preview';
                iframe.sandbox = 'allow-scripts allow-same-origin allow-forms allow-popups';
                contentArea.appendChild(iframe);
            } else if (['txt', 'log', 'json', 'xml', 'yaml', 'ini', 'tex', 'latex', 'doc', 'py', 'ps1', 'js', 'sh', 'bat', 'rb', 'pl', 'php', 'go', 'java', 'c', 'cpp', 'cs', 'sql', 'css'].includes(extension)) {
                let text = typeof blob === 'string' ? blob : await blob.text();
                if (extension === 'json') {
                    try { text = JSON.stringify(JSON.parse(text), null, 2); } catch (e) { }
                }

                if (['tex', 'latex'].includes(extension) && this.katex) {
                    const latexContainer = document.createElement('div');
                    latexContainer.className = 'preview-latex preview-scrollable';

                    // Extract body if it's a full document
                    let bodyMatch = text.match(/\\begin\{document\}([\s\S]*?)\\end\{document\}/);
                    let content = bodyMatch ? bodyMatch[1] : text;

                    // Basic cleanup of LaTeX commands
                    content = content
                        .replace(/\\documentstyle\[.*?\]\{.*?\}/g, '')
                        .replace(/\\usepackage\{.*?\}/g, '')
                        .replace(/\\setlength\{.*?\}/g, '')
                        .replace(/\\renewcommand\{.*?\}/g, '')
                        .replace(/\\leftline\{(.*?)\}/g, '$1\n')
                        .replace(/\\medskip/g, '\n')
                        .replace(/\\noindent/g, '')
                        .replace(/\\em\b/g, '')
                        .replace(/\\tt\b/g, '')
                        .replace(/\\bf\b/g, '')
                        .replace(/\\ref\{.*?\}/g, '[Ref]')
                        .replace(/\\footnote\{(.*?)\}/g, ' (Note: $1)')
                        .replace(/\\label\{.*?\}/g, '');

                    // Render block math: \[ ... \] or $$ ... $$
                    content = content.replace(/\$\$([\s\S]+?)\$\$/g, (m, g) => this.katex.renderToString(g, { throwOnError: false, displayMode: true }));
                    content = content.replace(/\\\[([\s\S]+?)\\\]/g, (m, g) => this.katex.renderToString(g, { throwOnError: false, displayMode: true }));

                    // Render environments: \begin{eqnarray} ... \end{eqnarray}
                    content = content.replace(/\\begin\{eqnarray\}([\s\S]+?)\\end\{eqnarray\}/g, (m, g) => this.katex.renderToString(g, { throwOnError: false, displayMode: true }));

                    // Render inline math: $ ... $ or \( ... \)
                    content = content.replace(/\$([\s\S]+?)\$/g, (m, g) => this.katex.renderToString(g, { throwOnError: false, displayMode: false }));
                    content = content.replace(/\\\(([\s\S]+?)\\\)/g, (m, g) => this.katex.renderToString(g, { throwOnError: false, displayMode: false }));

                    // Handle manual line breaks and paragraphs
                    content = content.trim().replace(/\n\s*\n/g, '</p><p>').replace(/\n/g, '<br>');

                    let html = `<p>${content}</p>`;
                    if (this.domPurify) html = this.domPurify.sanitize(html);
                    latexContainer.innerHTML = html;
                    contentArea.appendChild(latexContainer);
                } else {
                    const pre = document.createElement('pre');
                    pre.className = 'preview-text preview-scrollable';
                    pre.textContent = text;
                    contentArea.appendChild(pre);
                }
            } else if (['xlsx', 'xls', 'ods'].includes(extension)) {
                if (this.XLSX && blob) {
                    try {
                        const arrayBuffer = await blob.arrayBuffer();
                        const workbook = this.XLSX.read(arrayBuffer, { type: 'array' });

                        const sheetContainer = document.createElement('div');
                        sheetContainer.className = 'preview-spreadsheet preview-scrollable';

                        const renderSheet = (name) => {
                            let html = this.XLSX.utils.sheet_to_html(workbook.Sheets[name]);
                            if (this.domPurify) html = this.domPurify.sanitize(html);
                            sheetContainer.innerHTML = html;
                        };

                        if (workbook.SheetNames.length > 1) {
                            const tabs = document.createElement('div');
                            tabs.className = 'preview-spreadsheet-tabs';
                            workbook.SheetNames.forEach((name, idx) => {
                                const btn = document.createElement('button');
                                btn.className = 'spreadsheet-tab-btn' + (idx === 0 ? ' active' : '');
                                btn.textContent = name;
                                btn.onclick = () => {
                                    tabs.querySelectorAll('.spreadsheet-tab-btn').forEach(b => b.classList.remove('active'));
                                    btn.classList.add('active');
                                    renderSheet(name);
                                };
                                tabs.appendChild(btn);
                            });
                            contentArea.appendChild(tabs);
                        }

                        renderSheet(workbook.SheetNames[0]);
                        contentArea.appendChild(sheetContainer);
                    } catch (e) {
                        this.renderError(`Spreadsheet parsing failed: ${e.message}`, contentArea);
                    }
                    this.showNavHint();
                } else {
                    this.renderError("Spreadsheet library not loaded or invalid file contents.", contentArea);
                }
            } else if (extension === 'docx') {
                if (this.mammoth && blob) {
                    try {
                        const arrayBuffer = await blob.arrayBuffer();
                        const result = await this.mammoth.convertToHtml({ arrayBuffer: arrayBuffer });
                        const docxContainer = document.createElement('div');
                        docxContainer.className = 'preview-docx preview-scrollable';
                        let html = result.value;
                        if (this.domPurify) html = this.domPurify.sanitize(html);
                        docxContainer.innerHTML = html;
                        contentArea.appendChild(docxContainer);
                    } catch (e) {
                        this.renderError(`DOCX conversion failed: ${e.message}`, contentArea);
                    }
                } else {
                    this.renderError("DOCX preview library not loaded or file corrupted.", contentArea);
                }
            } else if (extension === 'odt') {
                if (this.jsZip && blob) {
                    try {
                        const zip = await this.jsZip.loadAsync(blob);
                        const contentXml = await zip.file('content.xml').async('text');
                        const parser = new DOMParser();
                        const xmlDoc = parser.parseFromString(contentXml, 'application/xml');
                        const body = xmlDoc.getElementsByTagName('office:body')[0];
                        const textContent = body ? body.getElementsByTagName('office:text')[0] : null;

                        if (textContent) {
                            const odtContainer = document.createElement('div');
                            odtContainer.className = 'preview-odt preview-scrollable';

                            // Simple recursive XML to HTML converter
                            const convertNode = (node) => {
                                let html = '';
                                if (node.nodeType === 3) { // Text node
                                    html += node.nodeValue.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
                                } else if (node.nodeType === 1) { // Element node
                                    const tagName = node.tagName.toLowerCase();
                                    let content = '';
                                    for (let child of node.childNodes) {
                                        content += convertNode(child);
                                    }

                                    if (tagName === 'text:p') html += `<p>${content}</p>`;
                                    else if (tagName === 'text:h') {
                                        const level = node.getAttribute('text:outline-level') || '1';
                                        html += `<h${level}>${content}</h${level}>`;
                                    } else if (tagName === 'text:list') html += `<ul>${content}</ul>`;
                                    else if (tagName === 'text:list-item') html += `<li>${content}</li>`;
                                    else if (tagName === 'text:span') html += `<span>${content}</span>`;
                                    else html += content;
                                }
                                return html;
                            };

                            let html = convertNode(textContent);
                            if (this.domPurify) html = this.domPurify.sanitize(html);
                            odtContainer.innerHTML = html;
                            contentArea.appendChild(odtContainer);
                        } else {
                            throw new Error("Could not find text content in ODT.");
                        }
                    } catch (e) {
                        this.renderError(`ODT preview failed: ${e.message}`, contentArea);
                    }
                } else {
                    this.renderError("ODT preview requires JSZip to be loaded.", contentArea);
                }
            } else if (extension === 'rtf') {
                try {
                    const text = typeof blob === 'string' ? blob : await blob.text();
                    // Simple RTF to Text extractor (strips RTF controls)
                    let cleanText = text
                        .replace(/\\rtf1[\s\S]*?\\/g, '') // Basic header strip
                        .replace(/\{[\s\S]*?\}/g, '') // Strip groups
                        .replace(/\\[a-zA-Z]+\d*\b\s?/g, '') // Strip controls with optional numbers and space
                        .replace(/\\'[0-9a-fA-F]{2}/g, '') // Strip hex chars
                        .replace(/[\r\n]+/g, '\n') // Normalize newlines
                        .trim();

                    const pre = document.createElement('pre');
                    pre.className = 'preview-text preview-scrollable';
                    pre.textContent = cleanText || "Could not extract text from RTF.";
                    contentArea.appendChild(pre);
                } catch (e) {
                    this.renderError(`RTF preview failed: ${e.message}`, contentArea);
                }
            } else {
                const fileName = objectUrl.split('/').pop() || `download.${extension}`;
                this.renderError(`Preview not supported for .${extension} files.`, contentArea, false, objectUrl, fileName);
            }
        },

        renderTable(text, separator, parent) {
            const table = document.createElement('table');
            table.className = 'preview-table';

            const lines = text.trim().split('\n');
            lines.forEach((line, index) => {
                const row = document.createElement('tr');
                const cells = line.split(separator);

                cells.forEach(cellText => {
                    const cell = document.createElement(index === 0 ? 'th' : 'td');
                    cell.textContent = cellText.trim();
                    row.appendChild(cell);
                });
                table.appendChild(row);
            });

            const scrollWrapper = document.createElement('div');
            scrollWrapper.className = 'table-scroll-wrapper preview-scrollable';
            scrollWrapper.appendChild(table);
            parent.appendChild(scrollWrapper);
            this.showNavHint();
        },

        renderZipFolder() {
            const container = document.getElementById(this.options.containerId);
            container.innerHTML = '';
            this.focusedIndex = -1;

            const header = document.createElement('div');
            header.className = 'zip-header';
            header.innerHTML = `<h3>Zip Explorer: /${this.currentPath}</h3>`;
            container.appendChild(header);
            this.showNavHint();

            const list = document.createElement('ul');
            list.className = 'zip-list';
            container.appendChild(list);

            if (this.currentPath) {
                const upItem = document.createElement('li');
                upItem.className = 'zip-item zip-folder';
                upItem.innerHTML = '<span>📁 .. (Up)</span>';
                upItem.onclick = () => {
                    const parts = this.currentPath.split('/').filter(p => p);
                    parts.pop();
                    this.currentPath = parts.length ? parts.join('/') + '/' : '';
                    this.renderZipFolder();
                };
                list.appendChild(upItem);
            }

            const children = new Set();
            const folders = new Set();

            Object.keys(this.currentZip.files).forEach(name => {
                if (!name.startsWith(this.currentPath) || name === this.currentPath) return;

                const relative = name.substring(this.currentPath.length);
                const parts = relative.split('/');
                const primary = parts[0];

                if (parts.length > 1 || (parts.length === 1 && name.endsWith('/'))) {
                    if (primary) folders.add(primary);
                } else {
                    children.add(primary);
                }
            });

            Array.from(folders).sort().forEach(folderName => {
                const item = document.createElement('li');
                item.className = 'zip-item zip-folder';
                item.innerHTML = `<span>📁 ${folderName}</span>`;
                item.onclick = () => {
                    this.currentPath += folderName + '/';
                    this.renderZipFolder();
                };
                list.appendChild(item);
            });

            Array.from(children).sort().forEach(fileName => {
                const item = document.createElement('li');
                item.className = 'zip-item zip-file';
                item.innerHTML = `<span>📄 ${fileName}</span>`;
                item.onclick = () => this.previewZipEntry(this.currentPath + fileName);
                list.appendChild(item);
            });
        },

        async previewZipEntry(name) {
            const entry = this.currentZip.files[name];
            const extension = name.split('.').pop().toLowerCase();
            this.showLoading();

            try {
                const binaryTypes = [
                    'png', 'jpg', 'jpeg', 'gif', 'webp', 'bmp', 'svg', 'tiff', 'tif', 'pdf',
                    'html', 'htm', 'docx', 'odt', 'xlsx', 'xls', 'ods', 'pptx', 'ppt', 'odp'
                ];
                const textTypes = ['csv', 'tsv', 'txt', 'log', 'json', 'xml', 'yaml', 'ini', 'md', 'markdown', 'tex', 'latex'];

                if (binaryTypes.includes(extension)) {
                    const blob = await entry.async('blob');
                    const url = URL.createObjectURL(blob);
                    this.renderContent(url, extension, blob, true, name.split('/').pop());
                } else if (textTypes.includes(extension)) {
                    const text = await entry.async('string');
                    this.renderContent(name, extension, text, true, name.split('/').pop());
                } else {
                    const blob = await entry.async('blob');
                    const url = URL.createObjectURL(blob);
                    this.renderContent(url, extension, blob, true, name.split('/').pop());
                }
            } catch (e) {
                this.renderError(e.message);
            }
        },

        renderError(message, parent, isZipEntry = false, downloadUrl = null, downloadName = null) {
            const container = parent || document.getElementById(this.options.containerId);
            if (!parent) container.innerHTML = '';

            if (isZipEntry) {
                const backBtn = document.createElement('button');
                backBtn.className = 'preview-back-btn';
                backBtn.textContent = '← Back to Zip';
                backBtn.onclick = () => this.renderZipFolder();
                container.prepend(backBtn);
            }

            const errorDiv = document.createElement('div');
            errorDiv.className = 'preview-error';

            const msgSpan = document.createElement('span');
            if (downloadUrl && message.includes('not supported')) {
                msgSpan.textContent = `This extension is not supported for preview and needs to be downloaded and opened with an appropriate application.`;
            } else {
                msgSpan.textContent = message.startsWith('Error:') ? message : `Error: ${message}`;
            }
            errorDiv.appendChild(msgSpan);

            if (downloadUrl) {
                const downloadContainer = document.createElement('div');
                downloadContainer.className = 'preview-download-container';

                const helpText = document.createElement('p');
                helpText.className = 'preview-download-help';
                helpText.textContent = "Don't forget to delete the file afterwards when it is no longer needed.";

                const downloadBtn = document.createElement('a');
                downloadBtn.className = 'preview-download-btn';
                downloadBtn.href = downloadUrl;
                downloadBtn.download = downloadName || 'download';
                downloadBtn.textContent = 'Download File';

                downloadContainer.appendChild(helpText);
                downloadContainer.appendChild(downloadBtn);
                errorDiv.appendChild(downloadContainer);
            }

            container.appendChild(errorDiv);
        },

        showLargeFileConsentModal(fileSizeMB, onConfirm, onCancel) {
            let overlay = document.querySelector('.preview-consent-overlay');
            if (overlay) overlay.remove();

            overlay = document.createElement('div');
            overlay.className = 'preview-consent-overlay';
            overlay.style.display = 'flex';

            overlay.innerHTML = `
                <div class="preview-consent-modal">
                    <h3>⚠️ Large File Warning</h3>
                    <div class="preview-consent-content">
                        <div class="preview-consent-warning-box">
                            <strong>Performance Risk:</strong> Attempting to preview a file of this size (${fileSizeMB}MB) directly in the browser may cause high memory usage, page unresponsiveness, or tab crashes.
                        </div>
                        <p>The standard maximum limit is <strong>${(this.options.maxFileSize / 1024 / 1024).toFixed(0)}MB</strong> to ensure optimal performance and prevent browser lockups.</p>
                        
                        <label class="preview-consent-checkbox-row">
                            <input type="checkbox" id="preview-consent-understand-size">
                            <span>I understand the potential performance consequences and wish to proceed anyway.</span>
                        </label>
                    </div>
                    <div class="preview-consent-actions">
                        <button class="preview-consent-btn cancel">Cancel</button>
                        <button class="preview-consent-btn proceed" disabled>Attempt Preview</button>
                    </div>
                </div>
            `;

            document.body.appendChild(overlay);

            const understandBtn = overlay.querySelector('#preview-consent-understand-size');
            const proceedBtn = overlay.querySelector('.preview-consent-btn.proceed');
            const cancelBtn = overlay.querySelector('.preview-consent-btn.cancel');

            understandBtn.onchange = () => {
                proceedBtn.disabled = !understandBtn.checked;
            };

            cancelBtn.onclick = () => {
                overlay.remove();
                if (onCancel) onCancel();
            };

            proceedBtn.onclick = () => {
                overlay.remove();
                if (onConfirm) onConfirm();
            };
        },

        showConsentModal(onConfirm) {
            this.sessionConsentGiven = false;
            let overlay = document.querySelector('.preview-consent-overlay');
            if (overlay) overlay.remove();

            overlay = document.createElement('div');
            overlay.className = 'preview-consent-overlay';
            overlay.style.display = 'flex';

            overlay.innerHTML = `
                <div class="preview-consent-modal">
                    <h3>⚠️ Security Warning</h3>
                    <div class="preview-consent-content">
                        <div class="preview-consent-warning-box">
                            <strong>Harmful Payload Risk:</strong> Even files from secure environments may contain trojanized payloads (macros, scripts, or exploits) designed to target your machine.
                        </div>
                        <p>It is prudent to <strong>scan all downloaded files</strong> before opening them.</p>
                        <p>For maximum security, open sensitive files in a <strong>myDRE Workspace</strong> with limited outbound whitelisting to contain any potential threats.</p>
                        
                        <label class="preview-consent-checkbox-row">
                            <input type="checkbox" id="preview-consent-understand">
                            <span>I understand the risks and have taken appropriate security measures.</span>
                        </label>
                        
                        <label class="preview-consent-checkbox-row">
                            <input type="checkbox" id="preview-consent-session">
                            <span>Don't show this again for the current session.</span>
                        </label>
                    </div>
                    <div class="preview-consent-actions">
                        <button class="preview-consent-btn cancel">Cancel</button>
                        <button class="preview-consent-btn proceed" disabled>Proceed to Download</button>
                    </div>
                </div>
            `;

            document.body.appendChild(overlay);

            const understandBtn = overlay.querySelector('#preview-consent-understand');
            const sessionBtn = overlay.querySelector('#preview-consent-session');
            const proceedBtn = overlay.querySelector('.preview-consent-btn.proceed');
            const cancelBtn = overlay.querySelector('.preview-consent-btn.cancel');

            understandBtn.addEventListener('change', () => {
                proceedBtn.disabled = !understandBtn.checked;
            });

            proceedBtn.addEventListener('click', () => {
                if (sessionBtn.checked) {
                    this.sessionConsentGiven = true;
                }
                overlay.remove();
                if (onConfirm) onConfirm();
            });

            cancelBtn.addEventListener('click', () => {
                overlay.remove();
            });
        }
    };

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => PreviewPlugin.init());
    } else {
        PreviewPlugin.init();
    }

    window.PreviewPlugin = PreviewPlugin;
})();
