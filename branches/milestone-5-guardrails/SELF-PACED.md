# SELF-PACED.md — Claude Code Workshop (self-guided lab)
_Last updated: 2026-01-02_

This is the **self-paced** version of the Claude Code workshop. It mirrors the facilitator-led session, but the repo becomes your instructor:
- each module has a **lab card** (`labs/`)
- each module has a **copy/paste prompt** (`prompts/`)
- each checkpoint has a **verification script** (`scripts/checkpoint.sh`)
- you can compare your work to **example outputs** (`expected/`) without spoiling the full solution

> ✅ Success goal (minimum): produce `SPEC.md`, `PLAN-SLICE.md`, implement **Slice 1** with tests, generate `ADR-0001`, and add at least one guardrail.

---

## Quick start

1) Open repo root in a terminal
2) Start Claude Code (your normal way)
3) If you’re using the spec plugin, start Claude with it:
   - `claude --plugin-dir ./spec-plugin`
4) Work through labs in order:
   - `labs/00-orientation.md`
   - `labs/00-agentic-hygiene.md`
   - `labs/01-spec-interview.md` → `labs/07-retro-and-apply.md`

---

## Checkpoints (the dopamine schedule)

After each lab, run:

```bash
bash scripts/checkpoint.sh <checkpoint>
```

Checkpoints:
- `spec` → verifies `SPEC.md`
- `plan` → verifies `PLAN-SLICE.md`
- `slice1` → runs tests (if present) + checks key files exist
- `skills` → verifies an ADR exists and looks like an ADR
- `guardrails` → checks you added at least one mitigation (documented)
- `final` → runs the whole suite

Examples:
```bash
bash scripts/checkpoint.sh spec
bash scripts/checkpoint.sh slice1
bash scripts/checkpoint.sh final
```

---

## If features don’t work (plugin/hooks/subagents)

Self-paced environments vary. If something doesn’t work in **2 minutes**, use the fallback:

- **Plugin doesn’t load:** paste the corresponding prompt from `prompts/`
- **Subagents not found:** start your prompt with “Act only as the <role>…”
- **Hooks don’t run:** run the scripts manually (tests/compile)

See: `TROUBLESHOOTING.md`

---

## Two paths: Full experience vs Minimal

### Path A — Full experience (recommended)
Use:
- `/spec:interview` and `/spec:slice`
- subagents + skills + guard scripts (and hooks if supported)

### Path B — Minimal (still valuable)
Skip plugins/hooks and do:
- Manual interview prompt (from `prompts/01_interview.txt`)
- Manual slice plan prompt (from `prompts/02_slice_plan.txt`)
- Use Plan Mode + small diffs + tests + review

---

## Stretch goals
If you finish early, pick a card from:
- `CHALLENGE-CARDS.md`

---

## What “done” looks like (minimum)
You have:
- `SPEC.md`
- `PLAN-SLICE.md`
- Slice 1 implemented + tests passing
- `adrs/ADR-0001-*.md` created using `adr-style`
- One guardrail implemented (and ideally a test for it)
- 2+ small commits (optional, but recommended)


---

## Using milestone branches/tags (recommended for self-paced)

If your workshop repo includes milestone tags/branches, they make self-paced learning easier:

- **Resume from a checkpoint:** `git checkout -b my-attempt milestone/2-slice-plan`
- **Compare your work:** `git diff milestone/2-slice-plan..milestone/3-slice1-implemented`
- **Jump to solution:** `git checkout -b my-solution milestone/solution`

If you don’t have tags yet, see: `branches/README.md`.
The `branches/` folder in this pack contains snapshot folders you can use to create those tags.


---

## Feedback (help improve the workshop)

If you get stuck, find a typo, or have an idea to make this smoother:
- open an Issue with your environment details
- or open a PR with improvements

See `CONTRIBUTING.md` for the preferred format.


---

## Agentic hygiene (recommended)
Claude can generate lots of markdown during iteration. Keep the repo tidy by using:
- `scratch/` for temporary notes
- the `hygiene-keeper` subagent after each lab/module

Start with: `labs/00-agentic-hygiene.md`
Prompt: `prompts/00_agentic_hygiene.txt`


## TDD (recommended)
Before implementing Slice 1, do `labs/03a-tdd-red-green.md` to adopt a Red→Green loop with the `tdd-coach` agent.


---

## Agentic development guardrails (recommended)
To keep agentic work efficient and avoid brittle tests:
- keep **small diffs** (max ~3 files per step)
- capture **evidence of RED** before coding (failing assertion or exact failure)
- prefer **minimal mocking** (TestClient + tmp_path) over mocking internal functions
- add **short test descriptions** (intent + why)

See `CLAUDE.md` for the canonical rules.
