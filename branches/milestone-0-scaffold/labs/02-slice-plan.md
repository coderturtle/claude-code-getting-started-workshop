# Lab 02 — Slice planning → `PLAN-SLICE.md`
**Goal:** turn the spec into a small, testable slice plan.

## Steps (plugin path)
1) Run: `/spec:slice`
2) If asked for a section, choose “MVP / Slice 1”.
3) Ask subagents:
   - `api-designer`: endpoint contract + errors
   - `test-writer`: tests-first checklist

## Steps (fallback path)
Paste: `prompts/02_slice_plan.txt`

## Output
- `PLAN-SLICE.md`

## Verification
```bash
bash scripts/checkpoint.sh plan
```

## Next
Go to `labs/03-slice-1.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
