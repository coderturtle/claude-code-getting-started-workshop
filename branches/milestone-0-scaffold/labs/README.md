# labs/ — Workshop modules (the learning path)
_Last updated: 2026-01-02_

This folder is the **workshop curriculum**. Each file is a “lab card” you can run in a facilitated session or self-paced.

## Why this structure works for agentic development
Agentic tools are powerful, but they can drift. Labs are ordered to build the habits that prevent drift:

1) **Orientation**: learn the repo controls and constraints.
2) **Agentic hygiene**: stop markdown sprawl and keep context manageable.
3) **Spec interview**: get clarity before code.
4) **Slice planning**: constrain scope so the agent doesn’t build the universe.
5) **TDD (Red→Green)**: turn “looks right” into provable behavior.
6) **Skills**: encode repeated standards so quality is automatic.
7) **Guardrails**: prevent obvious footguns (like path traversal).
8) **Retro**: convert workshop learning into reusable habits.

## How to use labs
- Follow the order; each lab builds on the previous one.
- If Claude creates extra docs, run the hygiene sweep prompt.
- Run checkpoints (`scripts/checkpoint.sh`) to keep momentum.

## Tips
- Keep diffs small (max ~3 files per step).
- Prefer tests-first.
- Use subagents for separation of concerns.
