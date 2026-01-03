# Claude Code Workshop — ADR Pocket
![Claude Turtle](header.png)

This repo is a hands-on workshop to learn **Claude Code** by building a small service (**ADR Pocket**) and deliberately using:
- **Plan Mode / permission discipline**
- **Slash commands / plugins** (spec interview + slice planner)
- **Subagents** (API, tests, security, review)
- **Skills** (repeatable standards)
- **Guardrails / hooks** (automation + safety)

It supports **facilitator-led sessions** *and* a fully **self-paced** path.

---

## How to use this repo

### If you’re attending a facilitated workshop
Start here: **`WORKSHOP.md`**  
Then follow the exercises (and use the prompts library inside).

### If you’re doing it self-paced
Start here: **`SELF-PACED.md`**  
Then work through labs in order: `labs/00…07`, using prompts in `prompts/`.

---

## Repo map (what’s where)
## Agents and Skills (progressive activation)
All agents/skills exist from day one; the labs introduce when to use them. See `.claude/agents/README.md` and `.claude/skills/README.md`.


### Primary docs
- `WORKSHOP.md` — facilitator-led agenda + exercises
- `SELF-PACED.md` — self-guided runbook (checkpoints + fallbacks)
- `SELF-PACED-CHECKLIST.md` — one-page checklist
- `PROGRESS.md` — completion tracker / journal
- `SLIDES.md` — slide script (speaker notes)
- `CHALLENGE-CARDS.md` — optional extensions
- `TROUBLESHOOTING.md` — common issues + “rescue prompts”
- `FACILITATOR-NOTES.md` — facilitation playbook

### Learning flow
- `labs/` — step-by-step lab cards (`00` → `07`) (includes **Agentic Hygiene**: `labs/00-agentic-hygiene.md`), including **Agentic hygiene** early on
- `prompts/` — copy/paste prompts for each lab module (including hygiene prompt)
- `scripts/checkpoint.sh` — quick verification checks (“autograder-lite”)
- `expected/` — example outputs (SPEC/PLAN/ADR), not full solutions

### Workshop app (what you build)
- `src/` — FastAPI app + storage module
- `tests/` — pytest tests
- `adrs/` — ADR markdown files (generated during workshop)

### Plugin (optional)
- `spec-plugin/` — local plugin providing `/spec:interview` and `/spec:slice`

> Note: You may see a `branches/` folder in the workshop pack zip. That’s maintainer-only scaffolding for generating git tags/branches and won’t be included in the final learner repo.

---

## Quickstart (local dev)

### 1) Create a venv and install deps
```bash
python -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -e ".[dev]"
```

### 2) Run the app
```bash
uvicorn src.app:app --reload
```

### 3) Run tests
```bash
pytest -q
```

### 4) Run checkpoints (self-paced)
```bash
bash scripts/checkpoint.sh spec
bash scripts/checkpoint.sh plan
bash scripts/checkpoint.sh slice1
bash scripts/checkpoint.sh final
```

---

## Agentic hygiene (markdown sprawl control)
Start each session by pasting `prompts/00_agentic_hygiene.txt` and run periodic sweeps with `prompts/00_hygiene_sweep.txt` (powered by the `repo-hygienist` subagent).


## Agentic development guardrails (speed + quality)
These practices make agentic development **faster and safer**:
- **Small diffs**: easier review/rollback; prevents runaway refactors.
- **Evidence for RED**: proves tests fail for the right reason before coding.
- **Minimal mocking**: black-box tests (TestClient + tmp_path) reduce brittle tests and false confidence.
- **Short test descriptions**: keeps intent clear so refactors don’t break tests unnecessarily.

The canonical rules live in `CLAUDE.md`.


## Using Claude Code (recommended patterns)

### Control markdown sprawl (agentic hygiene)
- Temporary notes belong in `scratch/`
- Run the `hygiene-keeper` subagent after each lab/module
- Prompt: `prompts/00_agentic_hygiene.txt`


- Start with **spec** (plugin: `/spec:interview`, fallback: `prompts/01_interview.txt`)
- Use **TDD** for implementation: `labs/03a-tdd-red-green.md` (agent: `tdd-coach`, skill: `tdd-red-green`)
- Generate a **slice plan** (plugin: `/spec:slice`, fallback: `prompts/02_slice_plan.txt`)
- Implement in **small diffs** (tests-first) and review via `code-reviewer`
- Add/adjust **Skills** when you repeat yourself
- Add **guardrails** for obvious footguns (especially file-path safety)

---

## Feedback & improvements (PRs welcome)

If you spot anything that could be clearer, faster, safer, or more fun — please contribute.

### How to give feedback
- Open a **GitHub Issue** with:
  - what you tried
  - what happened
  - what you expected
  - environment info (OS, Claude Code version, Python version)
- Or open a **Pull Request**:
  - improve docs (wording, structure, missing steps)
  - add better prompts
  - improve checkpoint script
  - add extra challenge cards
  - fix bugs in the sample app/tests

### Quick PR workflow
1) Fork the repo
2) Create a branch: `feat/<short-name>` or `docs/<short-name>`
3) Keep changes small and focused
4) Open a PR with a short description and screenshots/logs if relevant

See: `CONTRIBUTING.md`

---

## License
Add your preferred license for internal/external sharing (MIT is common for workshop repos).
