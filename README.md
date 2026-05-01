# Skill For Develop

Bộ công cụ **206 skills** tổng hợp dành cho **Claude Code** — bao phủ toàn bộ vòng đời phát triển phần mềm của một công ty công nghệ, từ ý tưởng → phát triển → vận hành → mở rộng.

```
┌─────────────────────────────────────────────────────────────────┐
│                    SKILL FOR DEVELOP                            │
│                                                                 │
│  14 Superpowers  +  182 ECC  +  10 Company Ops  =  206 Skills  │
│                                                                 │
│  ★ Brainstorm → Plan → Code → Test → Review → Deploy → Run ★  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Mục lục

- [Cài đặt](#cài-đặt)
- [Tổng quan quy trình](#tổng-quan-quy-trình-12-giai-đoạn)
- [Phase 0: Khởi tạo công ty](#phase-0-khởi-tạo-công-ty--dự-án)
- [Phase 1: Sprint Planning](#phase-1-sprint-planning)
- [Phase 2: Brainstorming](#phase-2-brainstorming--thiết-kế)
- [Phase 3: Writing Plans](#phase-3-writing-plans--lập-kế-hoạch)
- [Phase 4: Development](#phase-4-development--phát-triển)
- [Phase 5: Code Review](#phase-5-code-review)
- [Phase 6: Testing](#phase-6-testing)
- [Phase 7: Finishing Branch](#phase-7-finishing-branch)
- [Phase 8: Release](#phase-8-release-management)
- [Phase 9: Deploy & Infrastructure](#phase-9-deploy--infrastructure)
- [Phase 10: Monitoring & Operations](#phase-10-monitoring--operations)
- [Phase 11: Incident Response](#phase-11-incident-response)
- [Phase 12: Metrics & Improvement](#phase-12-metrics--improvement)
- [ECC Commands](#ecc-commands-hữu-ích)
- [Ví dụ thực tế](#ví-dụ-thực-tế-build-task-management-app)

---

## Cài đặt

```bash
git clone https://github.com/toan-vietanhschool/skill-for-develop.git
cd skill-for-develop
```

Tất cả 206 skills đã tích hợp sẵn trong `.claude/skills/`. Mở Claude Code trong thư mục project — Claude tự động nhận diện.

```bash
# Kiểm tra
ls .claude/skills/
```

---

## Tổng quan quy trình (12 giai đoạn)

```
 PHASE 0                PHASE 1              PHASE 2              PHASE 3
┌──────────┐          ┌──────────┐          ┌──────────┐          ┌──────────┐
│ Khởi tạo │────────▶│  Sprint  │────────▶│  Brain-  │────────▶│ Writing  │
│ Công ty  │          │ Planning │          │ storming │          │  Plans   │
└──────────┘          └──────────┘          └──────────┘          └──────────┘
 contract-templates     sprint-ops           brainstorming         writing-plans
 hiring-pipeline        engineering-metrics   deep-research         blueprint
 gdpr-compliance        project-flow-ops     market-research        architecture-
                        jira-integration     product-lens            decision-records
                                             architect agent

      │                                                                │
      │                                                                ▼
 PHASE 12               PHASE 11             PHASE 10             PHASE 4
┌──────────┐          ┌──────────┐          ┌──────────┐          ┌──────────┐
│ Metrics &│◀────────│ Incident │◀────────│Monitoring│◀── ── ──│  Develop │
│Improvemen│          │ Response │          │   & Ops  │          │  (TDD)   │
└──────────┘          └──────────┘          └──────────┘          └──────────┘
 engineering-metrics    incident-response    canary-watch           test-driven-dev
 sprint-ops (retro)     systematic-debugging  automation-audit-ops   parallel-agents
 verification-loop      security-scan        unified-notifications  subagent-driven
                                             enterprise-agent-ops   coding-standards

                                                                       │
                                                                       ▼
                         PHASE 8              PHASE 7              PHASE 5
                       ┌──────────┐          ┌──────────┐          ┌──────────┐
                       │ Release  │◀────────│ Finishing │◀────────│  Code    │
                       │Management│          │  Branch  │          │  Review  │
                       └──────────┘          └──────────┘          └──────────┘
                        release-management    finishing-a-dev-branch requesting-code-review
                        git-workflow          verification-before-   receiving-code-review
                        github-ops             completion            security-review
                                              using-git-worktrees    code-reviewer agent

                              │                                        │
                              ▼                                        │
                         PHASE 9              PHASE 6                  │
                       ┌──────────┐          ┌──────────┐              │
                       │ Deploy & │          │ Testing  │◀─────────────┘
                       │  Infra   │          │  (QA)    │
                       └──────────┘          └──────────┘
                        kubernetes-ops        load-testing
                        infrastructure-as-code e2e-testing
                        docker-patterns       browser-qa
                        deployment-patterns   tdd-workflow
