---
description: Execute the task list for the active spec, one phase at a time, with review gates.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Grep, Glob, Edit, Write, Bash, Agent, TaskCreate, TaskUpdate
---

Implement spec `$ARGUMENTS` (default: latest) by working `specs/NNN-slug/tasks.md`.

Steps:
1. Read `tasks.md`, `plan.md`, `spec.md`, and `./docs/constitution.md`.
2. Mirror the task list into your own TODO tracker so progress is visible.
3. Work **one phase at a time, top-down**:
   - Implement each task following the plan and the constitution's conventions. Reuse existing
     code; don't reinvent.
   - As each task meets its "done when", check its box in `tasks.md`.
   - At the **end of each phase**, run the relevant checks, then **stop and report** for my
     review before starting the next phase. Do not run the whole pipeline unattended.
4. Commit at phase boundaries (only if this is a git repo and I haven't said otherwise), with a
   message referencing the spec id and phase.
5. When all phases are done, tell me to run `/spec:verify`.

If you hit something the plan didn't anticipate, stop and flag it — update the plan/tasks rather
than silently improvising.
