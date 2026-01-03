# ADR Pocket – Project rules

## Goal
A tiny FastAPI service that stores Architecture Decision Records (ADRs) as markdown files under `/adrs`.

## Engineering rules
- Python 3.12 + FastAPI
- pytest for tests
- Keep endpoints minimal and documented
- Prefer small commits with clear messages
- Never modify files under `adrs/` manually; only via app logic
