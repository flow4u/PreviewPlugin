# PreviewPlugin — Test Plan

**Version**: 1.0
**Date**: 2026-02-20
**Scope**: Manual Smoke Tests and User Acceptance Tests (UAT)
**Environment**: Local web server (`python3 -m http.server 8080` → `http://localhost:8080`)
**Tester prerequisite**: Browser with DevTools available. No special accounts required.

---

## How to Read This Document

Each test case includes:
- **Story / Anti-Story**: What the user or attacker is trying to do.
- **Steps**: What to click/do.
- **Expect (✅)**: What MUST happen — passing criteria.
- **Do NOT see (❌)**: What must NOT happen — failure indicators.

---

## Part 1 — Smoke Tests

These are fast, top-level checks after every deployment. The entire suite should take < 10 minutes.

---

### S-01 — Page Loads Without Errors
| | |
| :--- | :--- |
| **Story** | As a user I open the demo page and see it render correctly. |
| **Steps** | 1. Navigate to `http://localhost:8080`. |
| **Expect ✅** | Page displays "PreviewPlugin Demo", file list visible, no broken layout. |
| **Do NOT see ❌** | Browser console errors (red), blank page, "Failed to fetch" errors. |

---

### S-02 — Image Preview Opens and Closes
| | |
| :--- | :--- |
| **Story** | As a user I click an image link and see it in the modal. |
| **Steps** | 1. Click `sample.png`. 2. Press `ESC`. |
| **Expect ✅** | Modal opens with image rendered. ESC closes modal, page returns to normal. |
| **Do NOT see ❌** | Image downloaded instead of previewed. Modal stays open after ESC. |

---

### S-03 — PDF Preview Renders in Iframe
| | |
| :--- | :--- |
| **Story** | As a user I click a PDF and view it without downloading. |
| **Steps** | 1. Click `sample.pdf`. |
| **Expect ✅** | PDF renders inside the preview modal in an embedded iframe. Download button visible in header. |
| **Do NOT see ❌** | Browser "Save As" dialog. Blank white area inside modal. |

---

### S-04 — Markdown Preview Renders Formatted
| | |
| :--- | :--- |
| **Story** | As a user I click a Markdown file and see it rendered as HTML, not raw text. |
| **Steps** | 1. Click `sample.md`. |
| **Expect ✅** | Headings, bold, italics, lists rendered. Code blocks styled. |
| **Do NOT see ❌** | Raw `# Title` or `**bold**` syntax. JavaScript `alert()` executing. |

---

### S-05 — Download Consent Modal Appears
| | |
| :--- | :--- |
| **Story** | As a user I click Download on any preview and am warned about risks. |
| **Steps** | 1. Click `sample.md` to open preview. 2. Click the **Download** button. |
| **Expect ✅** | Security Warning modal appears. "Proceed to Download" button is **greyed out / disabled**. |
| **Do NOT see ❌** | File downloads immediately without warning. Modal is missing. |

---

### S-06 — Unsupported File Shows Fallback UI
| | |
| :--- | :--- |
| **Story** | As a user I click an unsupported file and get a clear message. |
| **Steps** | 1. Click `sample.exe (Unsupported)`. |
| **Expect ✅** | Modal opens with a friendly message explaining the format is not supported. A Download button is visibly presented. |
| **Do NOT see ❌** | Silent failure, blank modal, or unhandled error thrown. |

---

## Part 2 — Acceptance Tests (User Stories)

---

### AT-01 — Spreadsheet Preview with Tab Navigation
| | |
| :--- | :--- |
| **Story** | As an analyst I preview an Excel file and switch between sheets. |
| **Steps** | 1. Click `sample.xlsx`. 2. Wait for sheet tabs to appear. 3. Click a secondary sheet tab. |
| **Expect ✅** | Table renders with headers highlighted. Tab buttons are large and clearly labeled. Clicking tabs switches the displayed data. |
| **Do NOT see ❌** | Only first sheet visible with no way to navigate. Tabs overlapping or unclickable. |

---

### AT-02 — ZIP Archive Navigation
| | |
| :--- | :--- |
| **Story** | As a reviewer I browse a ZIP archive to find a file without extracting it. |
| **Steps** | 1. Click `sample.zip`. 2. Browse into a subfolder (if present). 3. Click a supported file inside the ZIP (e.g. `.txt`). |
| **Expect ✅** | ZIP contents listed as a navigable directory. Clicking a file inside opens its preview. Back button navigates up. |
| **Do NOT see ❌** | Browser prompts to save the ZIP. Error message about extraction. |

