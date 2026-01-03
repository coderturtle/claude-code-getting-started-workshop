# Lab 01 — Spec Interview → `SPEC.md`
**Goal:** produce a usable spec **without writing code**.

## Steps (plugin path)
1) Start Claude Code in repo root
2) Run: `/spec:interview`
3) Answer questions. Don’t be polite—be specific.

## Steps (fallback path)
Paste the prompt from: `prompts/01_interview.txt`

## Output
- `SPEC.md`

## Verification
```bash
bash scripts/checkpoint.sh spec
```

## Common mistakes
- “We’ll figure it out later”
- No error cases
- No naming rules

## Next
Go to `labs/02-slice-plan.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
