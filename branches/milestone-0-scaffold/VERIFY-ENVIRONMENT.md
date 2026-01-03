# VERIFY-ENVIRONMENT.md — Verification run on target environment (Claude Code workshop)
_Last updated: 2026-01-02_

Use this guide to perform a **full verification run** on the machine/environment you’ll use for the workshop (or the “golden” reference environment you expect participants to match).  
Goal: confirm the workshop can be completed end-to-end, and capture any environment-specific gotchas **before** participants hit them.

---

## 0) What you’re verifying

### Must work (minimum)
- Repo opens and is writable
- Python environment works (deps install; tests run)
- Claude Code runs in repo root
- Self-paced flow works:
  - `labs/` navigation
  - `prompts/` copy/paste prompts
  - `scripts/checkpoint.sh` runs and reports expected results

### Should work (recommended)
- Plugin commands work (if you’re using the plugin path):
  - `/spec:interview` → creates `SPEC.md`
  - `/spec:slice` → creates `PLAN-SLICE.md`

### Nice to have (optional)
- Hooks/guards automation works in your Claude Code setup (if you plan to demo them)
- Git milestone tags/branches exist in the workshop repo (if you’re using resume/diff checkpoints)

---

## 1) Pre-flight checklist (5 minutes)

### System
- [ ] OS version noted (macOS / Linux / Windows WSL)
- [ ] Shell noted (bash/zsh)
- [ ] Git installed: `git --version`
- [ ] Python installed: `python --version` (target 3.12)
- [ ] Network access to install deps (pip) OR offline wheel cache prepared

### Repo
- [ ] Repo is on local disk (not a read-only mount)
- [ ] You can create files in repo root: `touch .verify-write && rm .verify-write`
- [ ] You’re on the correct branch/tag (e.g. `workshop/start`)

### Claude Code
- [ ] Claude Code runs in repo root (your normal start command)
- [ ] (Optional) You know how to launch with plugins: `claude --plugin-dir ./spec-plugin`

---

## 2) Create a clean verification workspace (recommended)

This prevents “it works on my machine because I already had files”.

```bash
# from repo root
git status --porcelain
# should be clean; if not, stash/commit/reset

# create a verification branch
git checkout -b verify/2026-01-02
```

If you want the purest run:
- start from `workshop/start` (or equivalent)
- avoid reusing old `SPEC.md`, `PLAN-SLICE.md`, `adrs/*`, `.venv/`

---

## 3) Verify Python setup + test runner (10–15 minutes)

### Setup venv
```bash
python -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -e ".[dev]"
```

### Smoke test
```bash
python -m compileall src tests
pytest -q
```

**Pass criteria**
- compileall returns success
- pytest completes with exit code 0 (or, if you’re on a scaffold-only milestone, you at least confirm the command runs and failures are expected)

**Common issues**
- `pip install -e ".[dev]"` fails due to network restrictions
  - Workaround: pre-download wheels, or provide a locked `requirements.txt` and internal PyPI mirror
- Python version mismatch (3.9/3.10) causing dependency conflicts
  - Workaround: pin versions, or distribute a known-good `.python-version` / `uv` workflow

---

## 4) Verify self-paced “autograder-lite” checkpoints (5 minutes)

Run:

```bash
bash scripts/checkpoint.sh spec
bash scripts/checkpoint.sh plan
bash scripts/checkpoint.sh slice1
bash scripts/checkpoint.sh skills
bash scripts/checkpoint.sh guardrails
bash scripts/checkpoint.sh final
```

**Pass criteria**
- For early milestones: it’s OK to see warnings (e.g., missing SPEC.md) if you haven’t generated them yet.
- For a full end-to-end verification run, aim to complete labs so the `final` checkpoint is clean (or minimal warnings).

If `checkpoint.sh` fails unexpectedly:
- ensure it’s executable: `chmod +x scripts/checkpoint.sh`
- ensure you’re running from repo root
- ensure `bash` is available (Windows users should run under WSL/Git Bash)

---

## 5) Verify Claude Code workflow (core) (20–40 minutes)

This section verifies the actual learning experience.

### Lab 01 — Spec interview
**Option A (plugin path)**
1) Start Claude Code in repo root with plugin directory:
   ```bash
   claude --plugin-dir ./spec-plugin
   ```
2) Run `/spec:interview` and answer questions.
3) Confirm `SPEC.md` is created.

**Option B (fallback prompt)**
Paste `prompts/01_interview.txt` into Claude Code and confirm `SPEC.md` is created.

**Pass criteria**
- `SPEC.md` exists and has at least: Goal, API, Acceptance criteria.
- `bash scripts/checkpoint.sh spec` passes.

### Lab 02 — Slice plan
- Run `/spec:slice` (or paste `prompts/02_slice_plan.txt`)
- Confirm `PLAN-SLICE.md` is created.
- Run: `bash scripts/checkpoint.sh plan`

