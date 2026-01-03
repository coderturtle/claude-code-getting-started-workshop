# Lab 00A — Agentic hygiene (keep the repo clean)
_Last updated: 2026-01-02_

**Goal:** prevent Claude Code from generating a chaotic pile of markdown files.  
You’ll set simple rules and use the **repo-hygienist** subagent to keep only what matters.

> Do this right after `labs/00-orientation.md` (before the spec interview).

---

## Why this exists
Claude Code can be *very* productive…and very noisy:
- it may generate lots of “context” docs
- it may duplicate plans/specs
- it may create drafts you don’t want to keep

This lab gives you a system to avoid doc sprawl:
1) **Direct output** to the right homes (labs/prompts/adrs)
2) Use **scratch/** for temporary notes
3) Run periodic **cleanup sweeps** using the repo-hygienist agent

---

## Setup: add/confirm hygiene rules

### 1) Create/confirm a scratch space
- `scratch/` exists and is allowed for temporary notes.
- Anything durable must be promoted out of `scratch/`.

### 2) Read the hygiene agent
Open:
- `.claude/agents/repo-hygienist.md`

### 3) Add hygiene constraints to Claude (recommended)
Paste `prompts/00_agentic_hygiene.txt` into Claude Code at the start of a session.

---

## The hygiene sweep (repeat this after each module)
Run a “sweep” whenever Claude has created multiple docs.

### Prompt (copy/paste)
Use: `prompts/00_hygiene_sweep.txt`

**Expected outcome**
- A short list of what to keep
- A consolidation plan
- Moves into `labs/`, `prompts/`, `adrs/`, or `scratch/`
- Deletion of redundant files

---

## Rules of thumb (simple and effective)
- Prefer **one** `SPEC.md` and **one** `PLAN-SLICE.md`
- Prefer sections added to existing docs rather than new “notes.md”
- Any brainstorming goes to `scratch/` then gets consolidated or deleted
- If you can’t describe a doc’s purpose in one sentence, it probably shouldn’t exist

---

## Quick verification
```bash
git status --porcelain
```
You should only see files you intentionally created (e.g., `SPEC.md` when you do Lab 01).

---

## Next
Proceed to `labs/01-spec-interview.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
