# Lab 03 — Implement Slice 1 (test-first)
**Goal:** implement your first slice and get tests passing.

## Slice 1 (recommended)
- `GET /health`
- `POST /adrs`
- `GET /adrs`


## TDD rule (mandatory for this lab)
For each behavior: **RED** (failing test) → **GREEN** (minimal code) → (optional) **REFACTOR**.
Use `tdd-coach` if you drift.

## Steps
1) Ask Claude (Plan Mode) to propose a plan using `PLAN-SLICE.md`.
2) Ask `test-writer` to draft tests first.
3) Implement in small diffs:
   - tests
   - minimal implementation
   - run tests
   - repeat

## Prompt
Use: `prompts/03_implement_slice1.txt`

## Verification
```bash
bash scripts/checkpoint.sh slice1
```

## Next
Go to `labs/04-skills.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