### Lab 03 — Implement Slice 1 (test-first)
- Use `prompts/03_implement_slice1.txt`
- Ensure tests exist and run:
  - `pytest -q`
- Run: `bash scripts/checkpoint.sh slice1`

### Lab 04 — Skills
- Create ADR-0001 using `prompts/04_create_adr.txt`
- Confirm file exists under `adrs/ADR-0001-*.md`
- Run: `bash scripts/checkpoint.sh skills`

### Lab 05 — Guardrails
- Run `prompts/05_security_review.txt`
- Implement one guardrail + test (`prompts/06_add_guardrail_and_test.txt`)
- Run: `bash scripts/checkpoint.sh guardrails`

### Optional: Lab 06 — Slice 2
- Use `prompts/07_implement_slice2.txt`
- Run: `bash scripts/checkpoint.sh final`

**Pass criteria (end-to-end)**
- `SPEC.md` + `PLAN-SLICE.md` exist
- tests pass: `pytest -q`
- ADR-0001 exists
- at least one guardrail implemented (and ideally a test)
- `bash scripts/checkpoint.sh final` completes with no major failures

---

## 6) Verify subagents and Skills (10 minutes)

Even if you don’t rely on auto-invocation, confirm the files exist and are usable.

### Subagents
Open `.claude/agents/` and confirm:
- `api-designer.md`
- `test-writer.md`
- `security-reviewer.md`
- `code-reviewer.md`

Quick prompt to validate:
> “Act only as **test-writer**: propose 5 tests for Slice 1. Do not write production code.”

**Pass criteria**
- Claude stays in role, outputs tests/checklist.

### Skills
Open `.claude/skills/adr-style/SKILL.md`.

Quick prompt:
> “Use the **adr-style** Skill to generate ADR-0002: ‘Add guardrails for file writes’.”

**Pass criteria**
- Output follows frontmatter + sections convention.

---

## 7) Verify hooks/guards (optional) (10–20 minutes)

Hook wiring can vary across Claude Code versions and setups. Decide what you will demo.

### Minimum viable “hook”
If you can’t wire Claude hooks reliably:
- treat hooks as a workshop “concept”
- run the automation manually:
  - `pytest -q`
  - `python -m compileall src tests`

### If you *do* wire hooks
- Confirm:
  - a hook triggers in the expected moment (after edit, before commit, etc.)
  - it doesn’t spam or slow the workshop
  - it fails with a **friendly, actionable message**

**Pass criteria**
- A failing test is detected early and the failure message is understandable.

---

## 8) Verify “resume/diff checkpoints” via tags (optional) (10–15 minutes)

If you are using git tags as milestones:

- Confirm tags exist:
  ```bash
  git tag | grep "^milestone/" || true
  ```

- Confirm you can check out a milestone cleanly:
  ```bash
  git checkout -b tmp-check milestone/2-slice-plan
  ```

- Confirm diffs are meaningful:
  ```bash
  git diff milestone/2-slice-plan..milestone/3-slice1-implemented
  ```

If tags are missing:
- (Maintainers) use `branches/README.md` and `branches/QUICK-COMMANDS.md` to create them.

---

## 9) Recommended “verification record” to capture (copy/paste)

Create `VERIFY-RESULTS.md` (or paste into your ticket) containing:

- Date:
- OS + version:
- Shell:
- Git version:
- Python version:
- Claude Code version:
- Plugin path verified? (Y/N)
- Hooks verified? (Y/N / not used)
- Checkpoints passed: spec/plan/slice1/skills/guardrails/final
- Notes on anything that differed from docs:
- Any “fixes” you made (with commands):
- Any participant-facing troubleshooting tips discovered:

---

## 10) Troubleshooting (quick hits)

### Plugin commands not found
**Symptoms:** `/spec:interview` unknown  
**Fix:** start Claude with plugin dir:
```bash
claude --plugin-dir ./spec-plugin
```
**Fallback:** use prompts from `prompts/`

### Tests fail because dependencies missing
- Ensure venv activated
- Reinstall:
  ```bash
  pip install -e ".[dev]"
  ```

### Checkpoint script fails on Windows
- Use WSL or Git Bash
- Ensure `bash` is available
- As a fallback, run the component commands manually (`pytest`, `compileall`)

### Claude starts refactoring wildly
- Enforce Plan Mode:
  - “Propose plan + file list only. Wait for approval.”
- Enforce small diffs:
  - “Touch max 3 files. No refactors.”

### ADR filename / traversal issues
- Ensure your guardrail checks:
  - slugify + allowlist characters
  - resolved path under `./adrs`

---

## 11) What “good to go” means

You are workshop-ready if:
- You completed Labs 01–05 successfully on the target machine
- `pytest -q` passes
- `bash scripts/checkpoint.sh final` runs clean (or only expected warnings)
- You validated either plugin commands OR the fallback prompts path (ideally both)
- You captured a short `VERIFY-RESULTS.md` record for future you
