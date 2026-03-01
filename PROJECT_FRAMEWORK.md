# Secure Software Project Framework
## A Generalized Guide: From Kickoff to Production

**Derived from**: PreviewPlugin project lessons learned
**Scope**: Any browser-based, server, or library software project
**Date**: 2026-02-20

---

## How to Use This Framework

Work through each phase in sequence. Each phase has:
1. **Goals** — what you are trying to achieve
2. **Steps** — what to do
3. **Documents to produce** — files to create
4. **Prompt templates** — suggested AI prompts to help you

Do **not** skip phases. Security and documentation are not add-ons — they are built in from Phase 1.

---

## Phase 0 — Project Setup & Scaffolding

### Goals
Establish a clean, traceable project foundation before writing a single line of code.

### Steps

1. **Create repository** with a meaningful, descriptive name.
2. **Scaffold the folder structure**:
   ```
   /
   ├── src/              ← source code
   ├── assets/           ← static assets or test fixtures
   ├── tests/            ← manual and automated tests
   ├── README.md         ← project overview (create immediately)
   ├── .gitignore
   └── docs/             ← optional: place all .md documents here
   ```
3. **Write an initial `README.md`** covering:
   - What the project does (one paragraph)
   - Who it is for
   - Dependencies and quick start
4. **Log your assumptions and constraints** in a `DECISIONS.md` or equivalent — e.g., "We use CDN libs rather than bundling", "We process only client-side". These become audit evidence later.

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `README.md` | Project overview, quick start, feature list |
| `DECISIONS.md` | Architecture and technology decisions log |

### 💡 Prompt: Initial README Scaffolding
```
I am building [project name], which is a [describe what it does].
The key design decisions are:
- [decision 1]
- [decision 2]

Write a professional README.md with: project overview, key features,
supported formats/endpoints (as a table), quick start guide, and a
Privacy & Security section. Keep it concise. Do not add placeholder content.
```

---

## Phase 1 — Requirements & User Stories

### Goals
Define what users can do (user stories) and what attackers or failures look like (anti-stories). Both drive the feature set AND the test plan.

### Steps

1. **Write user stories** in the format: *"As a [role], I want to [action] so that [benefit]."*
2. **Write anti-user stories** (negative requirements): *"As an attacker, I try to [attack vector] — this must be blocked."*
3. **Identify trust boundaries**: What data comes in? From where? Who controls it? Is any of it user-generated or third-party?
4. **Define data sensitivity**: Does the project handle PII, corporate secrets, financial data, or health data? This determines which regulatory frameworks apply (GDPR, ISO 27001, NIS2, HIPAA, etc.).

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `REQUIREMENTS.md` | User stories + anti-stories |
| `DECISIONS.md` update | Document trust boundary decisions |

### 💡 Prompt: User Story Generation
```
My project is [describe project]. The primary users are [roles].
The data flowing through the system is: [describe data].
The technology stack is: [stack].

1. Generate a list of 8–12 user stories (positive) covering the core features.
2. Generate a list of 5–8 anti-user stories (negative/attacker perspective)
   that describe what must be prevented.
Format each as: "As a [role], I [action]. Expected result: [outcome]."
```

---

## Phase 2 — Architecture & Design

### Goals
Design the system before implementing it. Identify attack surfaces and dependency risks upfront.

### Steps

1. **Draw the component diagram** (even a simple ASCII or Mermaid diagram).
2. **List all external dependencies** (libraries, CDNs, APIs, databases). For each, ask:
   - Who controls it?
   - What happens if it is compromised?
   - Can you pin it (hash, version lock)?
3. **Define secure defaults**:
   - What is the most restrictive configuration possible?
   - What is disabled unless explicitly enabled?
4. **Define resource limits**: max file size, max request size, rate limits, timeout thresholds.
5. **Identify what must be logged and what must NOT be logged** (sensitive data).

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `DECISIONS.md` update | Architecture choices + dependency rationale |
| `KNOWN_WEAKNESSES.md` | Honest register of known tradeoffs and gaps |

