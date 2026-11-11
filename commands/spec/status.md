---
description: Show where the active spec stands and what is waiting for me.
argument-hint: "[spec id, default = latest; or 'all']"
allowed-tools: Read, Grep, Glob, Bash(ls:*), Bash(git:*)
---

Tell me where spec `$ARGUMENTS` stands (default: highest-numbered folder in `specs/`; `all` =
one line per spec). **Read-only — change nothing.**

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write.

Steps:
1. Look at the spec folder and work out the stage from what is there:
   - only `spec.md` → the spec is written. Unchecked "Open questions" → suggest `/spec:clarify`,
     otherwise `/spec:plan`.
   - `plan.md` but no `tasks.md` → the plan is written. Next is `/spec:tasks`.
   - `tasks.md` with open boxes → building. Count done tasks and find the current phase. Next
     is `/spec:implement`.
   - all task boxes ticked, some acceptance criteria open in `spec.md` → built, not verified.
     Next is `/spec:verify`.
   - all acceptance criteria ticked → done.
2. Check `git status` for uncommitted work that belongs to this spec.
3. Report, short:
   - **Spec** — id and the "In short" text in one line.
   - **Where it stands** — the stage, e.g. "Building: phase 2 of 3, 4 of 7 tasks done".
   - **Waiting for you** — numbered: each thing I must review, decide or check, with the file
     to open or the command to run. Write "nothing" if there is nothing.
   - **Next command** — the one command to run next.
