---
name: test-hygiene
description: Keeps pytest readable and stable for agentic development. Use whenever adding or modifying tests.
---

## Structure
- `tests/test_*.py`
- Arrange / Act / Assert comments for clarity
- One behavior per test (avoid mega-tests)

## Stability
- Prefer black-box API tests (TestClient) for endpoints
- Use `tmp_path` for filesystem state
- Avoid mocking internal functions (mock only true externals)

## Naming
Test names should describe behavior, e.g. `test_traversal_like_title_rejected`.