### 💡 Prompt: Architecture Security Review
```
I am designing [project name] with the following architecture:
[describe components, data flow, external dependencies]

Act as a senior security architect. Identify:
1. All trust boundaries in this design.
2. All external dependencies and their supply chain risk.
3. Recommended mitigations (SRI, pinning, sandboxing, rate limiting, etc.).
4. Any design decisions I should reconsider from a security standpoint.

Output as a structured list, prioritized by risk severity (High / Medium / Low).
```

---

## Phase 3 — Implementation & Secure Coding

### Goals
Write code that is correct, maintainable, and secure by default.

### Secure Coding Checklist (apply per PR or feature)

#### Input Handling
- [ ] All external input is validated (type, length, format) before use.
- [ ] File uploads/loads check size before processing begins.
- [ ] File type validation is based on content (magic bytes or parsing), not filename extension alone.

#### Output Handling
- [ ] HTML output is sanitized (e.g., DOMPurify) before injecting into the DOM.
- [ ] Text-only content uses `textContent` / equivalent — never `innerHTML` for untrusted content.
- [ ] No `eval()`, `dangerouslySetInnerHTML`, `exec()`, or dynamic code execution on untrusted input.

#### Memory & Resource Management
- [ ] All temporary resources (object URLs, file handles, connections) are explicitly released after use.
- [ ] No unbounded allocation — all loops and resource allocations have size limits.
- [ ] Error paths also release resources (use `finally` blocks).

#### Dependencies
- [ ] All CDN or third-party dependencies are pinned with Subresource Integrity (SRI) hashes (SHA-256 minimum, SHA-512 preferred).
- [ ] Dependencies can optionally be self-hosted.
- [ ] No dependencies with known CVEs (run `npm audit` or equivalent).

#### Isolation
- [ ] Embedded content (iframes, workers) uses the most restrictive sandbox possible.
- [ ] Sensitive operations are isolated from general-purpose execution contexts.

#### Data & Privacy
- [ ] No sensitive data stored in `localStorage`, `sessionStorage`, logs, or cookies without explicit justification.
- [ ] Session state (e.g., consent flags) lives in-memory only unless persistence is explicitly required.
- [ ] Error messages shown to users are generic. Detailed errors go to structured logs, not the browser console.

#### User Consent & Education
- [ ] Any action with risk (download, data submission, external link) shows a clear warning.
- [ ] High-risk actions require active acknowledgment (checkbox + disabled button pattern), not just a toast.
- [ ] Consent state that is security-critical resets to default-secure on page/session reload.

### 💡 Prompt: Code Review (General)
```
Please perform a thorough code review of the following [language] code.

[paste code here]

Review for:
1. Security vulnerabilities (XSS, injection, insecure dependencies, unsafe sinks).
2. Input validation and output encoding correctness.
3. Memory/resource management and leaks.
4. Error handling — are errors swallowed silently? Leaked to clients?
5. Code clarity, naming, and maintainability.
6. Any logic bugs or edge cases around [specific feature].

Format findings as: [Severity] — [Issue] — [Suggested Fix].
```

### 💡 Prompt: Code Review (Security-Focused)
```
Act as a penetration tester reviewing source code. The codebase is: [describe project].
The tech stack is: [stack]. The trust model is: [who controls input/output].

Analyze the following code for:
1. Direct attack vectors (XSS, CSRF, injection, path traversal, SSRF).
2. Indirect risks (supply chain, dependency confusion, prototype pollution).
3. Security anti-patterns (innerHTML, eval, hardcoded secrets, insecure defaults).
4. Missing controls that should be present given the context.

[paste code here]

Rate each finding: Critical / High / Medium / Low / Informational.
Suggest the minimal code change to remediate each Critical and High finding.
```

---

## Phase 4 — Security Audit

### Goals
Formally document the security posture of the completed implementation. This becomes audit evidence.

### Steps

1. **Enumerate all risk areas** for the specific technology (e.g., XSS for web, injection for APIs, race conditions for concurrent systems).
2. **For each risk**: describe the attack vector, current mitigation, and residual risk.
3. **Document supply chain risks** and how dependencies are controlled.
4. **Document user-facing risks** (e.g., users downloading malicious files, phishing via links).
5. **List production recommendations** (e.g., CSP headers, HTTPS enforcement, SIEM integration) even if not within your scope.

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `SECURITY_AUDIT.md` | Risk register + mitigation status |

