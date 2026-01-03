# Lab 03A — Test-driven development (Red → Green → Refactor)
_Last updated: 2026-01-02_

**Goal:** make the build loop *provable* by having Claude write tests first and drive behavior from **red → green**.

This lab is a short “method” lab. You’ll apply it immediately in `labs/03-slice-1.md`.

---

## Why this matters (especially with agents)
Claude can confidently produce code that *looks* right. TDD makes it **measurable**:
- the test fails (red)
- the minimal implementation makes it pass (green)
- only then do you clean up (refactor)

---

## Setup
Open:
- `.claude/agents/tdd-coach.md`
- `.claude/skills/tdd-red-green/SKILL.md`

---

## The TDD ritual (repeat for each behavior)
1) **RED:** Write a test that fails for the right reason
2) **GREEN:** Implement the minimum code to pass
3) **REFACTOR:** Optional tiny cleanup
4) **Commit:** small commit after a meaningful green step

---

## Copy/paste prompts
- Start-of-slice TDD guardrails: `prompts/03a_tdd_start.txt`
- Per-step Red→Green driver: `prompts/03b_tdd_step_driver.txt`

---

## Verification (you will do this repeatedly)
```bash
pytest -q
```

A good pattern is to run it twice:
- once after RED (expect failure)
- once after GREEN (expect pass)

---

## Next
Proceed to `labs/03-slice-1.md` and build Slice 1 using the TDD loop.


---

### Hygiene sweep (if Claude created extra docs)
Run: `prompts/00_hygiene_sweep.txt` and keep the repo tidy.


---

## Evidence, mocks, and brittleness (important in agentic dev)

### Evidence (prove RED)
When you write a test, **capture the failure** before moving to GREEN:
- paste the failing assertion line, or
- write a 1-sentence description of the exact failure (status code/assertion).

**Why:** prevents “tests that never failed” and keeps the loop honest.

### Minimal mocking (avoid brittle tests)
Prefer black-box tests:
- endpoint tests with `FastAPI TestClient`
- filesystem isolation with `tmp_path` + monkeypatch storage directory

Avoid mocking internal functions unless absolutely necessary.

**Why:** heavy mocks make tests pass while real behavior is broken, and they couple tests to implementation details.

### Short descriptions in tests (anti-brittleness)
Add a 1-line comment above each test stating:
- behavior verified
- why it exists (edge case/regression)

**Why:** helps agents (and humans) keep assertions outcome-based, so refactors don't break tests unnecessarily.
