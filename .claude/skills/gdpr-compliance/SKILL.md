# GDPR Compliance

## Purpose

Ensure software systems comply with the General Data Protection Regulation (GDPR) — the EU's data privacy law. Non-compliance can result in fines up to 4% of annual revenue or €20M.

## When to Use

- Building any product that handles EU user data
- Adding new data collection (forms, analytics, tracking)
- Integrating third-party services that process user data
- Designing database schemas that store personal data
- Responding to user data requests (access, deletion, portability)

## Core GDPR Principles

1. **Lawfulness** — have a legal basis for processing data
2. **Purpose limitation** — collect data only for specified purposes
3. **Data minimization** — collect only what you need
4. **Accuracy** — keep data correct and up to date
5. **Storage limitation** — don't keep data longer than necessary
6. **Integrity & confidentiality** — protect data appropriately
7. **Accountability** — demonstrate compliance

## Legal Bases for Processing

| Basis | When to Use | Example |
|-------|------------|---------|
| **Consent** | User actively opts in | Marketing emails, cookies |
| **Contract** | Necessary to fulfill a contract | Processing an order |
| **Legal obligation** | Required by law | Tax records |
| **Legitimate interest** | Business need, balanced with user rights | Fraud detection, analytics |

## Personal Data Categories

| Category | Examples | Protection Level |
|----------|---------|-----------------|
| **Basic** | Name, email, phone | Standard |
| **Sensitive (Special)** | Health, religion, ethnicity, biometrics | Enhanced — explicit consent required |
| **Behavioral** | Browsing history, purchase patterns | Standard |
| **Technical** | IP address, device ID, cookies | Standard |

## Implementation Checklist

### Data Collection

- [ ] Consent banner with granular options (not just "Accept All")
- [ ] Privacy policy linked and accessible
- [ ] Purpose stated for each data field collected
- [ ] No pre-checked consent boxes
- [ ] Consent recorded with timestamp and version
- [ ] Age verification for users under 16

### Data Storage

- [ ] Personal data encrypted at rest
- [ ] Data retention periods defined per data type
- [ ] Automated deletion when retention expires
- [ ] Data inventory / record of processing activities (ROPA)
- [ ] Separate storage for sensitive data with additional access controls

### User Rights Implementation

| Right | Implementation | API Endpoint |
|-------|---------------|-------------|
| **Access** | Export user's data in machine-readable format | `GET /api/user/data-export` |
| **Rectification** | Allow users to update their data | `PUT /api/user/profile` |
| **Erasure** (Right to be Forgotten) | Delete user and all associated data | `DELETE /api/user/account` |
| **Portability** | Export data in JSON/CSV | `GET /api/user/data-export?format=json` |
| **Restriction** | Pause processing of user's data | `POST /api/user/restrict-processing` |
| **Objection** | Opt out of specific processing | `POST /api/user/opt-out` |

### Data Erasure Checklist

When a user requests deletion:

- [ ] Delete from primary database
- [ ] Delete from all replicas and caches
- [ ] Delete from backups (or flag for exclusion on restore)
- [ ] Delete from third-party services (analytics, CRM, email)
- [ ] Delete uploaded files and media
- [ ] Anonymize data in logs (don't delete logs — anonymize)
- [ ] Confirm deletion to user within 30 days

### Third-Party Data Processing

- [ ] Data Processing Agreement (DPA) with every vendor that touches user data
- [ ] Verify vendor's GDPR compliance
- [ ] Document all data flows to third parties
- [ ] Sub-processor list published and updated

### Breach Notification

- Notify supervisory authority within **72 hours** of discovering a breach
- Notify affected users "without undue delay" if high risk
- Document: what happened, data affected, measures taken

## Cookie Consent Implementation

```
Strictly Necessary → Always on, no consent needed
Functional         → Opt-in
Analytics          → Opt-in
Marketing          → Opt-in
```

- Default: all non-essential cookies OFF
- "Reject All" must be as easy as "Accept All"
- Remember preference and don't re-ask

## Privacy by Design

When designing new features:

1. What personal data does this feature need?
2. Can we achieve the goal with less data?
3. Can we use anonymized/pseudonymized data instead?
4. What is the retention period?
5. Who has access to this data?
6. How will we handle deletion requests for this data?

## Rules

- **Never** collect data "just in case" — data minimization is law
- **Never** use dark patterns to obtain consent
- **Always** provide a way to withdraw consent as easily as it was given
- **Always** respond to data requests within 30 days
- **Always** document your data processing activities
- **Always** conduct a Data Protection Impact Assessment (DPIA) for high-risk processing
