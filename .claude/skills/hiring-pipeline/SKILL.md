# Hiring Pipeline

## Purpose

Define a structured, fair, and efficient hiring process for engineering roles — from job posting to offer acceptance. Ensure consistent evaluation and good candidate experience.

## When to Use

- Opening a new engineering position
- Designing interview processes
- Creating coding challenges or take-home assignments
- Evaluating candidates
- Making hiring decisions

## Hiring Stages

```
Job Description → Sourcing → Resume Screen → Phone Screen
    → Technical Interview → System Design (Senior+)
    → Culture Fit → Reference Check → Offer
```

## Stage 1: Job Description

### Template

```markdown
# [Role Title] — [Level]

## About Us
[2-3 sentences about the company and mission]

## What You'll Do
- [responsibility 1 — specific, not generic]
- [responsibility 2]
- [responsibility 3]

## What We're Looking For
### Must Have
- [X] years experience with [technology/domain]
- [specific skill]

### Nice to Have
- [bonus skill]
- [relevant experience]

## Tech Stack
[List actual technologies the team uses]

## What We Offer
- Salary range: $X - $Y (transparent)
- [benefit 1]
- [benefit 2]
- Remote/hybrid/onsite: [specify]

## How to Apply
[clear instructions]
```

### Rules for Job Descriptions
- Always include salary range
- List only genuine requirements (not a wish list)
- Avoid gendered language
- Be specific about day-to-day work
- Max 5 "must have" requirements

## Stage 2: Resume Screen (5 min per resume)

**Pass criteria:**
- Relevant experience with core tech stack
- Evidence of building and shipping products
- Career progression or depth in relevant area

**Red flags (not automatic reject — discuss):**
- Very short tenures everywhere (< 6 months)
- No evidence of collaborative work
- Mismatched seniority claim vs experience

## Stage 3: Phone Screen (30 min)

**Goals:** Verify basics, assess communication, mutual interest.

**Questions:**
1. Walk me through your current/recent project
2. What's a technical challenge you solved recently?
3. What are you looking for in your next role?
4. [1-2 role-specific questions]

**Evaluation:**
- Can they explain technical concepts clearly?
- Do they seem genuinely interested?
- Does their experience align with the role?

## Stage 4: Technical Interview (60-90 min)

### Coding Challenge (Live or Take-Home)

**Live coding (60 min):**
- Real-world problem, not algorithm puzzles
- Allow language of choice
- Provide a working environment (CodeSandbox, shared IDE)
- Evaluate: problem decomposition, code quality, testing mindset

**Take-home (max 3-4 hours):**
- Clearly scoped project with acceptance criteria
- Provide starter template
- Respect candidate's time — compensate if > 2 hours
- Deadline: 5-7 days

### Evaluation Rubric

| Criteria | 1 (Weak) | 2 (Adequate) | 3 (Strong) | 4 (Exceptional) |
|----------|----------|-------------|-----------|-----------------|
| **Problem Solving** | Cannot break down problem | Needs hints but progresses | Solves independently | Elegant, creative solution |
| **Code Quality** | Messy, hard to follow | Functional but inconsistent | Clean, well-structured | Production-quality with edge cases |
| **Testing** | No tests | Basic happy path | Good coverage, edge cases | TDD approach, thorough |
| **Communication** | Silent or unclear | Answers when asked | Thinks aloud naturally | Discusses trade-offs proactively |
| **Technical Depth** | Surface-level knowledge | Knows basics well | Deep understanding | Expert-level, teaches you something |

**Score: 5-8 = No hire, 9-12 = Maybe (discuss), 13-16 = Hire, 17-20 = Strong hire**

## Stage 5: System Design (Senior+ only, 60 min)

**Format:** Design a system relevant to the role.

**Evaluate:**
- Requirements gathering and clarification
- High-level architecture decisions
- Trade-off analysis (consistency vs availability, etc.)
- Scalability considerations
- Data modeling
- API design

## Stage 6: Culture Fit / Values (45 min)

**This is NOT "would I have a beer with them."**

**Questions:**
1. Tell me about a time you disagreed with a teammate. How did you resolve it?
2. Describe a project that failed. What did you learn?
3. How do you handle receiving critical feedback on your code?
4. What does a healthy team dynamic look like to you?

**Evaluate:**
- Collaboration and communication style
- Growth mindset
- Alignment with team values
- Conflict resolution ability

## Decision Framework

### Hiring Committee Review

```markdown
## Candidate: [Name] — [Role]

### Scores
| Stage | Interviewer | Score | Recommendation |
|-------|------------|-------|---------------|
| Phone Screen | @name | X/4 | Advance/Reject |
| Technical | @name | X/20 | Advance/Reject |
| System Design | @name | X/4 | Advance/Reject |
| Culture | @name | X/4 | Advance/Reject |

### Decision: HIRE / NO HIRE / DISCUSS
### Proposed Level: [Junior/Mid/Senior/Staff]
### Proposed Compensation: $X - $Y
```

### Decision Rules
- Any interviewer scores 1/4 on culture = automatic discuss
- Technical score < 9/20 = no hire
- Need majority "Advance" to extend offer
- Discuss within 48 hours of final interview

## Offer Process

1. Verbal offer call (hiring manager)
2. Written offer within 24 hours
3. Give candidate 5-7 business days to decide
4. Be ready to negotiate (know your ranges)
5. Once accepted — start onboarding prep immediately

## Metrics to Track

| Metric | Target |
|--------|--------|
| Time to hire | < 30 days |
| Offer acceptance rate | > 80% |
| Pipeline conversion | > 10% (apply → hire) |
| Candidate satisfaction | > 4/5 |
| 90-day retention | > 90% |
| Source quality | Track which channels produce best hires |

## Rules

- **Never** ask about age, marital status, religion, or protected characteristics
- **Never** ghost candidates — always send a decision, even rejections
- **Always** provide feedback to candidates who reach technical stage
- **Always** use the same rubric for all candidates at the same level
- **Always** have at least 2 interviewers for technical stages
- **Always** compensate take-home assignments that exceed 2 hours