### Document Template: `SECURITY_AUDIT.md`
```markdown
# [Project Name] Security Audit

## Core Security Principles
[List your non-negotiable design principles, e.g. zero-trust, defense-in-depth]

## Identified Risks & Mitigations

### 1. [Risk Name]
- **Vector**: [How an attacker exploits this]
- **Mitigation**: [What you did to address it]
- **Residual Risk**: [What remains after mitigation]

### 2. ...

## Recommendations for Production Implementation
[List anything deploying organizations must do at the environment level]

---
*Audit Last Updated: [DATE]*
```

### 💡 Prompt: Security Audit Generation
```
I have built [project name] which does the following: [describe].
The technology is: [stack]. It handles: [data types].
External dependencies: [list].

Act as a senior information security specialist.

1. Enumerate all relevant risk categories for this type of project.
2. For each risk: describe the attack vector, evaluate the mitigations I've listed below,
   and state the residual risk (High/Medium/Low).
3. Identify any risk categories I am missing entirely.
4. Produce a formatted SECURITY_AUDIT.md.

Current mitigations implemented:
- [mitigation 1]
- [mitigation 2]
```

---

## Phase 5 — Security Impact Assessment

### Goals
Produce a structured, evidence-based document that a security officer or auditor can review. Goes deeper than the audit — includes regulatory mapping and a formal conclusion.

### Steps

1. **Executive Summary**: One paragraph. What does the project do? What is its security posture?
2. **Technical Vulnerability Analysis**: Per vulnerability class — what is the vector, what mitigates it, what is resolved vs. outstanding?
3. **User-Centric Risk Analysis**: What risks does the *user's behavior* introduce (e.g., stale downloads, weak passwords, phishing)?
4. **Supply Chain Analysis**: How are third-party dependencies controlled?
5. **Mitigation Checklist**: A table summarizing inherent severity → residual risk → status for every risk.
6. **Regulatory Compliance Mapping**: Map controls to ISO 27001 Annex A, NIS2 Article 21, or other applicable frameworks. Score each 1–10 with rationale.
7. **Conclusion**: Clear statement of production readiness and any outstanding conditions.

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `SECURITY_IMPACT_ASSESSMENT.md` | Full structured impact assessment |

### 💡 Prompt: Security Impact Assessment
```
I am writing a Security Impact Assessment for [project name].

Project description: [describe]
Tech stack: [stack]
Data handled: [types, sensitivity]
External dependencies: [list with versions]
Implemented security controls: [list]
Applicable regulations: [ISO 27001 / NIS2 / GDPR / HIPAA / other]

Produce a structured Security Impact Assessment document with:
1. Executive Summary
2. Technical Vulnerability Analysis (per vulnerability class: XSS, injection, DoS, supply chain, etc.)
3. User-Centric Risk Analysis  
4. Dependency Supply Chain Risk
5. Mitigation & Residual Risk Checklist (table: Risk | Mitigation | Inherent | Residual | Status)
6. Regulatory Compliance Mapping:
   - For each applicable ISO 27001 Annex A control: name the control, rate compliance 1–10,
     explain the score with specific reference to what is implemented or missing.
   - Do the same for NIS2 Article 21 clauses.
7. Assessment Conclusion with production readiness statement.

Use a professional, audit-ready tone. Be specific — avoid generic statements.
```

---

## Phase 6 — Compliance Assessment

### Goals
Formally verify compliance against a defined coding checklist or regulatory standard. This produces sign-off evidence.

### Steps

1. **Select your baseline**: Developer Secure Coding Checklist, OWASP Top 10, CIS Controls, etc.
2. **Go line by line** through the checklist. For each item:
   - Applicability (High / Medium / Low / N/A)
   - Status (Pass / Fail / Partial)
   - Specific finding or code reference
3. **Produce a summary table** with overall pass rate.
4. **Issue a compliance conclusion**: Is this implementation compliant? Are there conditions?

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `SECURITY_COMPLIANCE_REPORT.md` | Line-by-line checklist compliance evidence |

### 💡 Prompt: Compliance Assessment
```
Evaluate the following project against the [name of standard/checklist]:
[paste checklist items, or name the standard clearly]

Project: [name]
Implementation summary: [describe what was built and how]
Security controls implemented: [list]

For each checklist item:
1. State applicability: High / Medium / Low / N/A
2. State status: Pass / Fail / Partial
3. Provide a one-sentence finding with a reference to specific code or architecture.

Output as a markdown table with columns: Item | Applicability | Status | Finding.
End with a summary: total pass rate, and a compliance conclusion statement.
```

