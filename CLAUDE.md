# ADR Pocket – Project rules


## Agentic hygiene (markdown sprawl control)
Claude Code can generate lots of markdown while it works. Keep the repo clean:

- **Temporary notes go in `scratch/` only** (prefer `scratch/working.md`).
- Do **not** create random top-level `*.md` files while iterating.
- Before completing a lab/module:
  1) Consolidate useful content into canonical artifacts (`SPEC.md`, `PLAN-SLICE.md`, ADRs, README)
  2) Delete scratch/draft files you no longer need
  3) Run the `hygiene-keeper` subagent and produce a short hygiene report

Canonical artifacts we keep:
- `SPEC.md`, `PLAN-SLICE*.md`, `adrs/ADR-*.md`
- Workshop docs (`WORKSHOP.md`, `SELF-PACED.md`, labs/prompts/scripts/expected)

If in doubt: **consolidate** rather than create a new doc.


---

## Agentic efficiency rules (small diffs, evidence, and test stability)
These rules exist because agentic coding can drift quickly. They keep the work **predictable, reviewable, and testable**.

### 1) Small diffs (diff budget)
**Rule:** work in steps that touch **max 3 files** and aim for **≤ ~80 changed lines** per step.
- If you need more, split into multiple steps and keep each step green.

**Why it matters for agentic development**
- Small diffs make it easier to *see* what the agent changed and to rollback safely.
- Reduces “helpful” rewrites that break unrelated things.
- Faster reviews, faster iteration, fewer accidental regressions.

### 2) Evidence before implementation (prove the RED)
**Rule:** Before writing production code, show evidence that the test is red:
- paste the failing assertion line OR
- describe the exact failure (status code / exception / assertion) in one sentence.

**Why it matters**
- Prevents “tests that never failed” (false confidence).
- Keeps the agent honest: the test must demonstrate the missing behavior.
- Speeds up debugging because you capture the failure reason at the moment it happens.

### 3) Minimal mocking (avoid brittle tests)
**Rule:** Prefer **black-box tests** over mocks:
- For API work: use `FastAPI TestClient` (call endpoints like a user would).
- For filesystem: use `tmp_path` and monkeypatch the storage directory.
- Only mock external networks/services (not internal functions).

**Why it matters (and why it helps agentic dev)**
- Agents often over-mock, producing tests that pass while the real behavior is broken.
- Heavy mocking makes tests tightly coupled to implementation details (brittle).
- Black-box tests validate outcomes, so the agent can refactor without breaking tests.
- `tmp_path` isolates state, preventing flaky tests and “works on my machine” errors.

### 4) Short test descriptions (anti-brittleness)
**Rule:** Each test should include a 1-line description comment:
- what behavior it verifies
- why it exists (edge case / regression)

Example:
```python
# verifies traversal titles are rejected so we can't write outside ./adrs
```

**Why it matters**
- Agents can generate many tests quickly; short descriptions keep intent clear.
- Prevents brittle tests because intent guides future refactors (assert outcomes, not internals).
- Improves maintenance: humans can see why a test exists without reading the whole file.
