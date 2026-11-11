---
description: Execute the task list for the active spec, one phase at a time, with review gates.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Grep, Glob, Edit, Write, Bash, Agent, TaskCreate, TaskUpdate
---

Implement spec `$ARGUMENTS` (default: latest) by working `specs/NNN-slug/tasks.md`.

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write —
to me and into the spec files.

You are the main session. You stay in charge of the whole run. I am asking you to use subagents
here, as described below.

Steps:
1. Read `tasks.md`, `plan.md`, `spec.md`, and `./docs/constitution.md`.
2. Mirror the task list into your own TODO tracker so progress is visible.
3. Work **one phase at a time, top-down**. Each task has a label that says who does it:
   - **`[main]`** (or no label) — do it yourself, following the plan and the constitution's
     conventions. Reuse existing code; don't reinvent.
   - **`[delegated-sonnet]`** — hand it to a subagent with the Agent tool
     (`subagent_type: "general-purpose"`, `model: "sonnet"`). The subagent starts with no
     context, so the brief must contain:
     - the task text and its "done when";
     - the parts of the plan it needs (files, contracts, names) — paste them, don't only point;
     - the constitution conventions that apply, and paths of existing code to reuse;
     - these limits: change only what this task needs, do not commit, do not touch `tasks.md`,
       and report what you changed plus anything the plan did not expect.

     Delegated tasks that touch different files may run in parallel. Otherwise run them one at
     a time, in order.
   - **Check every delegated result yourself.** Read the diff and run the task's "done when"
     check. Never tick a box on the subagent's word alone.
     - Passed → tick the box.
     - Failed → send it to a new Sonnet subagent once more, with the failure output.
     - Failed twice → do the task yourself and record that in the run log.
   - As each task meets its "done when", check its box in `tasks.md`.
4. At the **end of each phase**:
   - Run the relevant checks.
   - Run the `spec-reviewer` subagent on this phase's changes. Give it the spec folder, the
     phase number, and how to see the changes (e.g. `git diff` for uncommitted work). Fix
     what it marks as blocking. If a finding is really a question about the plan, bring it to me.
   - Add one row per task to the "Run log" table in `tasks.md`.
   - **Stop and report** for my review before starting the next phase. Do not run the whole
     pipeline unattended. The report has:
     - a table of this phase — task, done by ("main session" or "Sonnet subagent"), result,
       tries;
     - what the reviewer found and what you did about it;
     - the "Your turn" block from the writing rules.
5. Commit at phase boundaries (only if this is a git repo and I haven't said otherwise), with a
   message referencing the spec id and phase.
6. When all phases are done, tell me to run `/spec:verify`.

If you or a subagent hit something the plan didn't anticipate, stop and flag it — update the
plan/tasks rather than silently improvising.
