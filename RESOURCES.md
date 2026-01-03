# Claude Code Workshop — Suggested Readings, Real‑World Use Cases, and Tips
_Last updated: 2026-01-02_

This reading pack supports the **ADR Pocket + Spec Interview plugin** workshop. It’s curated to be practical: **what to read/watch**, **what people built**, and **what consistently works** when using Claude Code in real codebases.

---

## 1) Start here (official, highest signal)

1. **Claude Code: Best practices for agentic coding (Anthropic Engineering)**  
   https://www.anthropic.com/engineering/claude-code-best-practices  
   *Why:* Real patterns from Anthropic engineers—prompt shape, task slicing, test loops, and workflow hygiene.

2. **Claude Code docs: Slash commands**  
   https://code.claude.com/docs/en/slash-commands  
   *Why:* This is the foundation of your workshop “rituals” like `/spec:interview`.

3. **Claude Code docs: Skills**  
   https://code.claude.com/docs/en/skills  
   *Why:* How to make standards (ADR format, test hygiene, review style) *auto-apply*.

4. **Claude Code announcement: Plugins**  
   https://www.anthropic.com/news/claude-code-plugins  
   *Why:* Packaging commands + agents + skills + hooks together. This matches your “Spec Interview plugin” approach.

5. **Claude Code: Working more autonomously (checkpoints, subagents, hooks, background tasks)**  
   https://www.anthropic.com/news/enabling-claude-code-to-work-more-autonomously  
   *Why:* Great for the “why guardrails exist” and “how to let it run safely” segments.

---

## 2) Feature deep dives (for the workshop modules)

- **Claude Code release notes / changelog**  
  https://docs.anthropic.com/en/release-notes/claude-code  
  *Use it to:* validate “what’s new” and call out features introduced recently.

- **Securely deploying AI agents (Claude Docs)**  
  https://console.anthropic.com/docs/en/agent-sdk/secure-deployment  
  *Use it to:* frame safety controls (isolation, credentials, network constraints) for enterprise settings.

- **How to think about “Skills vs Commands vs Subagents vs Plugins” (community mental models)**  
  https://alexop.dev/posts/understanding-claude-code-full-stack/  
  https://www.youngleaders.tech/p/claude-skills-commands-subagents-plugins  
  *Use it to:* help participants decide where each behavior should live.

- **Curated workflows + examples repo (“Awesome Claude Code”)**  
  https://github.com/hesreallyhim/awesome-claude-code  
  *Use it to:* steal patterns for your team: review bots, doc workflows, design checks, etc.

---

## 3) Real‑world use cases (things people actually built / shipped)

### A) Claude Code built Claude Code
- **How Claude Code is built (Pragmatic Engineer / Gergely Orosz)**  
  https://newsletter.pragmaticengineer.com/p/how-claude-code-is-built  
  *Highlights:* internal “dogfooding”, high % of code authored by Claude, stack choices optimized for model strengths.

### B) Team case studies (internal + cross-functional)
- **“Teams use Claude Code” (Anthropic PDF case studies)**  
  https://www-cdn.anthropic.com/58284b19e702b49db9302d5b6f135ad8871e7658.pdf  
  *Examples mentioned:* infra debugging, onboarding, automating “plain text workflows” for non‑engineers, and the Claude Code team using it to build features.  
  *Workshop tie-in:* reinforces why **good `CLAUDE.md` documentation** and **repeatable workflows** matter.

### C) Tech-debt reduction / engineering productivity
- **Faros AI: Case study using Claude Code to tackle tech debt**  
  https://www.faros.ai/blog/claude-code-for-tech-debt  
  *Highlights:* “boring but valuable” work (test utilities cleanup, Docker size reductions, etc.) where agents shine.

### D) Building a complete MVP quickly (individual case study)
- **dev.to: “I built my complete side project in a day using Claude Code and MCP”**  
  https://dev.to/composiodev/i-built-my-complete-side-project-in-a-day-using-claude-code-and-mcp-now-you-know-why-they-dont-22gk  
  *Highlights:* full-stack build loop, tool connections, and cost/time observations.