```

---

## Phase 0: Khởi tạo Công ty / Dự án

> Trước khi viết dòng code đầu tiên — chuẩn bị nền tảng pháp lý, nhân sự, và compliance.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `contract-templates` | Custom | Soạn NDA, SLA, MSA, SOW, hợp đồng lao động |
| `hiring-pipeline` | Custom | Thiết kế quy trình tuyển dụng kỹ thuật |
| `gdpr-compliance` | Custom | Checklist tuân thủ bảo vệ dữ liệu |
| `ecc/team-builder` | ECC | Xây dựng cấu trúc team |
| `ecc/codebase-onboarding` | ECC | Hướng dẫn onboarding developer mới |
| `ecc/opensource-pipeline` | ECC | Setup open-source compliance |

### Quy trình thực hiện

```
1. Soạn hợp đồng (contract-templates)
   ├── NDA cho nhân viên và đối tác
   ├── Employment agreement cho developer
   ├── MSA + SOW cho khách hàng
   └── SLA cho sản phẩm SaaS

2. Tuyển dụng (hiring-pipeline)
   ├── Viết Job Description (template có sẵn)
   ├── Thiết kế coding challenge
   ├── Tạo rubric đánh giá (bảng điểm 1-4)
   ├── Phone Screen → Technical → System Design → Culture
   └── Offer và onboarding

3. Compliance (gdpr-compliance)
   ├── Data inventory — liệt kê dữ liệu thu thập
   ├── Privacy Policy + Terms of Service
   ├── Cookie consent implementation
   ├── User rights API (access, delete, export)
   └── Data Processing Agreements với vendors
```

### Nói gì với Claude

```
Tôi đang thành lập công ty phần mềm. Giúp tôi:
1. Soạn NDA mẫu cho nhân viên
2. Tạo quy trình tuyển dụng cho vị trí Senior Backend Developer
3. Checklist GDPR compliance cho sản phẩm SaaS
```

---

## Phase 1: Sprint Planning

> Mỗi sprint (2 tuần) bắt đầu bằng lập kế hoạch — xác định scope, ước lượng, và phân công.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `sprint-ops` | Custom | Sprint planning, standup, review, retro |
| `engineering-metrics` | Custom | Velocity tracking, DORA metrics |
| `ecc/project-flow-ops` | ECC | Quản lý luồng công việc |
| `ecc/jira-integration` | ECC | Tích hợp Jira/Linear |
| `ecc/production-scheduling` | ECC | Lập lịch sản xuất |

### Quy trình thực hiện

```
Sprint Planning (Ngày 1 của sprint)
│
├── 1. Review backlog (Product Owner)
│   └── Ưu tiên theo business value
│
├── 2. Estimation (Team)
│   ├── Story points: 1, 2, 3, 5, 8, 13
│   ├── Mỗi story > 8 points → chia nhỏ
│   └── Tham khảo velocity 3 sprint gần nhất
│
├── 3. Sprint commitment
│   ├── Chọn stories vừa capacity
│   ├── Viết Sprint Goal (1 câu)
│   └── Chia stories thành tasks (max 1 ngày/task)
│
├── 4. Daily Standup (15 phút/ngày)
│   ├── Hôm qua làm gì?
│   ├── Hôm nay làm gì?
│   └── Có blocker không?
│
├── 5. Sprint Review (ngày cuối)
│   └── Demo cho stakeholders
│
└── 6. Retrospective (ngày cuối)
    ├── Start: Thử gì mới?
    ├── Stop: Bỏ gì?
    └── Continue: Giữ gì?
```

### Nói gì với Claude

```
Tạo Sprint Planning cho sprint 5:
- Team 4 người, velocity trung bình 23 points
- Backlog: auth system, dashboard, API endpoints
- Sprint 2 tuần từ hôm nay
```

---

## Phase 2: Brainstorming & Thiết kế

> KHÔNG viết code trước khi có design được approve. Đây là quy tắc số 1.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `brainstorming` | Superpowers | Khám phá ý tưởng theo Socratic method |
| `using-superpowers` | Superpowers | Hướng dẫn dùng toàn bộ hệ thống |
| `ecc/deep-research` | ECC | Nghiên cứu sâu trước khi thiết kế |
| `ecc/market-research` | ECC | Phân tích thị trường |
| `ecc/product-lens` | ECC | Đánh giá tính khả thi sản phẩm |
| `ecc/product-capability` | ECC | Xác định capabilities cần thiết |
| `ecc/blueprint` | ECC | Tạo blueprint tổng thể |
| `ecc/architecture-decision-records` | ECC | Ghi nhận quyết định kiến trúc |
| `ecc/design-system` | ECC | Thiết kế hệ thống UI |
| `ecc/api-design` | ECC | Thiết kế API |

### Quy trình thực hiện

```
1. Mô tả ý tưởng cho Claude
   │
