# Lab 05 — Guardrails & security review
**Goal:** add at least one guardrail that prevents an obvious footgun.

## Steps
1) Ask `security-reviewer` to review your storage approach.
2) Implement one guardrail:
   - sanitize titles/filenames
   - deny `..` / absolute paths
   - enforce resolved paths stay inside `/adrs`
3) Add at least one test that proves it works (recommended).
4) If hooks are available, wire them in. If not, document manual usage.

## Prompts
- `prompts/05_security_review.txt`
- `prompts/06_add_guardrail_and_test.txt`

## Verification
```bash
bash scripts/checkpoint.sh guardrails
```

## Next
Go to `labs/06-slice-2.md` (optional) or `labs/07-retro-and-apply.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
