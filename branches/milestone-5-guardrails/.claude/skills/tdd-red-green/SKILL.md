---
name: tdd-red-green
description: Enforces a strict Red → Green → Refactor loop. Use whenever implementing endpoints or storage logic.
---

When implementing any behavior:
1) **RED:** add a test that fails for the right reason (assertion meaningful).
2) **GREEN:** implement the smallest change to make it pass.
3) **REFACTOR:** only after green, and keep changes tiny.
4) Re-run tests after each step.

Rules:
- No feature code without a test (except trivial wiring like app startup).
- Prefer small diffs; touch max 3 files per step.
- Always show the command to run (`pytest -q`) and state expected result.