---

### AT-03 — Code / Script Preview
| | |
| :--- | :--- |
| **Story** | As a developer I click a `.py` file and see its source code cleanly. |
| **Steps** | 1. Click `sample.py`. |
| **Expect ✅** | Source code displayed in monospace font. Whitespace and indentation preserved. |
| **Do NOT see ❌** | Python code executed by the browser. File downloaded. Garbled characters. |

---

### AT-04 — Download Consent: Proceed After Acknowledgment
| | |
| :--- | :--- |
| **Story** | As a user I acknowledge the risk and my download starts immediately. |
| **Steps** | 1. Open any file preview. 2. Click Download. 3. Check "I understand the risks...". 4. Click "Proceed to Download". |
| **Expect ✅** | Modal closes. Browser starts downloading the file. Amber warning toast appears. Consent modal does **not** reappear from the download action. |
| **Do NOT see ❌** | Consent modal reappears a second time for the same click. No download initiated. |

---

### AT-05 — Download Consent: Cancel Aborts Download
| | |
| :--- | :--- |
| **Story** | As a cautious user I reconsider and cancel the download. |
| **Steps** | 1. Open any file preview. 2. Click Download. 3. Click **Cancel** in the consent modal. |
| **Expect ✅** | Modal dismisses. No download starts. Preview remains open. |
| **Do NOT see ❌** | Download starts despite cancellation. |

---

### AT-06 — Session Opt-Out for Consent
| | |
| :--- | :--- |
| **Story** | As a power user processing many files I opt out of the consent dialog for the session. |
| **Steps** | 1. Open a file preview. 2. Click Download. 3. Check BOTH "I understand" AND "Don't show this again for the current session". 4. Click Proceed. 5. Click Download again on the same or a different file. |
| **Expect ✅** | Step 5: No consent modal appears. Download proceeds directly. Amber warning toast still appears. |
| **Do NOT see ❌** | Consent modal appears again. Download skipped entirely. |

---

### AT-07 — Session Consent Resets on Refresh
| | |
| :--- | :--- |
| **Story** | As a security officer I verify that session opt-out does not survive a page reload. |
| **Steps** | 1. Complete AT-06 to activate session opt-out. 2. Refresh the browser page (`F5`). 3. Open any file preview and click Download. |
| **Expect ✅** | Consent modal **reappears** after page refresh, confirming session state was reset. |
| **Do NOT see ❌** | Download proceeds without the modal after refresh. |

---

### AT-08 — Keyboard Navigation
| | |
| :--- | :--- |
| **Story** | As a keyboard-only user I navigate the plugin without a mouse. |
| **Steps** | 1. Open a ZIP or spreadsheet preview. 2. Use `Arrow Keys` to move focus. 3. Press `ESC` to close. |
| **Expect ✅** | Focus moves to next row/file entry. Focused item highlighted with a visible outline. ESC closes modal. |
| **Do NOT see ❌** | Keyboard input causes errors. Focus "trapped" anywhere. ESC doesn't close. |

---

### AT-09 — Memory Cleanup on Close
| | |
| :--- | :--- |
| **Story** | As a privacy-conscious user I verify no file data lingers after closing the preview. |
| **Steps** | 1. Open DevTools → Memory tab. 2. Open and close a large file preview. 3. Force garbage collection. |
| **Expect ✅** | No active `blob:` URLs remain in memory for the closed preview. Console has no memory-leak warnings. |
| **Do NOT see ❌** | Blob URLs remain allocated after close. Memory usage grows unboundedly with each open/close cycle. |

---

## Part 3 — Security Anti-User Stories (Negative Tests)

These tests verify that the plugin resists abuse. They should all result in **no harmful action occurring**.

---

### SEC-01 — XSS in Markdown File: Script Must Not Execute
| | |
| :--- | :--- |
| **Anti-Story** | As an attacker I embed a `<script>alert('XSS')</script>` in a `.md` file. |
| **Steps** | 1. Create a `.md` file containing `<script>alert('XSS')</script>`. 2. Serve it via the local server. 3. Open it in the preview. |
| **Expect ✅** | No alert dialog appears. Script tag is either stripped or rendered as escaped text. |
| **Do NOT see ❌** | An alert box appearing. Any JavaScript executing from file content. |

---

### SEC-02 — XSS in HTML File: Sandbox Must Contain It
| | |
| :--- | :--- |
| **Anti-Story** | As an attacker I craft an HTML file that tries to access `window.parent`. |
| **Steps** | 1. Create an HTML file with `<script>window.parent.document.title = 'HACKED';</script>`. 2. Preview it. |
| **Expect ✅** | Page title is unchanged. Browser may log a sandbox violation in DevTools. |
| **Do NOT see ❌** | Page title changes to "HACKED". Any data from the host page is accessible. |

