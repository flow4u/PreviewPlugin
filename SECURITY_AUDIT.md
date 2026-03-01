# PreviewPlugin Security Audit

This document outlines security considerations and mitigations implemented in the `PreviewPlugin`. It covers technical implementation, human-centric security measures, and regulatory alignment.

## Core Security Principles

1. **Zero-Trust Client Rendering**: All file parsing is performed client-side. No data is sent to external servers.
2. **Memory Safety & Privacy**: Blobs and Object URLs are revoked immediately upon closing to ensure no memory leakage.
3. **Defense in Depth**: Combines technical controls (SRI, Sanitization, Sandboxing) with resource limits and user education.
4. **Baseline Compliance**: Audited against the [Developer Secure Coding Checklist](Developer%20Secure%20Coding%20Checklist.md).
5. **Regulatory Alignment**: Controls mapped to ISO/IEC 27001:2022 Annex A and NIS2 Article 21 — see [Security Impact Assessment](SECURITY_IMPACT_ASSESSMENT.md) §6.

## Identified Risks & Mitigations

### 1. Cross-Site Scripting (XSS)
- **Mitigation**:
    - **DOMPurify**: Sanitizes all HTML from office/markdown parsers before rendering.
    - **Execution Isolation**: PDF and HTML previews rendered in sandboxed iframes.
    - **Safe Sinks**: Code, CSV, and plain-text files use `textContent` exclusively.

### 2. Dependency Trust & Supply Chain
- **Risk**: Trusting third-party CDNs (cdnjs) for `XLSX`, `JSZip`, `Mammoth`, etc.
- **Mitigation**:
    - **Subresource Integrity (SRI)**: All external scripts loaded with SHA-512 cryptographic hashes. Tampered content is blocked automatically.
    - **Configurable URLs**: Libraries can be self-hosted to eliminate CDN dependency entirely.

### 3. Resource Exhaustion (Zip Bombs / DoS)
- **Risk**: Extremely large or compressed files consuming all browser memory.
- **Mitigation**:
    - **25MB file size limit** enforced globally. `Blob.size` is validated before parsing begins.

### 4. User-Perspective Security: Manual Downloads
- **Risk**: Files that land in the `Downloads` folder may persist indefinitely, violating the "zero-trace" principle.
- **Mitigation**:
    - **Mandatory Consent Interceptor**: Every download is blocked by a Security Warning modal. The user must explicitly check "I understand the risks" before the download button activates.
    - **Session Opt-Out**: A "Don't show again for this session" option reduces friction while preserving the default-secure posture on page refresh.
    - **Warning Toasts**: Amber ⚠️ toasts appear at every download event.
    - **Explicit Fallback UI**: Unsupported file types display a clear message and safe download option.

### 5. Harmful Payload Risk (Active Reviewer Protection)
- **Risk**: Files may contain trojanized payloads (macros, scripts, exploits) targeting the reviewer's machine after download, even when sourced from a nominally secure environment.
- **Mitigation**:
    - **Blocking Consent Dialog**: The modal explicitly states the **Harmful Payload Risk** and the recommendation to scan files and use a **myDRE Workspace** with limited outbound whitelisting.
    - **Technical Implementation**: Uses a classless `<a>` anchor for the programmatic download, bypassing the consent interceptor without creating a re-entry loop.

## Recommendations for Production Implementation

1. **Self-Host Dependencies**: Host `Mammoth`, `XLSX`, `JSZip` locally to eliminate CDN trust requirements.
2. **Content Security Policy (CSP)**: Deploy a strict CSP to limit script execution and connection origins.
3. **SRI Hash Rotation**: Establish a dependency update cadence with re-hashing when upgrading library versions.
4. **Data Disposal Training**: Train users on periodic `Downloads` folder hygiene for sensitive documents.

---

*Security Audit Last Updated: 2026-02-20*
*For regulatory compliance mapping, see [Security Impact Assessment](SECURITY_IMPACT_ASSESSMENT.md) — Section 6.*
