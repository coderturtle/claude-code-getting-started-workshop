# SELF-PACED-CHECKLIST.md — Claude Code Workshop
_Last updated: 2026-01-02_

Print this or keep it open while you work.

## Setup
- [ ] I can run Claude Code in the repo root
- [ ] I have Python 3.12 available
- [ ] (Optional) I can load the spec plugin: `claude --plugin-dir ./spec-plugin`
- [ ] I can run checkpoint script: `bash scripts/checkpoint.sh spec`

## Module completion (minimum path)
### Lab 00 — Orientation
- [ ] Read `CLAUDE.md` (house rules)
- [ ] Skim `.claude/agents`, `.claude/skills`, `.claude/hooks`, `spec-plugin`

### Lab 00A — Agentic hygiene
- [ ] Ran hygiene prompt (`prompts/00_agentic_hygiene.txt`) and got a hygiene report
- [ ] Confirmed temporary notes are in `scratch/` only

### Lab 01 — Spec Interview
- [ ] Generated `SPEC.md` (plugin or fallback prompt)
- [ ] Ran: `bash scripts/checkpoint.sh spec`

### Lab 02 — Slice plan
- [ ] Generated `PLAN-SLICE.md`
- [ ] Consulted at least 2 subagents (or role-played them)
- [ ] Ran: `bash scripts/checkpoint.sh plan`

### Lab 03A — TDD (Red → Green)
- [ ] Completed `labs/03a-tdd-red-green.md`
- [ ] Used `tdd-coach` (or followed the Red→Green ritual)

### Lab 03 — Slice 1 implemented (test-first)
- [ ] Implemented: `GET /health`, `POST /adrs`, `GET /adrs`
- [ ] Tests exist and pass (or compileall passes if you’re early)
- [ ] Ran: `bash scripts/checkpoint.sh slice1`

### Lab 04 — Skills
- [ ] Used/refined `adr-style` Skill
- [ ] Created `adrs/ADR-0001-*.md`
- [ ] Ran: `bash scripts/checkpoint.sh skills`

### Lab 05 — Guardrails
- [ ] Ran a security review (security-reviewer)
- [ ] Implemented 1 guardrail (and ideally a test)
- [ ] Ran: `bash scripts/checkpoint.sh guardrails`

### Lab 07 — Retro & apply
- [ ] Wrote down 1 Skill to add to a real repo
- [ ] Wrote down 1 hook/guard to add to a real repo
- [ ] Ran: `bash scripts/checkpoint.sh final`

## Stretch goals (optional)
- [ ] Completed 1+ challenge cards
- [ ] Implemented Slice 2 (get/delete)
- [ ] Standardized error schema
- [ ] Added pagination
