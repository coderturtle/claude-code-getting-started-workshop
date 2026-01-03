# ADR Pocket – Project rules

## Goal
A tiny FastAPI service that stores Architecture Decision Records (ADRs) as markdown files under `/adrs`.

## Engineering rules
- Python 3.12 + FastAPI
- pytest for tests
- Keep endpoints minimal and documented
- Prefer small commits with clear messages
- Never modify files under `adrs/` manually; only via app logic

## Agentic hygiene (markdown sprawl control)
- Prefer updating existing docs over creating new markdown files.
- Use `scratch/` for temporary notes and drafts; mark them TEMPORARY.
- Keep authoritative docs limited to: `SPEC.md`, `PLAN-SLICE.md`, `labs/`, `prompts/`, `adrs/`, and core workshop docs.
- When in doubt, ask the `repo-hygienist` agent to consolidate or delete.
