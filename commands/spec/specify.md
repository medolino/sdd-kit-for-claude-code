---
description: Create a new feature spec (the WHAT and WHY) with testable acceptance criteria.
argument-hint: "<feature idea in a sentence>"
allowed-tools: Bash(ls:*), Bash(mkdir:*), Bash(cp:*), Read, Edit, Write, Agent, AskUserQuestion
---

Write a specification for: **$ARGUMENTS**

This is the WHAT and WHY only — no implementation detail (that's `/spec:plan`).

Steps:
1. Read `./docs/constitution.md` for context. If it's missing, tell me to run `/spec:init` first.
2. Pick the next spec id: list `specs/`, take the highest `NNN`, add 1 (start at `001`). Make a
   short kebab slug from the idea. Create `specs/NNN-slug/`.
3. Copy `~/.claude/spec-templates/spec.md` into `specs/NNN-slug/spec.md`.
4. **Research the unknowns.** If the idea has open questions (library choice, existing code to
   reuse, API shape, prior art), dispatch the `spec-researcher` subagent with those questions.
   Fold its findings into the spec's "Research notes" and resolve what you can.
5. Fill the spec. Be rigorous about **Acceptance criteria**: every one must be *checkable* — a
   command, an HTTP status, an exit code, a file that exists, a test that passes. Reject vague
   criteria like "clean" or "fast". Keep scope tight; list explicit non-goals.
6. If something material is genuinely ambiguous and blocks a good spec, ask me with
   AskUserQuestion rather than guessing.
7. Stop. Summarize the spec and the open questions, and ask me to review before `/spec:plan`.

Do not write a plan, tasks, or code in this step.
