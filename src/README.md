# src/ — Workshop app code
_Last updated: 2026-01-02_

The workshop builds a tiny FastAPI service (“ADR Pocket”). Participants implement it in slices.

## Why this helps agentic development
- A small app is enough to practice the full loop:
  spec → slice plan → tests-first → implementation → guardrails
- The filesystem storage forces you to handle real security concerns (path traversal)

## Notes
- Keep logic minimal; rely on tests to prove behavior.
- Prefer black-box API tests over mocking internals.
