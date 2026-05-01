# Release Management

## Purpose

Define a structured process for shipping software — from version strategy to release notes, changelogs, feature flags, and rollback procedures. Ensure every release is predictable, traceable, and reversible.

## When to Use

- Preparing a new version for release
- Writing release notes and changelogs
- Managing feature flags and gradual rollouts
- Planning rollback strategies
- Coordinating releases across teams

## Version Strategy

### Semantic Versioning (SemVer)

```
MAJOR.MINOR.PATCH — e.g., 2.4.1

MAJOR — breaking changes (API incompatible)
MINOR — new features (backwards compatible)
PATCH — bug fixes (backwards compatible)
```

### Pre-release Tags

```
1.0.0-alpha.1  → early development, unstable
1.0.0-beta.1   → feature complete, testing
1.0.0-rc.1     → release candidate, final testing
1.0.0          → stable release
```

### Calendar Versioning (CalVer)

Use when release cadence matters more than API compatibility:

```
YYYY.MM.DD — e.g., 2026.05.01
YYYY.MM.PATCH — e.g., 2026.05.1
```

## Release Process

### 1. Pre-Release Checklist

- [ ] All planned features merged and tested
- [ ] No critical/high bugs open for this milestone
- [ ] Test suite passing (unit, integration, e2e)
- [ ] Performance benchmarks within acceptable range
- [ ] Security scan completed — no critical vulnerabilities
- [ ] Database migrations tested on staging
- [ ] API documentation updated
- [ ] Breaking changes documented with migration guide

### 2. Create Release Branch

```bash
# For major/minor releases
git checkout -b release/v2.4.0 main
# Apply any last-minute fixes to this branch
# Merge back to main after release
```

### 3. Generate Changelog

#### Automated from Conventional Commits

```bash
# Using git log
git log v2.3.0..HEAD --pretty=format:"- %s (%h)" --reverse

# Group by type
feat: new features
fix: bug fixes
perf: performance improvements
docs: documentation
chore: maintenance
```

#### Changelog Template

```markdown
# Changelog

## [2.4.0] — 2026-05-01

### Added
- User dashboard with real-time analytics (#123)
- Export data to CSV/JSON (#145)
- Dark mode support (#167)

### Changed
- Improved search performance by 3x (#178)
- Updated onboarding flow (#182)

### Fixed
- Fixed pagination bug on mobile (#190)
- Fixed timezone handling in reports (#195)

### Security
- Patched XSS vulnerability in comment rendering (#200)

### Breaking Changes
- Removed deprecated `/api/v1/users` endpoint — use `/api/v2/users`
- Changed `config.apiKey` to `config.auth.apiKey`

### Migration Guide
[Link to migration documentation]
```

### 4. Write Release Notes

```markdown
# Release v2.4.0 — "Dashboard Update"

## Highlights

### Real-time Dashboard
Users can now see live analytics on their dashboard, including
active sessions, conversion rates, and revenue metrics.

### Dark Mode
Full dark mode support across all pages. Automatically follows
system preference with manual override.

### Performance
Search queries are now 3x faster thanks to optimized database
indexing and query caching.

## Upgrade Instructions
1. Update dependency: `npm install app@2.4.0`
2. Run migrations: `npm run db:migrate`
3. Clear cache: `npm run cache:clear`
4. Restart services

## Breaking Changes
See [Migration Guide](./docs/migration-v2.4.md) for details.

## Contributors
Thanks to @name1, @name2, @name3 for their contributions!
```

### 5. Tag and Publish

```bash
# Tag the release
git tag -a v2.4.0 -m "Release v2.4.0"
git push origin v2.4.0

# Create GitHub Release
gh release create v2.4.0 --title "v2.4.0 — Dashboard Update" --notes-file RELEASE_NOTES.md
```

## Feature Flag Lifecycle

```
Create → Development → Testing → Gradual Rollout → Full Release → Cleanup
```

### Stages

| Stage | Flag State | Audience |
|-------|-----------|----------|
| **Development** | OFF everywhere | Developer only (local override) |
| **Testing** | ON in staging | QA team |
| **Canary** | ON for 1-5% | Small user subset |
| **Gradual Rollout** | 5% → 25% → 50% → 100% | Expanding audience |
| **Full Release** | ON for 100% | All users |
| **Cleanup** | Remove flag from code | N/A |

### Rollout Decision Criteria

Before increasing rollout percentage:

- [ ] Error rate stable or improved
- [ ] Latency metrics unchanged
- [ ] No increase in support tickets
- [ ] Key business metrics unaffected
- [ ] Wait at least 24 hours at each stage

### Flag Cleanup Policy

- Remove feature flags within **30 days** of reaching 100% rollout
- Track flag age — alert on flags older than 60 days
- Dead flags increase code complexity and cognitive load

## Rollback Procedures

### Instant Rollback (Feature Flag)

```
Flag OFF → feature disabled immediately
No deploy needed
```

### Fast Rollback (Revert Deploy)

```bash
# Revert to previous version
kubectl rollout undo deployment/app-name
# or
git revert HEAD && git push
# or
deploy previous image tag
```

### Database Rollback

- Always write **reversible migrations**
- Test rollback on staging before production
- For data migrations: keep old columns until next release

### Rollback Decision Framework

| Signal | Action |
|--------|--------|
| Error rate > 5% | Immediate rollback |
| p99 latency > 3x baseline | Rollback within 15 min |
| Data integrity issue | Immediate rollback + incident |
| Minor UI bug | Hotfix forward, no rollback |
| User complaints < 0.1% | Monitor, hotfix if needed |

## Release Cadence

| Cadence | Best For | Example |
|---------|----------|---------|
| **Continuous** | SaaS, web apps | Merge to main = deploy |
| **Weekly** | Growing teams, moderate risk | Ship every Tuesday |
| **Bi-weekly** | Aligned with sprints | Ship end of sprint |
| **Monthly** | Enterprise, regulated | Scheduled release window |

## Rules

- **Never** release on Fridays (unless you enjoy weekend incidents)
- **Never** skip the changelog — future you will thank present you
- **Always** tag releases in git
- **Always** have a rollback plan before deploying
- **Always** clean up feature flags within 30 days of full rollout
- **Always** test the rollback procedure, not just the deploy
- **Always** communicate release timing to stakeholders in advance