---

## Phase 7 — Test Planning

### Goals
Define exactly how the project will be verified before it is called production-ready. Tests link back to user stories and anti-stories from Phase 1.

### Steps

1. **Smoke Tests**: 5–10 fast, top-level checks. Run after every deployment.
2. **Acceptance Tests**: One test per user story. Covers the happy path for each feature.
3. **Security / Negative Tests**: One test per anti-story. Each must have an explicit "do NOT see" criterion.
4. **Each test case must include**:
   - The user story or anti-story it covers
   - Step-by-step instructions
   - Expected outcome (✅ pass criteria)
   - Failure indicators (❌ must NOT occur)
5. **Provide an appendix result table** for tester sign-off.

### Documents to Create
| File | Purpose |
| :--- | :--- |
| `TEST_PLAN.md` | Smoke tests, acceptance tests, security negative tests, result table |

### 💡 Prompt: Test Plan Generation
```
I have built [project name] which does the following: [describe].
Users are: [describe roles]. The anti-stories (security requirements) are: [list].

Generate a complete manual test plan with three sections:
1. Smoke Tests (6–10 quick sanity checks for post-deployment)
2. Acceptance Tests (one per user story), covering: [list user stories]
3. Security / Negative Tests (one per anti-story), covering: [list anti-stories]

For each test case include:
- An ID (e.g. S-01, AT-03, SEC-02)
- The user story or anti-story being tested
- Steps (numbered, specific, no ambiguity)
- Expect ✅ section: what must be present / happen
- Do NOT see ❌ section: what must be absent / not happen

End with an appendix table for testers to record Pass/Fail with columns:
Test ID | Description | Pass/Fail | Notes | Tester | Date
```

---

## Phase 8 — Documentation Finalization

### Goals
Ensure all documentation is complete, cross-referenced, and production-ready before sign-off.

### Document Checklist
| Document | Contains | Cross-links |
| :--- | :--- | :--- |
| `README.md` | Overview, features, quick start, security summary, links to all docs | All security docs |
| `SECURITY_AUDIT.md` | Risk register, mitigations, production recommendations | Impact Assessment |
| `SECURITY_IMPACT_ASSESSMENT.md` | Full vulnerability analysis, regulatory mapping, conclusion | Audit, Compliance |
| `SECURITY_COMPLIANCE_REPORT.md` | Checklist pass/fail, summary score, compliance conclusion | Impact Assessment |
| `TEST_PLAN.md` | Smoke, acceptance, security negative tests, result table | User stories | 
| `walkthrough.md` | Feature demo with screenshots/recordings, regulatory summary | All docs |
| `KNOWN_WEAKNESSES.md` | Honest register of accepted risks, tradeoffs, open items | Audit |
| `DECISIONS.md` | Architecture, technology, and design decisions with rationale | README |

### Cross-Reference Rules
- Every security document must link to the **Coding Checklist** used as its baseline.
- Every risk in `SECURITY_AUDIT.md` must appear in `SECURITY_IMPACT_ASSESSMENT.md`.
- Every test case in `TEST_PLAN.md` must trace back to a user story or anti-story.
- `README.md` is the **front door** — it links to everything else. A reader should never be stuck.

### 💡 Prompt: Documentation Cross-Reference Review
```
I have the following documentation for [project name]:
[list documents and a 1-sentence summary of each]

Review this documentation set for:
1. Missing documents that should be present for a production-ready project.
2. Cross-reference gaps (document A references document B, but B doesn't exist or doesn't contain what A claims).
3. Inconsistencies — claims in one document that contradict another.
4. Sections that are vague or non-specific (e.g. "we use good security practices" without specifics).

Output a prioritized list of gaps, and for each one: what document needs to be updated and what specifically needs to be added.
```

---

## Phase 9 — Production Readiness Checklist

Run this checklist before releasing to production. Every item must be checked.

### Functionality
- [ ] All user stories pass their acceptance tests.
- [ ] Smoke tests pass on the production-equivalent environment.
- [ ] Supported file/data formats all render correctly (create a fixture for each).