2. Claude hỏi bạn 5-7 câu hỏi (từng câu một):
   ├── Tech stack?
   ├── Database?
   ├── Authentication?
   ├── Deploy target?
   ├── Scale target?
   ├── Budget constraints?
   └── Timeline?
   │
3. Claude nghiên cứu (deep-research + market-research)
   ├── Tìm giải pháp tương tự trên GitHub
   ├── So sánh tech stack options
   └── Đánh giá trade-offs
   │
4. Claude đề xuất 2-3 hướng tiếp cận
   ├── Option A: [ưu/nhược]
   ├── Option B: [ưu/nhược]
   └── Option C: [ưu/nhược]
   │
5. Bạn chọn → Claude viết Design Spec
   │
6. Review spec → Approve hoặc yêu cầu sửa
   │
7. Lưu: docs/superpowers/specs/YYYY-MM-DD-<tên>-design.md
```

### Nói gì với Claude

```
Tạo ứng dụng fullstack quản lý task với Next.js, PostgreSQL, Prisma.
Có auth, CRUD tasks, dashboard thống kê.
```

> Claude sẽ **tự động** kích hoạt brainstorming — bạn không cần gọi skill thủ công.

---

## Phase 3: Writing Plans — Lập kế hoạch

> Mỗi feature được chia thành các bước nhỏ 2-5 phút, theo chuẩn TDD.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `writing-plans` | Superpowers | Tạo implementation plan chi tiết |
| `writing-skills` | Superpowers | Tạo skill mới nếu cần |
| `ecc/blueprint` | ECC | Blueprint tổng thể |
| `ecc/architecture-decision-records` | ECC | Ghi nhận ADR |
| `ecc/hexagonal-architecture` | ECC | Kiến trúc Hexagonal |

### Quy trình thực hiện

```
1. Claude đọc design spec đã approve
   │
2. Chia thành tasks (mỗi task = 1 commit)
   │
3. Mỗi task chia thành steps:
   ├── Write test (RED)
   ├── Run test → verify FAIL
   ├── Write minimal code (GREEN)
   ├── Run test → verify PASS
   ├── Refactor (IMPROVE)
   └── Commit
   │
4. Lưu: docs/superpowers/plans/YYYY-MM-DD-<feature>.md
```

### Ví dụ plan output

```markdown
# Task Management App — Implementation Plan

## Task 1: Project Setup (5 min)
- [ ] Init Next.js with TypeScript
- [ ] Install dependencies
- [ ] Commit: "chore: init project"

## Task 2: Database Schema (15 min)
- [ ] Write test for User model → FAIL
- [ ] Create Prisma schema → PASS
- [ ] Write test for Task model → FAIL
- [ ] Create Task schema → PASS
- [ ] Commit: "feat: add database schema"

## Task 3: Auth Module (20 min)
- [ ] Write test for login → FAIL
- [ ] Implement NextAuth → PASS
- [ ] Write test for register → FAIL
- [ ] Implement registration → PASS
- [ ] Commit: "feat: add authentication"
```

---

## Phase 4: Development — Phát triển

> Thực thi plan theo TDD. Mỗi dòng code phải có test trước.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `executing-plans` | Superpowers | Load và thực thi plan file |
| `test-driven-development` | Superpowers | RED → GREEN → REFACTOR |
| `systematic-debugging` | Superpowers | Debug khi gặp lỗi |
| `dispatching-parallel-agents` | Superpowers | Chạy nhiều task song song |
| `subagent-driven-development` | Superpowers | Phát triển bằng sub-agents |
| `using-git-worktrees` | Superpowers | Nhiều branch cùng lúc |

#### ECC Skills theo ngôn ngữ/framework

| Stack | ECC Skills |
|---|---|
| **TypeScript/JS** | `frontend-patterns`, `backend-patterns`, `nestjs-patterns`, `nextjs-turbopack`, `bun-runtime` |
| **Python** | `python-patterns`, `django-patterns`, `django-tdd`, `python-testing` |
| **Go** | `golang-patterns`, `golang-testing` |
| **Rust** | `rust-patterns`, `rust-testing` |
| **Kotlin** | `kotlin-patterns`, `kotlin-testing`, `kotlin-coroutines-flows`, `kotlin-ktor-patterns` |
| **Swift** | `swiftui-patterns`, `swift-concurrency-6-2`, `swift-actor-persistence` |
| **Java** | `java-coding-standards`, `springboot-patterns`, `jpa-patterns` |
| **C#/.NET** | `dotnet-patterns`, `csharp-testing` |
| **Laravel/PHP** | `laravel-patterns`, `laravel-tdd`, `laravel-security` |
| **C++** | `cpp-coding-standards`, `cpp-testing` |
| **Perl** | `perl-patterns`, `perl-testing`, `perl-security` |
| **Flutter/Dart** | `dart-flutter-patterns`, `flutter-dart-code-review` |
| **Android** | `android-clean-architecture`, `compose-multiplatform-patterns` |
| **Database** | `postgres-patterns`, `database-migrations`, `clickhouse-io` |
| **Docker** | `docker-patterns` |
| **API** | `api-design`, `api-connector-builder`, `mcp-server-patterns` |

### Quy trình thực hiện

```
1. Load plan file
   │
