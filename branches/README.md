# branches/ — Maintainer milestone snapshots (temporary)
_Last updated: 2026-01-03_

This folder is **maintainer-only**. It contains snapshot directories used to create git tags/branches for “resume from checkpoint” workflows.

It will not be part of the final learner repo.

## Snapshot policy (important)
- **All subagents and Skills are included in every snapshot** under `.claude/` for consistency.
- The learning arc is delivered via **docs and prompts** (“activation”), not by files appearing later.
- Snapshots primarily vary:
  - `CLAUDE.md` (progressively enriched guidance)
  - milestone artifacts (`SPEC.md`, `PLAN-SLICE.md`)
  - code/tests/ADRs relevant to that milestone

## Creating tags/branches
Use:
- `QUICK-COMMANDS.md` (one-shot loop)
- `TAGGING.md` (tag list + rationale)

If you publish this repo publicly, remove the entire `branches/` folder.
