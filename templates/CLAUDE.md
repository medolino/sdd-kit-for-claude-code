# {{PROJECT_NAME}}

{{ONE_PARAGRAPH_SUMMARY — what this project is, in 2–3 sentences.}}

@docs/constitution.md

## How we work here (spec-driven)

This project uses a tiered spec-driven workflow. Before writing code, classify the change:

- **Trivial** (typo, format, dep bump, one-liner) → just do it.
- **Small** (bug fix, single-file change) → fast-path: brief plan → implement → `/spec:verify`.
- **Feature** (new capability, multi-file, any architectural decision) → full pipeline:
  `/spec:specify` → (`/spec:clarify`) → `/spec:plan` → `/spec:tasks` → `/spec:implement` → `/spec:verify`.

Specs live in `specs/NNN-slug/` (spec.md, plan.md, tasks.md). The active spec is the
highest-numbered folder unless I say otherwise.

**Rules of engagement:**
- Acceptance criteria must be checkable (a command, a status code, an exit code) — never vague.
- Stop for my review at each phase gate; don't run the whole pipeline unattended.
- Always run the verification gates in `docs/constitution.md` §5 before claiming done.
- Reuse existing code in this repo before writing new code.
- Write to me in short, plain sentences. No invented labels or bare IDs — say what the thing is.
- Whenever you stop and wait for me, end with what is done, what I must do (exact steps and what
  I should see), and what to reply. Full rules: `~/.claude/spec-templates/writing-rules.md`.