---

### SEC-03 — Oversized File is Rejected
| | |
| :--- | :--- |
| **Anti-Story** | As an attacker I attempt to crash the reviewer's browser with a 50MB file. |
| **Steps** | 1. Generate a file larger than 25MB. 2. Link it with `data-preview`. 3. Click the link. |
| **Expect ✅** | Error message displayed: *"File too large … Max allowed is 25MB."* No parsing or loading occurs. |
| **Do NOT see ❌** | Plugin attempts to load the file. Browser tab freezes or crashes. |

---

### SEC-04 — Download Without Consent Must Be Blocked
| | |
| :--- | :--- |
| **Anti-Story** | As an impatient user I try to bypass the "I understand" requirement. |
| **Steps** | 1. Open any file preview. 2. Click Download. 3. Try to click "Proceed to Download" **without** checking the checkbox. |
| **Expect ✅** | "Proceed to Download" button remains disabled and does not respond to clicks. |
| **Do NOT see ❌** | Download starts. Button triggers any action while checkbox is unchecked. |

---

### SEC-05 — No Sensitive Data in Browser Storage
| | |
| :--- | :--- |
| **Anti-Story** | As an auditor I verify no file data is persisted by the plugin. |
| **Steps** | 1. Open and preview a sensitive-looking file. 2. Close the modal. 3. Open DevTools → Application → Local Storage / Session Storage / Cookies. |
| **Expect ✅** | No plugin-specific keys in any storage. No file content or metadata stored. |
| **Do NOT see ❌** | File content, filename, or blob URL stored in `localStorage` or `sessionStorage`. |

---

### SEC-06 — SRI Tamper Detection
| | |
| :--- | :--- |
| **Anti-Story** | As an attacker I compromise a CDN library and serve a modified version. |
| **Steps** | 1. Open DevTools → Network tab. 2. Open a DOCX file (loads Mammoth.js). 3. Inspect the Mammoth request — verify the `integrity` attribute is present on the `<script>` tag. 4. (Optional advanced) Modify the hash in `preview-plugin.js` to a wrong value and reload. |
| **Expect ✅** | Network request for Mammoth shows `integrity` header. If hash is wrong: browser blocks the script entirely; plugin shows an error rather than loading. |
| **Do NOT see ❌** | Library loads without an `integrity` attribute. A tampered script executes silently. |

---

### SEC-07 — Console Must Not Leak File Content
| | |
| :--- | :--- |
| **Anti-Story** | As an auditor I verify that previewing a file does not expose its contents in the browser console. |
| **Steps** | 1. Open DevTools → Console. 2. Preview a document containing sensitive text. 3. Close preview. |
| **Expect ✅** | Console shows only operational logs (library loads, SRI checks). No file content logged at any level. |
| **Do NOT see ❌** | File body or metadata printed in any `console.log`, `console.warn`, or `console.error` call. |

---

## Appendix — Test Result Record

| Test ID | Description | Pass / Fail | Notes | Tester | Date |
| :--- | :--- | :---: | :--- | :--- | :--- |
| S-01 | Page loads without errors | | | | |
| S-02 | Image preview opens/closes | | | | |
| S-03 | PDF renders in iframe | | | | |
| S-04 | Markdown renders formatted | | | | |
| S-05 | Download consent modal appears | | | | |
| S-06 | Unsupported file fallback UI | | | | |
| AT-01 | Spreadsheet tab navigation | | | | |
| AT-02 | ZIP archive navigation | | | | |
| AT-03 | Code/script preview | | | | |
| AT-04 | Download proceeds after consent | | | | |
| AT-05 | Cancel aborts download | | | | |
| AT-06 | Session opt-out for consent | | | | |
| AT-07 | Session resets on refresh | | | | |
| AT-08 | Keyboard navigation | | | | |
| AT-09 | Memory cleanup on close | | | | |
| SEC-01 | XSS in Markdown blocked | | | | |
| SEC-02 | XSS in HTML sandboxed | | | | |
| SEC-03 | Oversized file rejected | | | | |
| SEC-04 | Consent bypass impossible | | | | |
| SEC-05 | No data in browser storage | | | | |
| SEC-06 | SRI tamper detection | | | | |
| SEC-07 | Console does not leak content | | | | |

---
*Test Plan version 1.0 | PreviewPlugin 2026-02-20*
