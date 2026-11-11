---
description: Read-only consistency audit across spec, plan, tasks, and code for the active spec.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Grep, Glob, Bash(ls:*), Bash(git:*)
---

Audit spec `$ARGUMENTS` (default: latest) for drift. **Read-only — change nothing.**

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write.

Check for:
1. **Spec ↔ plan:** does the plan address every acceptance criterion? Anything in the plan not
   traceable to the spec (scope creep)?
2. **Plan ↔ tasks:** is every planned file/change covered by a task? Any orphan tasks?
3. **Tasks ↔ code:** for tasks marked done, does the code/test actually exist? Any acceptance
   criterion with no corresponding test?
4. **Constitution:** any violation of the project's conventions or non-functional requirements?

Report findings grouped by severity (blocking / should-fix / nit). Each finding says in plain
words what is wrong, gives a file reference, and a one-line suggested action. Do not edit
anything — this is a review, not a fix.
