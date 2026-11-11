---
description: Turn the active spec into a technical implementation plan (the HOW).
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Grep, Glob, Bash(ls:*), Bash(cp:*), Edit, Write, Agent
---

Produce an implementation plan for spec `$ARGUMENTS` (default: highest-numbered folder in
`specs/`). This is the HOW, derived from the spec + constitution.

**Work in an explore-then-plan mindset (the cheap, high-value phase): investigate thoroughly,
write the plan, then stop for my approval. Do NOT implement.**

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write —
to me and into the spec files.

Steps:
1. Read `specs/NNN-slug/spec.md` and `./docs/constitution.md`.
2. Explore the codebase for what already exists and should be reused — modules, utilities,
   patterns, types. Use Grep/Glob and, for broader sweeps, the Explore subagent. Reusing beats
   writing; name reusable code with `path:line` in the plan.
3. Copy `~/.claude/spec-templates/plan.md` → `specs/NNN-slug/plan.md` and fill it:
   - an "In short" block that alone tells me what will be built and how,
   - chosen approach (state the one you picked + why it fits the constitution),
   - a concrete **files to create/change** table,
   - data model / API contracts,
   - key decisions & tradeoffs, risks,
   - a **verification mapping**: each spec acceptance criterion → the test/command that proves
     it. Write the ID and what it says. If only a person can check a criterion, write the steps
     that person will follow.
4. Stop. Summarize the approach and the riskiest decision, and ask me to approve before
   `/spec:tasks`. In the "Your turn" block, name the decisions that most need my eyes.

Honor the constitution's conventions and non-functional requirements. No code in this step.
