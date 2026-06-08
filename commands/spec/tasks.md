---
description: Decompose the approved plan into an ordered, checkable task list.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Bash(cp:*), Edit, Write
---

Break the plan for spec `$ARGUMENTS` (default: latest) into executable tasks.

Steps:
1. Read `specs/NNN-slug/plan.md` (and `spec.md` for the acceptance criteria).
2. Copy `~/.claude/spec-templates/tasks.md` → `specs/NNN-slug/tasks.md` and fill it.
3. Rules for good tasks:
   - Numbered and **dependency-ordered** — a task never depends on a later one.
   - Grouped into phases; each phase ends at a review gate.
   - Each task is small (ideally one commit) and has a **checkable "done when"** — a command,
     a passing test, a file that exists, a status/exit code.
   - The final phase runs the full verification gates and maps back to every acceptance criterion.
4. Stop and ask me to review before `/spec:implement`.

No code in this step.