2. Claude tạo TodoWrite checklist
   │
3. Thực thi từng task:
   │
   ├── Bước TDD cho mỗi task:
   │   ┌─────────────────────────────────────────┐
   │   │  RED ────▶ GREEN ────▶ REFACTOR ────▶ ↩ │
   │   │  Viết test  Code tối    Clean up    Lặp │
   │   │  → fail     thiểu →pass             lại │
   │   └─────────────────────────────────────────┘
   │
   ├── Nếu 2+ task độc lập → Parallel Agents:
   │   Main Agent (điều phối)
   │   ├── Agent 1: Build REST API
   │   ├── Agent 2: Build React UI
   │   └── Agent 3: Setup auth
   │
   ├── Nếu gặp bug → Systematic Debugging:
   │   Phase 1: Investigation (KHÔNG đoán)
   │   Phase 2: Isolation (thu hẹp phạm vi)
   │   Phase 3: Fix (sửa root cause)
   │   Phase 4: Defense (thêm regression test)
   │
   └── Mỗi task hoàn thành = 1 commit
```

### Quy tắc sắt TDD

- Viết code trước test? → **XÓA code, bắt đầu lại**
- Test chưa fail? → Test chưa đúng
- Không giữ code-trước-test làm "tham khảo"

### Nói gì với Claude

```
Thực thi plan trong docs/superpowers/plans/2026-05-01-task-app.md
Bắt đầu từ Task 1.
```

---

## Phase 5: Code Review

> Mỗi dòng code phải được review trước khi merge.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `requesting-code-review` | Superpowers | Yêu cầu review hiệu quả |
| `receiving-code-review` | Superpowers | Xử lý feedback |
| `ecc/security-review` | ECC | Review bảo mật |
| `ecc/security-scan` | ECC | Quét lỗ hổng tự động |
| `ecc/coding-standards` | ECC | Kiểm tra coding standards |
| `ecc/plankton-code-quality` | ECC | Đánh giá chất lượng code |
| `ecc/flutter-dart-code-review` | ECC | Review code Flutter |
| `ecc/gateguard` | ECC | Gate check trước merge |

### Quy trình thực hiện

```
1. Developer hoàn thành task
   │
2. Requesting Code Review:
   ├── Tạo PR với mô tả rõ ràng
   ├── Link đến task/story
   ├── Mô tả thay đổi và lý do
   ├── Highlight điểm cần chú ý
   └── Self-review checklist trước khi gửi
   │
3. Reviewer thực hiện:
   ├── Security check TRƯỚC TIÊN
   │   ├── Hardcoded secrets?
   │   ├── SQL injection?
   │   ├── XSS vulnerabilities?
   │   └── Auth bypass?
   │
   ├── Code quality check:
   │   ├── Functions < 50 lines?
   │   ├── Files < 800 lines?
   │   ├── No deep nesting > 4 levels?
   │   ├── Error handling đầy đủ?
   │   └── Tests coverage ≥ 80%?
   │
   └── Đánh giá severity:
       ├── CRITICAL → BLOCK (phải sửa)
       ├── HIGH → WARN (nên sửa)
       ├── MEDIUM → INFO (cân nhắc)
       └── LOW → NOTE (tùy chọn)
   │
4. Receiving Code Review:
   ├── Đọc feedback không defensive
   ├── Sửa CRITICAL và HIGH trước
   ├── Thảo luận nếu không đồng ý
   └── Push fixes → re-review
   │
