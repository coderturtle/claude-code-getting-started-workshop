# scripts/ — Verification and guard scripts
_Last updated: 2026-01-02_

This folder holds “autograder-lite” scripts used in the workshop.

## Why this helps agentic development
- Keeps feedback loops tight (fast verification)
- Prevents silent regressions
- Supports self-paced learning (clear checkpoints)

## Key scripts
- `checkpoint.sh` — validates milestones (spec/plan/slice/skills/guardrails/final)
  - also provides a soft warning if the working diff touches too many files

## Usage
```bash
bash scripts/checkpoint.sh spec
bash scripts/checkpoint.sh final
```
