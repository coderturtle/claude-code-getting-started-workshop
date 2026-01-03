---
id: ADR-0001
title: Store ADRs as Markdown files on disk
status: Accepted
date: 2026-01-02
---

# Context
We need a lightweight way to record architectural decisions without adding a database or heavy tooling.

# Decision
Store ADRs as Markdown files in the repository under `/adrs`, using a consistent naming convention and YAML frontmatter.

# Consequences
- Pros: simple, portable, git-friendly, easy to review
- Cons: concurrency and validation require care

# Alternatives
- Database-backed store
- Wiki/Confluence-only
- GitHub Issues as ADRs