5. Approve → Ready to merge
```

### Nói gì với Claude

```
Review code trong PR này. Kiểm tra security trước, rồi code quality.
Focus vào auth module và database queries.
```

---

## Phase 6: Testing

> Đảm bảo code chạy đúng, nhanh, và an toàn trước khi release.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `load-testing` | Custom | Performance testing (k6/Artillery) |
| `ecc/e2e-testing` | ECC | End-to-end tests (Playwright/Cypress) |
| `ecc/browser-qa` | ECC | QA trên browser |
| `ecc/tdd-workflow` | ECC | Workflow TDD tổng thể |
| `ecc/ai-regression-testing` | ECC | AI-powered regression tests |
| `ecc/accessibility` | ECC | Kiểm tra accessibility |
| `ecc/benchmark` | ECC | Benchmark performance |
| `ecc/eval-harness` | ECC | Evaluation framework |

#### ECC Testing theo framework

| Framework | ECC Skills |
|---|---|
| Django | `django-tdd`, `django-verification` |
| Spring Boot | `springboot-tdd`, `springboot-verification` |
| Laravel | `laravel-tdd`, `laravel-verification` |
| Kotlin | `kotlin-testing` |
| Go | `golang-testing` |
| Python | `python-testing` |
| C++ | `cpp-testing` |
| C# | `csharp-testing` |
| Rust | `rust-testing` |
| Perl | `perl-testing` |

### Quy trình thực hiện

```
1. Unit Tests (đã có từ TDD)
   ├── Coverage ≥ 80%
   └── Chạy tự động trong CI
   │
2. Integration Tests
   ├── API endpoints
   ├── Database operations
   └── External service mocks
   │
3. E2E Tests (e2e-testing + browser-qa)
   ├── Critical user flows
   ├── Cross-browser: Chrome, Firefox, Safari
   ├── Responsive: 320, 768, 1024, 1440px
   └── Accessibility check
   │
4. Load Testing (load-testing)
   ├── Smoke test: 1-5 users → verify chạy
   ├── Load test: ramp to expected users
   ├── Stress test: tìm breaking point
   ├── Spike test: traffic đột ngột
   └── Targets:
       ├── p95 response < 500ms
       ├── Error rate < 0.1%
       └── CPU < 70% at normal load
   │
5. Security Testing (security-scan)
   ├── Dependency vulnerabilities (Snyk/Dependabot)
   ├── OWASP Top 10 check
   └── Penetration testing (nếu cần)
```

### Nói gì với Claude

```
Viết load test cho API endpoint /api/tasks:
- 50 concurrent users
- Ramp up 2 phút, steady 5 phút
- Target: p95 < 500ms, error rate < 1%
Dùng k6.
```

---

## Phase 7: Finishing Branch

> Kiểm tra lần cuối trước khi merge vào main.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `finishing-a-development-branch` | Superpowers | Quy trình hoàn thành branch |
| `verification-before-completion` | Superpowers | Checklist trước khi đánh dấu done |
| `using-git-worktrees` | Superpowers | Quản lý worktrees |
| `ecc/git-workflow` | ECC | Git best practices |
| `ecc/github-ops` | ECC | GitHub operations |
| `ecc/verification-loop` | ECC | Vòng lặp kiểm tra |

### Quy trình thực hiện

```
1. Verification Before Completion:
   ├── [ ] Tất cả tests pass
   ├── [ ] Coverage ≥ 80%
   ├── [ ] No lint errors
   ├── [ ] No TypeScript errors
   ├── [ ] No security vulnerabilities
   ├── [ ] Documentation updated
   ├── [ ] PR description đầy đủ
   └── [ ] Self-review hoàn tất
   │
2. Finishing Branch:
   ├── Rebase lên latest main
   ├── Resolve conflicts (nếu có)
   ├── Squash commits nếu quá nhiều
   ├── Commit message theo conventional commits
   │   └── feat: | fix: | refactor: | docs: | test: | chore:
   └── Push và request final review
   │
3. Merge:
   ├── Squash merge hoặc merge commit
   ├── Delete branch sau merge
   └── Verify CI/CD pipeline pass
```

---

## Phase 8: Release Management

> Ship phần mềm một cách có kiểm soát — versioning, changelog, feature flags.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `release-management` | Custom | Versioning, changelog, rollback |
| `ecc/git-workflow` | ECC | Tag, branch strategy |
| `ecc/github-ops` | ECC | GitHub Releases |
| `ecc/canary-watch` | ECC | Canary deployment monitoring |
| `ecc/deployment-patterns` | ECC | Deployment strategies |

### Quy trình thực hiện

```
1. Pre-Release Checklist:
   ├── [ ] Tất cả features merged
   ├── [ ] No critical bugs open
   ├── [ ] Tests pass (unit + integration + e2e)
   ├── [ ] Load test pass
   ├── [ ] Security scan clean
   ├── [ ] DB migrations tested on staging
   └── [ ] API docs updated
   │
2. Versioning (SemVer):
   ├── MAJOR.MINOR.PATCH
   ├── Breaking change → bump MAJOR
   ├── New feature → bump MINOR
   └── Bug fix → bump PATCH
   │
3. Generate Changelog:
   ├── feat: → Added
   ├── fix: → Fixed
   ├── perf: → Performance
   └── breaking: → Breaking Changes
   │
