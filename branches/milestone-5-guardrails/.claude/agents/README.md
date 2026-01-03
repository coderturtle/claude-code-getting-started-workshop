# .claude/agents/ — Subagents (separation of concerns)
_Last updated: 2026-01-03_

All subagents are **present in every milestone snapshot** (for consistency and self-paced resumes).
The workshop introduces (“activates”) them progressively.

## Why this helps agentic development
- Reduces drift by narrowing scope per agent
- Improves quality by forcing focused thinking
- Speeds delivery by parallelizing reasoning (contract vs tests vs security)
- Makes milestones predictable (no “why is this agent missing?”)

## Activation map (when you start using each agent)

| Agent | What it does | Introduced in |
|---|---|---|
| `repo-hygienist` | Prevent markdown sprawl; consolidate/move/delete docs | **Lab 00A** (Agentic hygiene) |
| `api-designer` | API contract, payloads, status codes, error cases (no code) | **Lab 02** (Slice planning) |
| `test-writer` | Tests-first checklist + pytest scaffolding | **Lab 02** (Slice planning) and used heavily in **Lab 03** |
| `tdd-coach` | Strict Red → Green → Refactor driver | **Lab 03A** (TDD method) |
| `security-reviewer` | Identify footguns; propose minimal mitigations + guardrail tests | **Lab 05** (Guardrails) |
| `code-reviewer` | Review diffs; suggest small improvements (no rewrites) | Used throughout; introduced in **Lab 03** (implementation discipline) |

## How to invoke
Start prompts with:
> “Act only as **<agent-name>** …”

## Rule of thumb
If the agent starts doing too much, narrow it:
- “No code.”
- “Max 10 bullets.”
- “Touch max 3 files.”
