### 1. File Details in Header
- **Feature**: Displays the real filename and a human-readable size (e.g., `KB`, `MB`) to the left of the download button.
- **Fix**: Resolved an issue where blob UUIDs were displayed instead of the original filename.
- **Implementation**: Uses a new `formatBytes` utility and robust `getFileName` extraction.

### 2. Large File Handling & Progress Bar
- **Progress Bar**: Added a dynamic progress bar that displays the download percentage for large files.
- **Large File Consent**: Files exceeding 25MB trigger a security and performance warning. Users can now choose to override this limit if they understand the risks (specifically for the new 50MB and 150MB XML samples).
- **Implementation**: Replaced standard `fetch` with `XMLHttpRequest` to track download progress reliably.

### 3. Dark & Light Mode Support
- **Automatic Sync**: The plugin now detects the theme from the host page (via `data-theme` attribute, `dark` class, or system preference).
- **Real-time Updates**: A `MutationObserver` ensures the preview modal updates instantly if the page theme changes while it's open.
- **Demo Toggle**: Added a theme toggle button to `index.html` to showcase the transition.

### 4. Enhanced Sample Files
- **Documents & Code**: All script samples (`.py`, `.js`, `.sh`) and text/markdown samples have been updated to be at least 2 pages long.
- **Stress Testing**: Samples now include "very long lines" (up to 1200 characters) to verify that the UI handles wrapping and scrolling without layout breaks.

### 5. Removal of Legacy .doc Support
- **Modernization**: Removed support for the legacy binary `.doc` format to focus on modern `.docx` and OpenDocument standards.
- **Clean up**: Deleted `assets/sample.doc` and removed the preview link from the demo page.

## Verified Assets
- `assets/sample_50mb.xml`: ~50MB XML dataset (Local only).
- `assets/sample_150mb.xml`: ~95MB XML dataset (Local only, reduced for GitHub compatibility).
- `assets/sample.js`, `assets/sample.py`, `assets/sample.sh`: Expanded to >60KB with long lines.

## Git & GitHub Integration
- **Status**: Local repository successfully linked to `https://github.com/flow4u/PreviewPlugin.git`.
- **Primary Branch**: `main`.
- **Initial Push**: All core project files, documentation, and small/medium assets have been pushed.
- **Exclusions**: `assets/sample_50mb.xml` and `assets/sample_150mb.xml` are excluded via `.gitignore` to comply with GitHub file size limits.

---
*PreviewPlugin — Production-ready, compliance-mapped, privacy-first.*
