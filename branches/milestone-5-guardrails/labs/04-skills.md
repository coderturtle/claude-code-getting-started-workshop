# Lab 04 — Skills: make standards automatic
**Goal:** use and/or refine Skills so quality is baked-in.

## Steps
1) Read `.claude/skills/adr-style/SKILL.md`
2) Create `ADR-0001` using the skill
3) If format is off, refine the Skill (tiny edits)

## Prompt
Use: `prompts/04_create_adr.txt`

## Output
- `adrs/ADR-0001-*.md`

## Verification
```bash
bash scripts/checkpoint.sh skills
```

## Next
Go to `labs/05-guardrails.md`


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.
