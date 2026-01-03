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

## Small diffs (diff budget)
- Work in steps that touch max **3 files** and aim for **≤ ~80 changed lines** per step.
- If you need more, split into multiple green steps.

## Slice discipline
- Do not implement code until `SPEC.md` exists.
- Do not implement a slice until `PLAN-SLICE.md` exists.
- Keep scope small; one slice at a time.

## TDD and evidence (Red → Green)
- Write a failing test first (RED) and capture evidence (failing assertion or exact failure).
- Implement minimal code to pass (GREEN).
- Refactor only after green (and keep it tiny).

## Minimal mocking + short test descriptions (anti-brittle)
- Prefer black-box API tests (TestClient) and filesystem isolation (`tmp_path`).
- Avoid mocking internal functions; mock only true externals.
- Add a 1-line description comment above each test (behavior + why).
