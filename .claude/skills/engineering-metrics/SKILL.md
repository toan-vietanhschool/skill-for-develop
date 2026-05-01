# Engineering Metrics

## Purpose

Measure and improve software delivery performance using industry-standard metrics. Enable data-driven decisions about engineering health, productivity, and quality.

## When to Use

- Assessing team performance and delivery speed
- Identifying bottlenecks in the development pipeline
- Setting improvement goals for the engineering organization
- Reporting to leadership on engineering health
- Justifying investment in tooling, process, or headcount

## DORA Metrics (Core 4)

The four key metrics from the DORA (DevOps Research and Assessment) research:

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| **Deployment Frequency** | On-demand (multiple/day) | Weekly to monthly | Monthly to 6-monthly | > 6 months |
| **Lead Time for Changes** | < 1 hour | 1 day - 1 week | 1 week - 1 month | > 1 month |
| **Change Failure Rate** | < 5% | 5-10% | 10-15% | > 15% |
| **Mean Time to Recovery** | < 1 hour | < 1 day | 1 day - 1 week | > 1 week |

### How to Measure

**Deployment Frequency:**
```bash
# Count deployments in last 30 days
git log --oneline --after="30 days ago" --merges origin/main | wc -l
```

**Lead Time for Changes:**
```bash
# Time from first commit to production deploy
# Track: PR created → PR merged → deployed
```

**Change Failure Rate:**
```
(deployments causing incidents / total deployments) × 100
```

**Mean Time to Recovery (MTTR):**
```
Average(incident_resolved_at - incident_detected_at)
```

## Developer Experience Metrics

| Metric | Target | How to Measure |
|--------|--------|---------------|
| **Build time** | < 5 min | CI/CD pipeline duration |
| **Test suite time** | < 10 min | CI test job duration |
| **PR review time** | < 24 hours | Time from PR open to first review |
| **PR merge time** | < 48 hours | Time from PR open to merge |
| **Onboarding time** | < 1 week | Time for new dev to ship first PR |
| **Dev environment setup** | < 30 min | Time from clone to running locally |

## Code Quality Metrics

| Metric | Target | Tool |
|--------|--------|------|
| **Test coverage** | > 80% | Jest, pytest, go test |
| **Code duplication** | < 5% | SonarQube, jscpd |
| **Cyclomatic complexity** | < 10 per function | ESLint, SonarQube |
| **Technical debt ratio** | < 5% | SonarQube |
| **Dependency freshness** | No critical CVEs | Dependabot, Snyk |

## Sprint & Flow Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **Velocity** | Team capacity (story points per sprint) |
| **Cycle time** | How long a single item takes from start to done |
| **Throughput** | Number of items completed per time period |
| **WIP (Work in Progress)** | Items started but not finished — lower is better |
| **Sprint completion rate** | % of committed stories delivered |
| **Escaped defects** | Bugs found in production per release |

## Monthly Engineering Report Template

```markdown
# Engineering Report — YYYY-MM

## DORA Metrics
| Metric | This Month | Last Month | Trend |
|--------|-----------|------------|-------|
| Deployment Frequency | X/week | Y/week | ↑↓ |
| Lead Time | X days | Y days | ↑↓ |
| Change Failure Rate | X% | Y% | ↑↓ |
| MTTR | X hours | Y hours | ↑↓ |

## Delivery
- Stories completed: X
- Story points delivered: Y
- Sprint completion rate: Z%
- PRs merged: N

## Quality
- Test coverage: X%
- Escaped defects: Y
- Critical bugs fixed: Z

## Team Health
- Open positions: X
- New hires onboarded: Y
- Team satisfaction (1-5): Z

## Key Wins
- [achievement]

## Concerns
- [issue and plan to address]

## Next Month Focus
- [priority]
```

## Dashboard Setup

Recommended data sources and tools:

| Data | Source | Dashboard |
|------|--------|-----------|
| Deployments | GitHub Actions, CI/CD | Grafana |
| Lead time | GitHub PR data | Grafana / LinearB |
| Incidents | PagerDuty, Opsgenie | Grafana |
| Test coverage | CI artifacts | SonarQube |
| Sprint data | Jira, Linear | Jira/Linear dashboards |

## Rules

- **Measure trends, not absolutes** — improvement over time matters more than hitting a number
- **Never use metrics to punish** — metrics are for learning, not performance reviews
- **Limit WIP** — the single highest-leverage improvement for most teams
- **Automate collection** — manual metrics tracking doesn't scale and gets abandoned
- **Review monthly** — weekly is noise, quarterly is too slow to course-correct
