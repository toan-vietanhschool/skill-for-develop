# Skill For Develop

Bộ công cụ skills tổng hợp dành cho **Claude Code** — giúp developer xây dựng dự án fullstack một cách có hệ thống, từ brainstorm ý tưởng đến deploy sản phẩm.

Tích hợp **Top 7 skills phổ biến nhất** từ [Awesome Claude Skills](https://awesome-skills.com/), bao gồm:

| # | Skill | Stars | Tác giả | Công dụng |
|---|---|---|---|---|
| 1 | Everything Claude Code | ★ 157,565 | affaan-m | Plugin toàn diện: 60+ skills, 16 rules, 67 commands |
| 2 | Test-Driven Development | ★ 154,473 | obra | Vòng lặp RED-GREEN-REFACTOR chuẩn TDD |
| 3 | Systematic Debugging | ★ 154,473 | obra | Quy trình debug 4 giai đoạn tìm root cause |
| 4 | Brainstorming | ★ 154,473 | obra | Thiết kế trước khi code theo phong cách Socratic |
| 5 | Writing Plans | ★ 154,473 | obra | Tạo kế hoạch implementation chi tiết |
| 6 | Executing Plans | ★ 154,473 | obra | Thực thi kế hoạch có checkpoint |
| 7 | Parallel Agents | ★ 154,473 | obra | Điều phối nhiều subagent chạy song song |

---

## Cài đặt nhanh

### Bước 1: Clone repo

```bash
git clone https://github.com/toan-vietanhschool/skill-for-develop.git
cd skill-for-develop
```

### Bước 2: Sử dụng

Tất cả skills đã được tích hợp sẵn trong `.claude/skills/`. Chỉ cần mở Claude Code trong thư mục project — Claude sẽ tự động nhận diện.

```bash
# Kiểm tra skills đã có sẵn
ls .claude/skills/
```

---

## Cách sử dụng

### Workflow tổng thể

```
         ┌──────────────┐
         │ Brainstorming │  ← Mô tả ý tưởng
         └──────┬───────┘
                │
         ┌──────▼───────┐
         │ Writing Plans │  ← Tạo plan chi tiết
         └──────┬───────┘
                │
         ┌──────▼────────┐
         │Executing Plans │  ← Thực thi từng bước
         └──────┬────────┘
                │
    ┌───────────┼───────────┐
    │           │           │
┌───▼───┐  ┌───▼───┐  ┌───▼───┐
│  TDD  │  │ Debug │  │Parallel│  ← Hỗ trợ trong lúc code
└───────┘  └───────┘  └────────┘
```

### Bước 1: Brainstorming — Thiết kế trước khi code

Bắt đầu bằng cách mô tả project cho Claude. Ví dụ:

```
Tạo ứng dụng fullstack quản lý task với Next.js, PostgreSQL, Prisma.
Có auth, CRUD tasks, dashboard thống kê.
```

Claude sẽ **tự động** kích hoạt skill `brainstorming`:

1. Khám phá context project hiện tại
2. Hỏi bạn **từng câu một** để hiểu rõ yêu cầu:
   - Tech stack? (Next.js / Express / NestJS...)
   - Database? (PostgreSQL / MongoDB / SQLite...)
   - Auth? (JWT / OAuth / Session...)
   - Deploy target? (Vercel / AWS / Docker...)
3. Đề xuất **2-3 hướng tiếp cận** với trade-offs
4. Trình bày **design spec** → chờ bạn approve
5. Lưu spec vào `docs/superpowers/specs/YYYY-MM-DD-<tên>-design.md`

> **Quy tắc:** KHÔNG có code nào được viết trước khi bạn approve design.

### Bước 2: Writing Plans — Lập kế hoạch

Sau khi design được approve, Claude chuyển sang `writing-plans`:

- Tạo **implementation plan** chi tiết
- Mỗi task chia thành **bước nhỏ 2-5 phút**
- Mỗi bước theo chuẩn TDD: test trước → code sau
- Lưu plan vào `docs/superpowers/plans/YYYY-MM-DD-<feature>.md`

**Ví dụ plan cho fullstack app:**

```markdown
# Task Management App — Implementation Plan

## Task 1: Project Setup
- [ ] Init Next.js with TypeScript
- [ ] Install dependencies (Prisma, NextAuth, Tailwind)
- [ ] Configure tsconfig.json
- [ ] Commit: "chore: init project"

## Task 2: Database Schema
- [ ] Write test for User model
- [ ] Run test → verify FAIL (RED)
- [ ] Create Prisma schema for User
- [ ] Run test → verify PASS (GREEN)
- [ ] Commit: "feat: add User model"

## Task 3: Auth Module
- [ ] Write test for login endpoint
- [ ] Run test → verify FAIL
- [ ] Implement NextAuth with credentials
- [ ] Run test → verify PASS
- [ ] Commit: "feat: add authentication"

... (tiếp tục)
```

### Bước 3: Executing Plans — Thực thi

Claude dùng `executing-plans` để chạy plan:

1. Load plan file
2. Review → nếu có concern thì hỏi bạn
3. Thực thi **từng task** với TodoWrite tracking
4. Mỗi task hoàn thành = **1 commit**

### Bước 4: TDD — Viết test trước, code sau

Mỗi task trong plan đều tuân thủ `test-driven-development`:

```
┌──────────────────────────────────────────────────┐
│                                                  │
│  RED ──────► GREEN ──────► REFACTOR ──────► ↩    │
│  Viết test   Code tối      Clean up      Lặp    │
│  → fail      thiểu → pass                lại    │
│                                                  │
└──────────────────────────────────────────────────┘
```

**Quy tắc sắt:**
- Viết code trước test? → **XÓA code, bắt đầu lại**
- Không giữ code-trước-test làm "tham khảo"
- Nếu test chưa fail → test chưa đúng

### Bước 5: Systematic Debugging — Debug có hệ thống

Khi gặp bug, Claude dùng `systematic-debugging`:

| Phase | Hành động | Quy tắc |
|---|---|---|
| 1. Investigation | Tìm root cause | KHÔNG đoán, KHÔNG sửa vội |
| 2. Isolation | Cô lập bằng bisect | Thu hẹp phạm vi |
| 3. Fix | Sửa nguyên nhân gốc | Không sửa triệu chứng |
| 4. Defense | Thêm test regression | Ngăn bug tái phát |

### Bước 6: Parallel Agents — Chạy song song

Khi có **2+ task độc lập**, Claude dùng `dispatching-parallel-agents`:

```
Ví dụ: Build fullstack app

Main Agent (điều phối)
├── Agent 1: Build REST API endpoints
├── Agent 2: Build React UI components  
└── Agent 3: Setup auth + middleware
```

**Khi nào dùng:**
- Nhiều subsystem độc lập
- Không chia sẻ state
- Mỗi phần có thể test riêng

**KHÔNG dùng khi:**
- Task phụ thuộc lẫn nhau
- Cần hiểu toàn bộ system state

---

## ECC Commands hữu ích

Sau khi cài ECC, bạn có thêm 67 slash commands. Một số hay dùng:

| Command | Công dụng |
|---|---|
| `/plan` | Tạo implementation plan |
| `/code-review` | Review code |
| `/test-coverage` | Kiểm tra test coverage |
| `/feature-dev` | Phát triển feature mới |
| `/refactor-clean` | Refactor code |
| `/quality-gate` | Kiểm tra chất lượng |
| `/review-pr` | Review pull request |
| `/save-session` | Lưu session hiện tại |
| `/resume-session` | Resume session đã lưu |
| `/multi-frontend` | Multi-agent frontend dev |
| `/multi-backend` | Multi-agent backend dev |

---

## Ví dụ thực tế: Build Task Management App

### 1. Khởi tạo

```bash
mkdir my-task-app && cd my-task-app
git init
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

### 3. Claude tự động chạy workflow:

```
[Brainstorming] → Hỏi bạn 5-7 câu hỏi làm rõ
                → Đề xuất 2-3 approaches
                → Trình bày design spec
                → Chờ approve

[Writing Plans] → Chia thành 8-12 tasks
                → Mỗi task có 3-5 steps TDD
                → Lưu plan file

[Executing]     → Task 1: Setup → commit
                → Task 2: DB schema → commit
                → Task 3: Auth → commit
                → ...
                → Task N: Deploy config → commit

[Hoàn thành]    → Tất cả tests pass
                → Code reviewed
                → Ready to deploy
```

---

## Cấu trúc thư mục

```
skill-for-develop/
├── .claude/
│   └── skills/                          ← Skills chính (project-level)
│       ├── brainstorming/               ← Thiết kế ý tưởng
│       ├── test-driven-development/     ← TDD workflow
│       ├── systematic-debugging/        ← Debug 4 giai đoạn
│       ├── writing-plans/               ← Viết implementation plan
│       ├── executing-plans/             ← Thực thi plan
│       ├── dispatching-parallel-agents/ ← Chạy agent song song
│       └── ecc/                         ← 182 ECC sub-skills
│
├── install.sh                           ← Installer (Linux/Mac)
├── install.ps1                          ← Installer (Windows)
├── README.md                            ← File này
└── .gitignore
```

---

## Credits

Repo này tổng hợp skills từ các tác giả:

- **[obra/superpowers](https://github.com/obra/superpowers)** (★175k) — An agentic skills framework & software development methodology. MIT License.
- **[affaan-m/everything-claude-code](https://github.com/affaan-m/everything-claude-code)** (★171k) — The agent harness performance optimization system. MIT License.
- **[Awesome Claude Skills](https://awesome-skills.com/)** — Nguồn tham khảo skills.

---

## License

Repo này tổng hợp từ các dự án mã nguồn mở với MIT License. Xem LICENSE của từng repo gốc.
