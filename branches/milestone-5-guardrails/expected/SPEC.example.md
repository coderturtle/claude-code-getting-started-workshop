# SPEC.md (example)

## Goal
Build a tiny FastAPI service “ADR Pocket” that stores Architecture Decision Records (ADRs) as Markdown files under `/adrs`.

## Non-goals
- No database
- No auth (for workshop)
- No UI

## User stories
- As a developer, I can create an ADR with a title and content
- As a developer, I can list ADRs
- As a developer, I can fetch an ADR by id
- As a developer, I can delete an ADR

## API
- `GET /health` → `{ "status": "ok" }`
- `POST /adrs` → creates a new ADR file, returns id + path
- `GET /adrs` → list summaries
- `GET /adrs/{id}` → returns full markdown
- `DELETE /adrs/{id}` → deletes the ADR

## Data model
- ADR stored as Markdown file: `adrs/ADR-0001-short-title.md`
- YAML frontmatter required: `id, title, status, date`

## Error cases
- Invalid title → 400
- Attempted path traversal → 400
- Missing ADR → 404
- Duplicate id → 409 (or generate unique id)

## Test plan
- Unit tests for filename sanitization
- API tests for create/list
- Tests for invalid input + traversal attempts

## Acceptance criteria
- Slice 1 endpoints work and tests pass
- ADR-0001 is created in correct format
- At least one guardrail exists (documented or tested)