### E) “From the trenches” practical workflows
- **“How I Use Every Claude Code Feature”**  
  https://blog.sshh.io/p/how-i-use-every-claude-code-feature  
  *Highlights:* day-to-day patterns and when to reach for features vs keeping it simple.

- **“I used Claude Code for 30 days: practical discoveries”**  
  https://medium.com/%40aleksandardobrohotov/i-used-claude-code-for-30-days-7-practical-discoveries-still-learning-cc93fa4aec3a  
  *Highlights:* what breaks in real usage, and how hooks and terminal workflows change habits.

> Note: community posts vary in quality—treat them as “field notes,” then reconcile with official docs.

---

## 4) Lessons learned (what reliably works)

These are recurring patterns across Anthropic guidance + credible field reports.

### 4.1 The “Spec → Plan → Slice → Review” loop wins
- Start with **a spec** (even a lightweight one).
- Use **Plan Mode** before edits for non-trivial work.
- Implement in **small slices** with a clear acceptance check.
- Review diffs via a **reviewer subagent** (and/or a human review).

### 4.2 Make Claude verify itself
- Ask Claude to **run tests/lints** and iterate until green.
- Prefer “create tests first” for anything non-trivial.
- Build “self-sufficient loops” where Claude writes → runs → fixes → repeats.

### 4.3 Classify tasks by risk (async vs sync)
- “Edge” work (prototypes, UI polish, peripheral tooling) can run more autonomously.
- “Core logic” (business rules, security boundaries) should be supervised closely.

### 4.4 `CLAUDE.md` is your cheapest quality multiplier
- Put “house rules” there: file conventions, boundaries, architecture intent, testing commands.
- Keep it short, concrete, and updated after each workshop iteration.

### 4.5 Subagents reduce chaos
Use subagents for:
- API contract decisions (`api-designer`)
- test-first planning (`test-writer`)
- security sanity checks (`security-reviewer`)
- diff review (`code-reviewer`)

This prevents one agent trying to do everything at once.

### 4.6 Skills are for repeatable standards
If you wrote the same instruction twice, convert it into a Skill:
- ADR format
- test patterns
- commit message style
- README endpoint docs format
- review checklist

### 4.7 Hooks/guards turn good habits into defaults
Automate what you always do anyway:
- run `pytest -q`
- run `compileall` / lint
- block edits to `.env`, keys, or protected dirs
- ensure writes stay inside allowed directories (e.g., `/adrs`)

### 4.8 Keep escape hatches: git + checkpoints
- Start from a clean git state.
- Commit often.
- Use checkpoints/rewind when Claude drifts.

---

## 5) Workshop‑friendly “tips & tricks” (copy/paste into your facilitator notes)

### Prompt patterns
- **Timebox & scope:** “Do *only* Slice 1. Touch max 2–3 files. No refactors.”
- **Specify outputs:** “Write `PLAN-SLICE.md` and wait. No code yet.”
- **Make it test-first:** “Write tests before implementing endpoints.”
- **Force explicit risk handling:** “List security footguns and mitigations before coding.”

### Tactics that help immediately
- Keep diffs small; merge frequently.
- Ask for a file list before edits.
- When it’s confused: ask it to restate the spec and acceptance criteria.
- When it’s drifting: “Stop. Summarize where you are and what remains.”

---

## 6) Optional “watch list” (quick hits)

- **Claude Code on Slack integration coverage (beta / preview)**  
  https://www.theverge.com/news/839817/anthropic-claude-code-slack-integration  
  *Why:* nice “where this is going” section for teams.

---

## 7) Suggested pre‑work for participants (15–25 minutes)

1) Read: Anthropic **Best practices** post (skim and highlight 3 tips you want to try).  
2) Skim: docs for **Slash commands** + **Skills** (enough to know what they are).  
3) In your repo: open `CLAUDE.md` and confirm the “house rules” match your workshop goals.

---

## 8) Suggested post‑work (30–60 minutes)

- Add one new Skill to a real team repo (e.g., PR review checklist).
- Add one hook/guard that prevents a real footgun.
- Run a “mini retro” and update `CLAUDE.md` with what you learned.