### Security
- [ ] All `SECURITY_AUDIT.md` risks are at residual "Low" or have accepted risk documented in `KNOWN_WEAKNESSES.md`.
- [ ] All external dependencies pinned (SRI, lockfile, or local copy).
- [ ] No `console.log` statements leaking sensitive data.
- [ ] No hardcoded credentials, tokens, or keys.
- [ ] All security negative tests (SEC-*) pass.
- [ ] Content Security Policy (CSP) header configured at the deployment level.
- [ ] HTTPS enforced (redirect HTTP → HTTPS or HSTS header).

### User Consent & Privacy
- [ ] All high-risk user actions have explicit consent mechanisms.
- [ ] No data is stored beyond its necessary lifetime.
- [ ] Privacy implications explained in `README.md`.

### Documentation
- [ ] `README.md` is accurate and up to date.
- [ ] All documents are cross-referenced correctly.
- [ ] Compliance conclusion issued in `SECURITY_COMPLIANCE_REPORT.md`.
- [ ] `walkthrough.md` includes screenshots or recordings of key flows.

### Regulatory (if applicable)
- [ ] ISO 27001 control mapping completed with scores.
- [ ] NIS2 / GDPR / HIPAA mapping completed (if in scope).
- [ ] Deploying organization briefed on their residual responsibilities (e.g., HTTPS, incident response).

---

## Phase 10 — Lessons Learned (Post-Project)

After each project, document what you would do differently. This feeds the next project's Phase 0.

### Questions to Answer
1. Which security risks were found late that should have been caught earlier?
2. Which documentation would you have created earlier if you'd started over?
3. Which AI prompts worked well? Which needed refinement?
4. What test cases caught real bugs?
5. What would you add to the Secure Coding Checklist for this type of project?

### 💡 Prompt: Lessons Learned Extraction
```
The following project has been completed: [project name]
Here is a summary of what was built: [summary]
Here are the key security findings that emerged during the project: [findings]
Here are the bugs or issues found during testing: [bugs]

Extract a lessons-learned summary that covers:
1. What should have been done earlier (shift-left opportunities)
2. Which documentation was most valuable and should be standard
3. Recommended additions to the Secure Coding Checklist for this type of project
4. Any reusable prompt templates that proved effective
5. One-paragraph summary for the next team taking on a similar project
```

---

## Quick Reference: Document Set Per Project

| Document | Phase Created | Owner | Audience |
| :--- | :---: | :--- | :--- |
| `README.md` | 0 | Dev Lead | All stakeholders |
| `DECISIONS.md` | 0–2 | Architect | Dev team, auditors |
| `KNOWN_WEAKNESSES.md` | 2+ | Security lead | Internal, auditors |
| `SECURITY_AUDIT.md` | 4 | Security lead | Security officer, auditors |
| `SECURITY_IMPACT_ASSESSMENT.md` | 5 | Security lead | CISO, compliance team |
| `SECURITY_COMPLIANCE_REPORT.md` | 6 | Security lead | Compliance, auditors |
| `TEST_PLAN.md` | 7 | QA lead | QA, product owner |
| `walkthrough.md` | 8 | Dev Lead | Product owner, support |

---

## Quick Reference: Prompt Index

| Prompt | Phase | Purpose |
| :--- | :---: | :--- |
| Initial README Scaffolding | 0 | Generate README structure |
| User Story Generation | 1 | Define positive + negative stories |
| Architecture Security Review | 2 | Identify attack surfaces early |
| Code Review (General) | 3 | Quality + maintainability check |
| Code Review (Security-Focused) | 3 | Penetration tester perspective |
| Security Audit Generation | 4 | Risk register + SECURITY_AUDIT.md |
| Security Impact Assessment | 5 | Full structured assessment + regulatory mapping |
| Compliance Assessment | 6 | Line-by-line checklist verification |
| Test Plan Generation | 7 | Smoke + acceptance + negative tests |
| Documentation Cross-Reference Review | 8 | Find gaps between documents |
| Lessons Learned Extraction | 10 | Feed next project |

---

*Secure Software Project Framework v1.0 — Derived from PreviewPlugin lessons learned — 2026-02-20*
