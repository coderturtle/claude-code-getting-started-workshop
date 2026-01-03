# spec-plugin/ — Local plugin (optional)
_Last updated: 2026-01-02_

This folder provides local commands:
- `/spec:interview` → generate `SPEC.md`
- `/spec:slice` → generate `PLAN-SLICE.md`

## Why this helps agentic development
- Codifies “spec before code” and “slice before implementation”
- Reduces prompt drift across sessions and participants

## Fallback
If your environment can’t load plugins, use the prompts in `prompts/` instead.
