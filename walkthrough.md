# PreviewPlugin — Implementation Walkthrough

## 1. Overview
The `PreviewPlugin` is a client-side library that intercepts file links and renders them in a secure modal. This walkthrough covers all major features and the security posture.

## 2. Key Features

### Global Download & Consent
- Every preview window has a **Download** button.
- **Mandatory consent dialog** blocks all downloads until the user acknowledges the harmful payload risk.
- **Session opt-out**: "Don't show again for this session" bypasses the modal until page refresh.
- Amber **⚠️ warning toasts** appear at every download event.

### Scripting & Code Support
- Supports 15+ languages (Python, Bash, PowerShell, SQL, etc.) with mono-spaced rendering.

### Interactive ZIP Explorer
- Navigate and preview files within a ZIP archive in-browser — zero extraction.

## 3. Security Hardening

| Control | Implementation |
| :--- | :--- |
| SRI (SHA-512) | All CDN-hosted dependencies |
| DOMPurify | All parsed HTML output |
| Iframe Sandboxing | PDF / HTML previews |
| File Size Limit | 25MB global default |
| Download Consent | Mandatory per-download blocking dialog |

## 4. Regulatory Compliance

| Framework | Score | Key Controls |
| :--- | :---: | :--- |
| **ISO/IEC 27001:2022** | **8.2/10** | A.8.28, A.8.20, A.5.14, A.8.9 |
| **NIS2 Article 21** | **7.8/10** | (d) Supply Chain, (e) Secure Dev, (h) Cyber Hygiene |

Full scoring rationale in [SECURITY_IMPACT_ASSESSMENT.md](SECURITY_IMPACT_ASSESSMENT.md) — Section 6.

## 5. Security Documentation
- [SECURITY_AUDIT.md](SECURITY_AUDIT.md)
- [SECURITY_IMPACT_ASSESSMENT.md](SECURITY_IMPACT_ASSESSMENT.md)
- [SECURITY_COMPLIANCE_REPORT.md](SECURITY_COMPLIANCE_REPORT.md)

---
*PreviewPlugin — Production-ready, compliance-mapped, privacy-first.*
