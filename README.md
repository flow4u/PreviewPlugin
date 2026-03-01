# PreviewPlugin

`PreviewPlugin` is a standalone, high-performance, client-side library designed to preview 30+ file formats directly in the browser. It prioritizes user privacy, security, and accessibility.

## Key Features

- **Instant Previews**: View documents, images, and code without leaving the page.
- **Global Download**: A persistent download option in every preview window.
- **Download Consent**: A mandatory security warning intercepts all downloads, requiring explicit acknowledgment of harmful payload risks before proceeding.
- **Download Fallback**: Graceful handling of unsupported formats with a secure download path.
- **Scripting & Code Support**: High-performance text rendering for 15+ programming languages.
- **Zip Explorer**: Browse and preview files inside ZIP archives without extracting them.
- **Accessibility**: Full keyboard navigation (ESC, Arrows, Enter) and screen-reader friendly design.

## Supported Formats

| Category | Extensions |
| :--- | :--- |
| **Documents** | `pdf`, `docx`, `odt`, `rtf`, `txt`, `md` |
| **Spreadsheets** | `xlsx`, `xls`, `ods`, `csv`, `tsv`, `json` |
| **Images** | `png`, `jpg`, `jpeg`, `gif`, `webp`, `bmp`, `svg`, `tiff` |
| **Scripts & Code**| `py`, `js`, `sh`, `bat`, `rb`, `pl`, `php`, `go`, `java`, `c`, `cs`, `sql`, `css`, `ps1` |
| **Archives** | `zip` |

## Quick Start

1. **Include Files**: Add `preview-plugin.css` and `preview-plugin.js` to your HTML.
2. **Initialize**:
   ```javascript
   const preview = new PreviewPlugin({ selector: '[data-preview]' });
   preview.init();
   ```
3. **Usage**: Add the `data-preview` attribute to any link.
   ```html
   <a href="path/to/doc.pdf" data-preview>View Document</a>
   ```

## Privacy & Security

- **Zero Data Transmission**: All file processing occurs in the browser. No data leaves your machine.
- **Zero Residual Data**: `URL.revokeObjectURL` is called on all temporary assets upon modal close.
- **Production Hardened**: Subresource Integrity (SRI), DOMPurify sanitization, Iframe sandboxing, and resource limits.
- **Mandatory Download Consent**: Every download requires user acknowledgment of harmful payload risks. Options include per-download consent or session-level opt-out.
- **Regulatory Alignment**: Controls mapped to ISO/IEC 27001:2022 Annex A (**avg. 8.2/10**) and NIS2 Article 21 (**avg. 7.8/10**).

### Security Documentation
| Document | Purpose |
| :--- | :--- |
| [SECURITY_AUDIT.md](SECURITY_AUDIT.md) | Risk register & technical mitigations |
| [SECURITY_IMPACT_ASSESSMENT.md](SECURITY_IMPACT_ASSESSMENT.md) | Detailed risk analysis + ISO 27001 & NIS2 compliance mapping |
| [SECURITY_COMPLIANCE_REPORT.md](SECURITY_COMPLIANCE_REPORT.md) | Checklist compliance report |

---
*Developed with focus on Privacy, Security, and Performance.*