4. Feature Flag Rollout:
   ├── 1% → smoke test
   ├── 5% → canary
   ├── 25% → expanded
   ├── 50% → half
   ├── 100% → full release
   └── Cleanup flag within 30 days
   │
5. Tag & Publish:
   └── git tag -a v2.4.0 && git push --tags
       └── gh release create v2.4.0
```

### Nói gì với Claude

```
Tạo release v2.4.0:
- Generate changelog từ commits sau v2.3.0
- Viết release notes
- Tag và publish lên GitHub
```

---

## Phase 9: Deploy & Infrastructure

> Triển khai lên cloud một cách tự động, reproducible, và an toàn.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `kubernetes-ops` | Custom | Deploy, scale K8s |
| `infrastructure-as-code` | Custom | Terraform/Pulumi patterns |
| `ecc/docker-patterns` | ECC | Containerization |
| `ecc/deployment-patterns` | ECC | Deployment strategies |
| `ecc/canary-watch` | ECC | Canary monitoring |

### Quy trình thực hiện

```
1. Infrastructure as Code:
   ├── Terraform/Pulumi cho cloud resources
   ├── Dev → Staging → Production
   ├── Same modules, different variables
   ├── Remote state + state locking
   └── PR review cho mọi infra change
   │
2. Containerization (Docker):
   ├── Multi-stage Dockerfile
   ├── .dockerignore
   ├── Health check endpoint
   └── Non-root user
   │
3. Kubernetes Deployment:
   ├── Deployment manifest
   │   ├── Resource limits (CPU/Memory)
   │   ├── Liveness + Readiness probes
   │   ├── Rolling update strategy
   │   └── HPA (auto-scaling)
   │
   ├── Service + Ingress
   ├── ConfigMap + Secrets
   └── Namespace per environment
   │
4. Deploy Strategy:
   ├── Rolling Update (default, zero-downtime)
   ├── Blue-Green (instant rollback)
   ├── Canary (1% → 5% → 25% → 100%)
   └── Rollback plan LUÔN sẵn sàng
```

### Nói gì với Claude

```
Tạo Kubernetes manifests cho ứng dụng Next.js:
- 3 replicas, auto-scale to 10
- Health check trên /api/health
- Rolling update, zero downtime
- Resource limits: 200m CPU, 256Mi memory
```

---

## Phase 10: Monitoring & Operations

> Giám sát hệ thống 24/7 — biết trước vấn đề trước khi user báo.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `ecc/canary-watch` | ECC | Theo dõi canary deployments |
| `ecc/automation-audit-ops` | ECC | Audit tự động |
| `ecc/enterprise-agent-ops` | ECC | Vận hành agent hệ thống |
| `ecc/unified-notifications-ops` | ECC | Quản lý notifications |
| `ecc/workspace-surface-audit` | ECC | Audit workspace |
| `ecc/dashboard-builder` | ECC | Xây dựng dashboards |
| `ecc/continuous-agent-loop` | ECC | Agent giám sát liên tục |

### Quy trình thực hiện

```
1. Monitoring Stack:
   ├── Metrics: Prometheus/Datadog
   ├── Logs: ELK/Loki
   ├── Traces: Jaeger/Zipkin
   ├── Alerts: PagerDuty/Opsgenie
   └── Dashboards: Grafana
   │
2. Giám sát các chỉ số:
   ├── Application: response time, error rate, throughput
   ├── Infrastructure: CPU, memory, disk, network
   ├── Database: connections, query time, replication lag
   ├── Business: active users, conversions, revenue
   └── SLO: uptime 99.9% = max 43 phút downtime/tháng
   │
3. Alert Rules:
   ├── Error rate > 1% → Page on-call
   ├── p99 latency > 2s → Warn team
   ├── CPU > 85% → Scale alert
   ├── Disk > 90% → Critical
   └── Certificate expiry < 30 days → Warn
   │
4. Operations:
   ├── On-call rotation (weekly)
   ├── Runbooks cho từng alert
   ├── Automated remediation khi có thể
   └── Monthly ops review
