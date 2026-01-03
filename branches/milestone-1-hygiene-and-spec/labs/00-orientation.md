# Lab 00 — Orientation & safety rails
**Goal:** get oriented and set yourself up for a smooth run.

## What you need
- Repo checked out at the workshop start point
- Claude Code working in this repo

## Steps
1) Open `CLAUDE.md` and read the “house rules”.
2) Skim:
   - `.claude/agents/`
   - `.claude/skills/`
   - `.claude/hooks/` (or scripts/stubs)
   - `spec-plugin/`
3) Decide your path:
   - **Full experience:** plugin + subagents + skills + guard scripts
   - **Minimal:** prompts in `prompts/`

## Verification
Nothing to run yet.

## Why this matters
A tiny bit of structure prevents chaos:
- project rules (`CLAUDE.md`)
- small diffs
- tests-first
- subagents for separation of concerns

## Next
Go to `labs/01-spec-interview.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
