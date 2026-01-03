# .claude/agents/ — Subagents (separation of concerns)
_Last updated: 2026-01-03_

All subagents are **present in every milestone snapshot** (for consistency and self-paced resumes).
The workshop introduces (“activates”) them progressively.

## Why this helps agentic development
- Reduces drift by narrowing scope per agent
- Improves quality by forcing focused thinking
- Speeds delivery by parallelizing reasoning (contract vs tests vs security)
- Makes milestones predictable (no “why is this agent missing?”)

## Agents included
- `api-designer` — API contract and error cases (no code)
- `test-writer` — tests-first checklists and pytest scaffolding
- `security-reviewer` — footguns, mitigations, guardrail tests
- `code-reviewer` — diff review and small improvements (no rewrites)
- `repo-hygienist` — controls markdown sprawl; consolidates docs
- `tdd-coach` — strict Red→Green loop

## How to invoke
Start prompts with:
> “Act only as **<agent-name>** …”

## Rule of thumb
If the agent starts doing too much, narrow it:
- “No code.”
- “Max 10 bullets.”
- “Touch max 3 files.”
