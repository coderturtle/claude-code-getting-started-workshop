# .claude/skills/ — Skills (make standards automatic)
_Last updated: 2026-01-02_

Skills are reusable, portable instructions that enforce consistent output.

## Why this helps agentic development
- If you repeat a rule twice, it belongs in a Skill.
- Skills reduce prompt boilerplate and make quality consistent.
- Skills scale across repos and teams.

## Skills included
- `adr-style` — ADR format and conventions
- `test-hygiene` — readable pytest structure
- `tdd-red-green` — strict Red→Green→Refactor loop

## How to use
Tell Claude:
> “Use the `<skill-name>` Skill.”

Or reference it while requesting output:
> “Generate ADR-0002 using adr-style.”
