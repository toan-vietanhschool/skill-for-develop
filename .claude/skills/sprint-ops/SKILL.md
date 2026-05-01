# Sprint Operations

## Purpose

Facilitate Agile/Scrum ceremonies and sprint management — planning, daily standups, reviews, and retrospectives — with templates and metrics tracking.

## When to Use

- Starting a new sprint (planning)
- Running daily standups
- Conducting sprint reviews with stakeholders
- Facilitating retrospectives
- Tracking team velocity and capacity

## Sprint Cycle

```
Sprint Planning (Day 1)
    ↓
Daily Standups (Daily)
    ↓
Sprint Review (Last Day)
    ↓
Retrospective (Last Day)
    ↓
Next Sprint Planning
```

Recommended sprint length: **2 weeks** for most teams.

## Sprint Planning

### Inputs Required

1. **Product Backlog** — prioritized by Product Owner
2. **Team capacity** — available person-days this sprint
3. **Velocity** — average story points completed in last 3 sprints

### Planning Process

1. Product Owner presents top backlog items and priorities
2. Team discusses each item, asks clarifying questions
3. Team estimates using story points (Fibonacci: 1, 2, 3, 5, 8, 13)
4. Team commits to sprint backlog based on capacity and velocity
5. Each story is broken into tasks (max 1 day each)

### Estimation Guide

| Points | Complexity | Example |
|--------|-----------|---------|
| 1 | Trivial | Fix typo, update config |
| 2 | Simple | Add field to form, simple API endpoint |
| 3 | Moderate | New CRUD feature with tests |
| 5 | Complex | New service integration, complex UI component |
| 8 | Very complex | New authentication system, major refactor |
| 13 | Epic-level | Should be broken down further |

### Sprint Goal Template

```markdown
## Sprint [N] Goal
**Dates:** YYYY-MM-DD to YYYY-MM-DD
**Theme:** [one-line description]

### Committed Stories
| ID | Title | Points | Owner | Status |
|----|-------|--------|-------|--------|
| | | | | TODO |

### Capacity
- Team members available: X
- Total person-days: Y
- Planned velocity: Z points
- Historical velocity (avg last 3): W points

### Risks & Dependencies
- [risk or external dependency]

### Definition of Done
- [ ] Code reviewed and approved
- [ ] Tests written and passing (>80% coverage)
- [ ] Documentation updated
- [ ] Deployed to staging
- [ ] Product Owner accepted
```

## Daily Standup

**Duration:** 15 minutes max
**Format:** Each person answers:

1. What did I complete yesterday?
2. What will I work on today?
3. Any blockers?

### Standup Summary Template

```markdown
## Standup — YYYY-MM-DD

### Progress
- [name]: Completed [task]. Working on [next task].
- [name]: [update]

### Blockers
- [blocker description] — Owner: [name], Needs: [what's needed]

### Sprint Burndown
- Points completed: X / Y total
- Days remaining: Z
- On track: Yes/No
```

## Sprint Review

1. Demo completed work to stakeholders
2. Discuss what was NOT completed and why
3. Product Owner accepts/rejects stories
4. Update product backlog based on feedback

## Retrospective

### Format: Start / Stop / Continue

```markdown
## Retrospective — Sprint [N]

### What went well (Continue)
- [item]

### What didn't go well (Stop)
- [item]

### What to try next sprint (Start)
- [item]

### Action Items
| Action | Owner | Due |
|--------|-------|-----|
| | | |

### Team Health Check (1-5)
- Pace: _/5
- Quality: _/5
- Collaboration: _/5
- Fun: _/5
```

## Velocity Tracking

Track sprint-over-sprint to identify trends:

```
Sprint 1: 21 pts
Sprint 2: 25 pts
Sprint 3: 23 pts
Average:  23 pts ← use for planning
```

- Velocity going down? → Check for tech debt, unclear requirements, or burnout
- Velocity volatile? → Improve estimation practices
- Never use velocity to compare teams

## Rules

- **Never** extend a sprint — carry unfinished work to next sprint
- **Never** add scope mid-sprint without removing equal scope
- **Always** have a clear sprint goal (not just a list of tickets)
- **Always** track velocity for at least 3 sprints before using it for planning
- **Always** timebox ceremonies — planning (2h), standup (15m), review (1h), retro (1h)
