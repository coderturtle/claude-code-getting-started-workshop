# prompts/ — Copy/paste prompts (drift control)
_Last updated: 2026-01-02_

Prompts here are the **fallback** and the **guardrails** for self-paced learners and for environments where plugins/hooks differ.

## Why prompts matter in agentic development
- They make the workflow **repeatable**
- They reduce “prompt drift” across participants and sessions
- They encode non-negotiables (small diffs, TDD, hygiene sweeps)

## How to use
- Start a session with `00_agentic_hygiene.txt`
- Use module prompts as you progress (01, 02, 03…)
- Use the TDD driver (`03b_tdd_step_driver.txt`) when implementing behavior
- Run hygiene sweeps (`00_hygiene_sweep.txt`) after a burst of generation

## Convention
- `00_*` = session setup / hygiene
- `01_*` = spec
- `02_*` = planning
- `03*` = implementation + TDD
- `04+` = skills, guardrails, optional slices
