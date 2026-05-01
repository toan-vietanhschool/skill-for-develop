# Incident Response

## Purpose

Provide a structured incident management workflow — from detection through resolution to postmortem — ensuring production incidents are handled quickly, consistently, and without blame.

## When to Use

- Production system is down or degraded
- Users report critical bugs or data issues
- Monitoring alerts fire (latency spike, error rate increase, resource exhaustion)
- Security breach or data exposure detected

## Severity Levels

| Level | Definition | Response Time | Examples |
|-------|-----------|---------------|---------|
| SEV1 - Critical | Full outage, data loss, security breach | Immediate (< 15 min) | Site down, DB corruption, credentials leaked |
| SEV2 - Major | Partial outage, significant degradation | < 30 min | Payment failures, auth broken for subset |
| SEV3 - Minor | Limited impact, workaround available | < 2 hours | UI glitch, slow queries, minor feature broken |
| SEV4 - Low | Cosmetic, no user impact | Next business day | Logging errors, non-critical alert noise |

## Incident Response Phases

### Phase 1: Detection & Triage (0-15 min)

1. **Acknowledge** the alert — assign an Incident Commander (IC)
2. **Assess severity** using the table above
3. **Communicate** — open incident channel, notify stakeholders
4. **Gather initial data:**
   - When did it start?
   - What changed recently? (deploys, config changes, traffic spikes)
   - What is the blast radius? (which users, regions, services)

### Phase 2: Containment (15-60 min)

1. **Stop the bleeding** — rollback, feature flag off, traffic divert
2. **Do NOT debug in production** during active incident if a rollback is viable
3. **Decision framework:**
   - Can we rollback? → Rollback immediately
   - Can we feature-flag it off? → Disable the flag
   - Can we scale/redirect? → Add capacity or divert traffic
   - None of the above? → Move to Phase 3

### Phase 3: Resolution

1. **Root cause investigation** — use systematic-debugging skill
2. **Apply fix** — hotfix branch, expedited review
3. **Verify fix** — confirm metrics return to normal
4. **Monitor** — watch for 30 min post-fix before declaring resolved

### Phase 4: Postmortem (within 48 hours)

1. **Timeline** — minute-by-minute reconstruction
2. **Root cause analysis** — use 5 Whys technique
3. **Contributing factors** — what made it worse or delayed resolution
4. **Action items** with owners and deadlines:
   - Prevent recurrence
   - Improve detection
   - Improve response
5. **Blameless** — focus on systems, not individuals

## Postmortem Template

```markdown
# Incident Postmortem: [TITLE]

**Date:** YYYY-MM-DD
**Severity:** SEV1/2/3/4
**Duration:** X hours Y minutes
**Incident Commander:** [name]
**Author:** [name]

## Summary
One paragraph describing what happened and impact.

## Impact
- Users affected: X
- Revenue impact: $Y
- Duration: Z minutes

## Timeline (all times in UTC)
| Time | Event |
|------|-------|
| HH:MM | Alert fired / user report |
| HH:MM | IC assigned, severity assessed |
| HH:MM | Root cause identified |
| HH:MM | Fix deployed |
| HH:MM | Incident resolved |

## Root Cause
Describe the underlying technical cause.

## 5 Whys
1. Why did X happen? → Because Y
2. Why did Y happen? → Because Z
...

## Contributing Factors
- What made detection slow?
- What made response slow?
- What made the impact worse?

## Action Items
| Action | Owner | Deadline | Status |
|--------|-------|----------|--------|
| Add monitoring for X | @name | YYYY-MM-DD | TODO |
| Add circuit breaker to Y | @name | YYYY-MM-DD | TODO |
| Update runbook for Z | @name | YYYY-MM-DD | TODO |

## Lessons Learned
What went well, what didn't, what was lucky.
```

## On-Call Rotation

- Define primary and secondary on-call
- Rotation period: weekly recommended
- Handoff checklist: active incidents, known issues, upcoming deploys
- Escalation path: Primary → Secondary → Engineering Lead → CTO

## Rules

- **Never** skip the postmortem, even for SEV3/4
- **Never** blame individuals — fix the system
- **Always** rollback first, debug later (when possible)
- **Always** communicate status updates every 30 min during active incidents
- **Always** create action items with owners and deadlines
