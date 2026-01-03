# PLAN-SLICE.md (example)

## Slice: Slice 1 — Health + Create + List

### In scope
- `GET /health`
- `POST /adrs` (create ADR markdown file under `/adrs`)
- `GET /adrs` (list ADRs)

### Out of scope
- `GET /adrs/{id}` and delete (Slice 2)
- Pagination (stretch)
- Auth

## Files to create/change
- `src/app.py`
- `src/storage.py`
- `tests/test_health.py`
- `tests/test_adrs_create_list.py`
- `README.md` (basic curl examples)

## Tests-first checklist
- [ ] `GET /health` returns 200 and `status=ok`
- [ ] Create ADR returns 201 with id and filename
- [ ] Created file exists under `adrs/`
- [ ] List returns the created ADR
- [ ] Invalid title returns 400

## Commands
- `pytest -q`
