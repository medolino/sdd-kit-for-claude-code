---
description: Scaffold spec-driven development into the current project (CLAUDE.md, constitution, specs/).
argument-hint: "[project name]"
allowed-tools: Bash(mkdir:*), Bash(cp:*), Bash(ls:*), Bash(test:*), Read, Edit, Write, AskUserQuestion
---

Set up this project for the spec-driven workflow. Templates live in `~/.claude/spec-templates/`.

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write.

Steps:
1. Check whether `./CLAUDE.md` or `./docs/constitution.md` already exist. If either does, stop
   and ask whether to overwrite before doing anything — do not clobber silently.
2. Create directories: `docs/` and `specs/`.
3. Copy `~/.claude/spec-templates/CLAUDE.md` → `./CLAUDE.md` and
   `~/.claude/spec-templates/constitution.md` → `./docs/constitution.md`.
4. Determine the stack: inspect the repo (package.json, pyproject.toml, go.mod, etc.). If it's
   empty or ambiguous, ask me with AskUserQuestion (language/runtime, framework, test runner,
   package manager). Use "$ARGUMENTS" as the project name if provided, else infer or ask.
5. Fill every `{{...}}` placeholder in `./CLAUDE.md` and `./docs/constitution.md` with real
   values. The **verification gates (§5)** must be real, runnable commands for this stack — this
   is the most important part. Leave a placeholder only if genuinely undecided, and flag it.
6. Print a short summary of what was created and the next command to run (`/spec:specify`).

Do not write any application code. This command only scaffolds the process.
