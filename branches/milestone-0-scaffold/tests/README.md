# tests/ — Testing approach (anti-brittle, agent-friendly)
_Last updated: 2026-01-02_

This workshop uses tests as the **truth source** for agentic development.

## Principles (why this matters with agents)
When an LLM generates code, it can look “correct” while being wrong. Tests give you:
- **Evidence**: proof a behavior exists (red → green)
- **Safety**: refactors don’t silently break things
- **Speed**: tight feedback loop prevents long debugging spirals

## Preferred test styles (in order)

### 1) Black-box API tests (default)
Use `fastapi.testclient.TestClient` and call endpoints like a user.
- ✅ Stable across refactors
- ✅ Validates actual behavior end-to-end (routing + validation + storage)
- ❌ Slightly slower than pure unit tests (fine for this workshop)

### 2) Small unit tests for pure helpers (selectively)
Good candidates:
- slugify / filename sanitization
- path safety checks
- id format validation

Keep them outcome-based and avoid coupling to implementation details.

## Minimal mocking (important)
Avoid mocking internal functions and modules. Over-mocking causes two common failures:
1) **False confidence** — tests pass but the real system is broken because the mock “agreed”.
2) **Brittleness** — tests break when code structure changes even if behavior stays correct.

### What to do instead
- Use `tmp_path` to isolate filesystem state.
- Monkeypatch the storage directory (e.g., `storage.ADRS_DIR = tmp_path.resolve()`).
- Only mock true externals (network calls, cloud SDKs) — not internal code.

## Short test descriptions (anti-brittle)
Add a 1-line comment above each test:
- what it verifies (behavior)
- why it exists (edge case/regression)

Example:
```python
# verifies traversal titles are rejected so we can't write outside ./adrs
```

This keeps intent clear for both humans and agents, and encourages assertions on **outcomes**, not internals.

## The TDD loop (required in this repo)
For each behavior:
1) **RED**: write a test that fails for the right reason
2) capture **evidence of RED** (failing assertion or exact failure)
3) **GREEN**: minimal code to pass
4) (optional) **REFACTOR** after green
5) rerun `pytest -q` after each step

## Commands
```bash
pytest -q
python -m compileall src tests
```
