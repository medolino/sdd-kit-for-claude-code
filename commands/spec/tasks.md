---
description: Decompose the approved plan into an ordered, checkable task list.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Bash(cp:*), Edit, Write
---

Break the plan for spec `$ARGUMENTS` (default: latest) into executable tasks.

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write —
to me and into the spec files.

Steps:
1. Read `specs/NNN-slug/plan.md` (and `spec.md` for the acceptance criteria).
2. Copy `~/.claude/spec-templates/tasks.md` → `specs/NNN-slug/tasks.md` and fill it. Leave the
   "Run log" table empty.
3. Rules for good tasks:
   - Numbered and **dependency-ordered** — a task never depends on a later one.
   - Grouped into phases; each phase ends at a review gate.
   - Each task is small (ideally one commit) and has a **checkable "done when"** — a command,
     a passing test, a file that exists, a status/exit code.
   - The final phase runs the full verification gates and maps back to every acceptance criterion.
4. **Decide who does each task** and put the label right after the task number:
   - `[delegated-sonnet]` only when **all** of these are true:
     - the plan already says exactly what to build (files, names, shapes);
     - the work is mechanical or follows a pattern that already exists in the repo
       (boilerplate, wiring, config, renames, tests written from clear criteria, docs);
     - the task's "done when" check would catch a wrong result.
   - `[main]` when **any** of these is true:
     - a design choice is still open, or the task needs judgment the plan does not spell out;
     - it touches security, auth, money, or deletes/migrates data;
     - tricky logic, concurrency, or a bug whose cause is unknown;
     - it changes many modules at once;
     - the "done when" check could pass while the result is still wrong.
   - When unsure, choose `[main]`. Quality comes before saving cost.
   - A delegated task must stand on its own, because the subagent starts with no context: name
     the files it touches and the part of the plan it follows.
5. Stop and ask me to review before `/spec:implement`. In the summary, say how many tasks are
   `[main]` and how many are `[delegated-sonnet]`, give one short reason for each `[main]` task,
   and tell me I can change any label in `tasks.md`.

No code in this step.