```

---

## Phase 11: Incident Response

> Khi production có sự cố — phản ứng nhanh, có hệ thống, không đổ lỗi.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `incident-response` | Custom | Full incident lifecycle |
| `systematic-debugging` | Superpowers | Root cause analysis |
| `ecc/security-scan` | ECC | Quét bảo mật khẩn cấp |
| `ecc/security-bounty-hunter` | ECC | Tìm lỗ hổng |
| `ecc/safety-guard` | ECC | Safety checks |

### Quy trình thực hiện

```
SEV1 Alert Fires!
│
├── Phase 1: Detection & Triage (0-15 min)
│   ├── Assign Incident Commander
│   ├── Đánh giá severity (SEV1-4)
│   ├── Mở incident channel
│   └── Thu thập: Khi nào? Thay đổi gì? Ai bị ảnh hưởng?
│
├── Phase 2: Containment (15-60 min)
│   ├── CÓ THỂ rollback? → Rollback NGAY
│   ├── CÓ feature flag? → TẮT flag
│   ├── CÓ THỂ scale? → Thêm capacity
│   └── Không được? → Chuyển Phase 3
│
├── Phase 3: Resolution
│   ├── Root cause investigation (systematic-debugging)
│   │   ├── KHÔNG đoán
│   │   ├── Thu hẹp phạm vi (bisect)
│   │   └── Tìm nguyên nhân gốc
│   ├── Hotfix → expedited review
│   ├── Deploy fix
│   └── Monitor 30 phút sau fix
│
└── Phase 4: Postmortem (trong 48 giờ)
    ├── Timeline phút-by-phút
    ├── 5 Whys analysis
    ├── Action items có owner + deadline
    └── BLAMELESS — sửa hệ thống, không đổ lỗi người
```

### Nói gì với Claude

```
Production API trả về 500 errors cho 30% requests từ 10 phút trước.
Giúp tôi investigate root cause. Không sửa vội — tìm nguyên nhân trước.
```

---

## Phase 12: Metrics & Improvement

> Đo lường → phân tích → cải tiến liên tục.

### Skills sử dụng

| Skill | Loại | Hành động |
|---|---|---|
| `engineering-metrics` | Custom | DORA metrics, delivery health |
| `sprint-ops` (retrospective) | Custom | Sprint retrospective |
| `ecc/verification-loop` | ECC | Vòng lặp kiểm chứng |
| `ecc/continuous-learning` | ECC | Học hỏi liên tục |
| `ecc/continuous-learning-v2` | ECC | Phiên bản nâng cao |
| `ecc/ecc-tools-cost-audit` | ECC | Audit chi phí tools |
| `ecc/cost-aware-llm-pipeline` | ECC | Tối ưu chi phí AI |
| `ecc/token-budget-advisor` | ECC | Quản lý token budget |
| `ecc/context-budget` | ECC | Tối ưu context window |

### DORA Metrics — Mục tiêu

| Metric | Elite | Hiện tại | Mục tiêu |
|--------|-------|----------|----------|
| **Deploy Frequency** | Multiple/day | ___ | ___ |
| **Lead Time** | < 1 hour | ___ | ___ |
| **Change Failure Rate** | < 5% | ___ | ___ |
| **MTTR** | < 1 hour | ___ | ___ |

### Quy trình thực hiện

```
Monthly Engineering Review:
│
├── 1. Thu thập metrics
│   ├── Deployment frequency
│   ├── Lead time for changes
│   ├── Change failure rate
│   ├── Mean time to recovery
│   ├── Test coverage
│   ├── Sprint velocity trend
│   └── Escaped defects
│
├── 2. Phân tích trends
│   ├── So sánh với tháng trước
│   ├── Identify bottlenecks
│   └── Root cause cho regression
│
├── 3. Action items
│   ├── Top 3 cải tiến cho tháng tới
│   ├── Owner + deadline
│   └── Measurable targets
│
└── 4. Retrospective
    ├── Start: thử gì mới
    ├── Stop: bỏ gì
    └── Continue: giữ gì
