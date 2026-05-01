# Contract Templates

## Purpose

Provide standardized contract and legal document templates for software companies — covering employment, client agreements, vendor relationships, and intellectual property protection.

## When to Use

- Hiring new employees or contractors
- Signing new clients or projects
- Engaging vendors or third-party services
- Protecting intellectual property
- Establishing partnerships

## Document Types

### 1. Non-Disclosure Agreement (NDA)

**Use when:** Sharing confidential information with potential clients, partners, or candidates.

```markdown
# Mutual Non-Disclosure Agreement

**Parties:**
- Disclosing Party: [Company Name]
- Receiving Party: [Other Party Name]

**Effective Date:** YYYY-MM-DD

## 1. Definition of Confidential Information
All non-public information disclosed by either party, including but not limited to:
- Source code, algorithms, and technical designs
- Business plans, strategies, and financial data
- Customer lists and user data
- Product roadmaps and unreleased features

## 2. Obligations
The Receiving Party agrees to:
- Use confidential information solely for [stated purpose]
- Not disclose to third parties without written consent
- Protect with at least the same care as own confidential info
- Return or destroy all materials upon request or termination

## 3. Exclusions
This agreement does not apply to information that:
- Is or becomes publicly available (not through breach)
- Was known before disclosure
- Is independently developed
- Is required to be disclosed by law

## 4. Duration
This agreement remains in effect for [2-5] years from the Effective Date.

## 5. Signatures
[signature blocks]
```

### 2. Service Level Agreement (SLA)

**Use when:** Defining uptime, support, and performance commitments to clients.

**Key Sections:**
- Service availability target (e.g., 99.9% uptime)
- Planned maintenance windows
- Support response times by severity
- Remedies for SLA violations (credits, penalty)
- Exclusions (force majeure, client-caused issues)
- Measurement and reporting methodology

**Uptime Targets:**

| Target | Downtime/Month | Downtime/Year |
|--------|---------------|---------------|
| 99.0% | 7h 18m | 3d 15h 36m |
| 99.9% | 43m 50s | 8h 46m |
| 99.95% | 21m 55s | 4h 23m |
| 99.99% | 4m 23s | 52m 36s |

### 3. Master Service Agreement (MSA)

**Use when:** Establishing an ongoing client relationship with multiple projects.

**Key Sections:**
- Scope of services
- Payment terms (Net 30/60/90)
- Intellectual property ownership
- Warranties and representations
- Limitation of liability
- Indemnification
- Termination conditions
- Dispute resolution
- Governing law

### 4. Statement of Work (SOW)

**Use when:** Defining a specific project under an MSA.

```markdown
# Statement of Work

**Project:** [Project Name]
**Client:** [Client Name]
**Date:** YYYY-MM-DD
**SOW Number:** SOW-[YYYY]-[NNN]

## 1. Project Overview
[Brief description of the project and objectives]

## 2. Scope of Work
### In Scope
- [deliverable 1]
- [deliverable 2]

### Out of Scope
- [explicitly excluded item]

## 3. Deliverables & Milestones
| # | Deliverable | Due Date | Acceptance Criteria |
|---|------------|----------|-------------------|
| 1 | | YYYY-MM-DD | |
| 2 | | YYYY-MM-DD | |

## 4. Timeline
- Start Date: YYYY-MM-DD
- End Date: YYYY-MM-DD
- Total Duration: X weeks

## 5. Pricing
| Item | Rate/Price | Estimated Hours | Total |
|------|-----------|----------------|-------|
| Development | $X/hr | Y hrs | $Z |
| Design | $X/hr | Y hrs | $Z |
| **Total** | | | **$Z** |

Payment schedule: [milestone-based / monthly / upon completion]

## 6. Assumptions & Dependencies
- [assumption about client providing X]
- [dependency on third-party API availability]

## 7. Change Management
Changes to scope require written approval and may impact timeline/budget.
Additional work billed at standard rates.

## 8. Acceptance
Client has [5-10] business days to review each deliverable.
Silence after review period constitutes acceptance.
```

### 5. Employment Agreement

**Key Sections:**
- Position, title, and reporting structure
- Compensation and benefits
- Working hours and location (remote/hybrid/onsite)
- Intellectual property assignment (work product belongs to company)
- Non-compete and non-solicitation (where enforceable)
- Confidentiality obligations
- Termination conditions and notice period
- Probation period

### 6. Contractor Agreement

**Key Sections:**
- Scope of work and deliverables
- Payment terms and invoicing
- Independent contractor status (not employee)
- IP ownership and work-for-hire clause
- Confidentiality
- Termination with notice period
- Insurance and liability

## IP Assignment Clause (Critical)

Every employee and contractor agreement MUST include:

> All work product, inventions, code, designs, and documentation created during
> the course of engagement are works made for hire and the exclusive property
> of [Company Name]. Contractor/Employee hereby assigns all rights, title,
> and interest in such work product to the Company.

## Review Checklist

Before signing any contract:

- [ ] Legal counsel has reviewed
- [ ] Payment terms are clear and acceptable
- [ ] IP ownership is explicitly defined
- [ ] Liability caps are appropriate
- [ ] Termination clauses protect both parties
- [ ] Confidentiality obligations are reasonable
- [ ] Governing law and jurisdiction specified
- [ ] Insurance requirements defined (if applicable)

## Rules

- **Never** start work without a signed agreement
- **Never** use verbal agreements for anything above trivial value
- **Always** have legal counsel review contracts above $50K
- **Always** include an IP assignment clause
- **Always** define scope clearly to prevent scope creep
- **Always** specify dispute resolution mechanism
