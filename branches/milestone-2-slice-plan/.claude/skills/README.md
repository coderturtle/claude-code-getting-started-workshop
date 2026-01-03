# .claude/skills/ — Skills (make standards automatic)
_Last updated: 2026-01-03_

All Skills are **present in every milestone snapshot** (for consistency and self-paced resumes).
The workshop introduces (“activates”) them progressively.

## Why this helps agentic development
- If you repeat a rule twice, it belongs in a Skill
- Skills reduce prompt boilerplate and keep quality consistent
- Skills scale across repos and teams

## Activation map (when you start using each Skill)

| Skill | What it enforces | Introduced in |
|---|---|---|
| `tdd-red-green` | Strict Red → Green → Refactor loop; evidence for RED | **Lab 03A** |
| `test-hygiene` | Readable, stable pytest; minimal mocking; tmp_path | **Lab 03A** (applies immediately in Lab 03) |
| `adr-style` | ADR frontmatter + standard sections + tone | **Lab 04** (Skills + ADR) |

## How to use
Tell Claude:
> “Use the `<skill-name>` Skill.”

Or reference it while requesting output:
> “Generate ADR-0002 using adr-style.”
