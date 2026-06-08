---
description: Reverse-engineer a constitution and CLAUDE.md from an existing codebase.
allowed-tools: Read, Grep, Glob, Bash(ls:*), Bash(cat:*), Bash(git:*), Bash(mkdir:*), Bash(cp:*), Edit, Write, Agent, AskUserQuestion
---

Bring an existing project into the spec-driven workflow by generating its baseline docs.

Steps:
1. Explore the repo to understand it. For a broad sweep, dispatch Explore subagents to map:
   stack & tooling, directory structure & module boundaries, conventions actually in use
   (naming, error handling, exports), the build/test/lint commands, and how the app runs.
2. Create `docs/` and `specs/` if missing. Copy `~/.claude/spec-templates/constitution.md` →
   `./docs/constitution.md` and `~/.claude/spec-templates/CLAUDE.md` → `./CLAUDE.md`.
3. Fill them from what you observed — describe the conventions that *exist*, don't impose new
   ones. The **verification gates (§5)** must be the project's real commands; find them in
   package.json scripts, Makefile, CI config, or README.
4. Where intent isn't inferable from code (non-goals, NFR targets, future direction), ask me
   with AskUserQuestion rather than inventing it.
5. Summarize what you captured and flag anything uncertain for me to confirm. Then I can use the
   normal pipeline (`/spec:specify` …) for new work.

Do not refactor or change application code — this only adds documentation.
