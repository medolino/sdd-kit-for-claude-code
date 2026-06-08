# Spec-Driven Development Kit for Claude Code

A lean, Claude-native, **solo-developer** workflow for spec-driven development (SDD). It turns a
vague idea into a reviewable spec, a plan, an ordered task list, and verified code — with a human
review gate at every step. Built on Claude Code's own machinery (Plan Mode, subagents,
auto-loaded `CLAUDE.md`, namespaced slash commands) rather than a tool-agnostic framework.

## Why this instead of GitHub Spec Kit?

Spec Kit is good and supports Claude Code, but it's tool-agnostic — it can't use Plan Mode,
subagents, or skills, and adds team-oriented ceremony. This kit keeps the parts that matter
(spec → plan → tasks artifacts + a project "constitution") and implements them as thin native
commands you fully control. Reach for Spec Kit when a spec must live portably in git or go to a
team; use this for fast solo work.

## Install (once)

```bash
./install.sh
```

This symlinks into `~/.claude`:
- `commands/spec/` → the `/spec:*` slash commands (available in every project)
- `agents/spec-researcher.md` → the research subagent
- `spec-templates/` → the artifact templates the commands copy from

Because they're symlinks, editing anything in this repo updates the installed commands instantly.

## The workflow

### 1. Tier the change first (don't over-process)
- **Trivial** (typo, format, dep bump, one-liner) → just do it.
- **Small** (bug fix, single-file change) → fast-path: a quick plan in Claude's Plan Mode →
  implement → `/spec:verify`. No spec/tasks files.
- **Feature** (new capability, multi-file, any architectural decision) → full pipeline below.

### 2. Full pipeline (each step ends at your review gate)

| Step | Command | Produces |
|------|---------|----------|
| Set up project (once) | `/spec:init` | `CLAUDE.md`, `docs/constitution.md`, `specs/` |
| Adopt existing code (once) | `/spec:adopt` | constitution + `CLAUDE.md` reverse-engineered from the repo |
| Specify | `/spec:specify "<idea>"` | `specs/NNN-slug/spec.md` — WHAT & WHY, **testable** acceptance criteria |
| Clarify *(optional)* | `/spec:clarify` | tightened spec, ambiguities resolved |
| Plan | `/spec:plan` | `plan.md` — architecture, files table, contracts, decisions |
| Decompose | `/spec:tasks` | `tasks.md` — ordered, checkable tasks in phases |
| Implement | `/spec:implement` | code, one phase at a time, boxes checked, commits at phase gates |
| Verify | `/spec:verify` | runs the constitution's gates, validates every acceptance criterion |
| Audit *(optional)* | `/spec:analyze` | read-only drift check across spec ↔ plan ↔ tasks ↔ code |

## Layout produced in each project

```
your-project/
  CLAUDE.md                 # thin index, auto-loaded; imports the constitution
  docs/constitution.md      # stack, conventions, NFRs, and the verification gate commands
  specs/
    001-some-feature/
      spec.md   plan.md   tasks.md
```

## The principles baked in (2026 best practice)

- **Checkable acceptance criteria.** "`curl` returns 200", "`pnpm test` passes", "`--help` exits
  0" — never "clean" or "fast". This is the single biggest lever on output quality.
- **Thin `CLAUDE.md` that indexes deeper docs** beats one giant file.
- **Explore + Plan are the cheap, high-value phases** — spend time there, not in rework.
- **Review at phase gates**, not on every edit.
- **Reuse before you write** — the spec-researcher and plan steps look for existing code first.

## Kit contents

```
spec-driven-dev/
  README.md          install.sh
  commands/spec/     init specify clarify plan tasks implement verify analyze adopt
  agents/            spec-researcher.md
  templates/         CLAUDE.md constitution.md spec.md plan.md tasks.md
```

## Customizing

- Edit `templates/constitution.md` to match how you like to work — it's the contract every
  project inherits.
- Add stack-specific gate commands you reuse a lot directly into the template's §5.
- Later, you can add a `/spec:ship` command (wrap your deploy) or a hook to nudge task updates;
  see the plan file's "optional enhancements".

## Further reading (real SDD-with-Claude write-ups)

- Heeki Park — *Using spec-driven development with Claude Code*
- alexop.dev — *Spec-Driven Development with Claude Code in Action*
- Daniel Ancuta — *Building a full CLI tool with spec-kit and Claude*
- DataCamp — *Spec-Driven Development with Claude Code: A Guided Tutorial*
- GitHub Spec Kit — https://github.com/github/spec-kit