```

### Nói gì với Claude

```
Tạo Engineering Report tháng 5/2026:
- Phân tích git log để tính deployment frequency và lead time
- So sánh với tháng trước
- Đề xuất 3 cải tiến
```

---

## ECC Commands hữu ích

67 slash commands có sẵn. Mapping theo phase:

| Phase | Command | Công dụng |
|---|---|---|
| Planning | `/plan` | Tạo implementation plan |
| Development | `/feature-dev` | Phát triển feature mới |
| Development | `/multi-frontend` | Multi-agent frontend dev |
| Development | `/multi-backend` | Multi-agent backend dev |
| Review | `/code-review` | Review code |
| Review | `/review-pr` | Review pull request |
| Testing | `/test-coverage` | Kiểm tra test coverage |
| Quality | `/quality-gate` | Kiểm tra chất lượng |
| Quality | `/refactor-clean` | Refactor code |
| Session | `/save-session` | Lưu session hiện tại |
| Session | `/resume-session` | Resume session đã lưu |

---

## ECC Skills theo phòng ban

### Engineering (Phát triển)

| Nhóm | Skills |
|---|---|
| **Frontend** | `frontend-patterns`, `design-system`, `liquid-glass-design`, `accessibility`, `ui-demo`, `frontend-slides` |
| **Backend** | `backend-patterns`, `api-design`, `api-connector-builder`, `hexagonal-architecture`, `mcp-server-patterns` |
| **Database** | `postgres-patterns`, `database-migrations`, `clickhouse-io` |
| **DevOps** | `docker-patterns`, `deployment-patterns`, `canary-watch` |
| **AI/ML** | `pytorch-patterns`, `prompt-optimizer`, `cost-aware-llm-pipeline`, `foundation-models-on-device`, `agentic-engineering` |

### Security (Bảo mật)

`security-review`, `security-scan`, `security-bounty-hunter`, `gateguard`, `safety-guard`, `hipaa-compliance`, `django-security`, `laravel-security`, `springboot-security`, `perl-security`, `llm-trading-agent-security`, `defi-amm-security`

### Content & Marketing

`content-engine`, `seo`, `brand-voice`, `crosspost`, `article-writing`, `social-graph-ranker`, `lead-intelligence`, `investor-outreach`, `investor-materials`, `market-research`

### Operations

`automation-audit-ops`, `email-ops`, `messages-ops`, `google-workspace-ops`, `knowledge-ops`, `finance-billing-ops`, `customer-billing-ops`, `project-flow-ops`, `terminal-ops`, `workspace-surface-audit`, `unified-notifications-ops`, `enterprise-agent-ops`

### Specialized

`healthcare-cdss-patterns`, `healthcare-emr-patterns`, `healthcare-phi-compliance`, `customs-trade-compliance`, `energy-procurement`, `inventory-demand-planning`, `logistics-exception-management`, `carrier-relationship-management`, `visa-doc-translate`

---

## Ví dụ thực tế: Build Task Management App

### 1. Khởi tạo

```bash
git clone https://github.com/toan-vietanhschool/skill-for-develop.git my-task-app
cd my-task-app
git remote set-url origin <your-repo-url>
```

### 2. Mở Claude Code và nói:

```
Tạo ứng dụng fullstack quản lý task.
Tech stack: Next.js 14, PostgreSQL, Prisma, NextAuth, Tailwind CSS.

Features:
- Đăng ký/đăng nhập
- CRUD tasks với title, description, status, priority
- Dashboard thống kê (tasks by status, overdue count)
- Filter/search tasks
- Responsive UI
```

### 3. Claude tự động chạy qua 12 phases:

```
Phase 2  [Brainstorming]  → Hỏi 5-7 câu → đề xuất approaches → design spec
Phase 3  [Writing Plans]  → Chia 8-12 tasks → mỗi task có TDD steps
Phase 4  [Executing]      → Task 1: Setup → commit
                           → Task 2: DB schema → commit
                           → Task 3: Auth → commit
                           → ...parallel agents cho frontend + backend
Phase 5  [Code Review]    → Security check → quality check → approve
Phase 6  [Testing]        → Unit + E2E + load test
Phase 7  [Finishing]      → Verification checklist → merge
Phase 8  [Release]        → Changelog → tag v1.0.0
Phase 9  [Deploy]         → Docker → K8s → production
Phase 10 [Monitoring]     → Dashboards → alerts
```

---

## Cấu trúc thư mục

```
skill-for-develop/
├── .claude/
│   └── skills/                          ← 206 skills tổng cộng
│       │
│       │── Superpowers (14 skills)
│       ├── brainstorming/
│       ├── writing-plans/
│       ├── executing-plans/
│       ├── test-driven-development/
│       ├── systematic-debugging/
│       ├── dispatching-parallel-agents/
│       ├── finishing-a-development-branch/
│       ├── verification-before-completion/
│       ├── requesting-code-review/
│       ├── receiving-code-review/
│       ├── subagent-driven-development/
│       ├── using-git-worktrees/
│       ├── using-superpowers/
│       ├── writing-skills/
│       │
│       │── Company Operations (10 skills)
│       ├── incident-response/
│       ├── infrastructure-as-code/
│       ├── sprint-ops/
│       ├── engineering-metrics/
│       ├── gdpr-compliance/
│       ├── contract-templates/
│       ├── hiring-pipeline/
│       ├── kubernetes-ops/
│       ├── load-testing/
│       ├── release-management/
│       │
│       │── ECC (182 sub-skills)
│       └── ecc/
│
├── install.sh
├── install.ps1
├── README.md
├── LICENSE
└── .gitignore
```

---

## Credits

Repo này tổng hợp skills từ:

- **[obra/superpowers](https://github.com/obra/superpowers)** — Agentic skills framework. MIT License.
- **[affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)** — Agent harness optimization. MIT License.
- **[Awesome Claude Skills](https://awesome-skills.com/)** — Nguồn tham khảo.
- **Company Operations Skills** — Custom skills cho vận hành công ty phần mềm.

---

## License

MIT License. Xem [LICENSE](LICENSE) chi tiết.
