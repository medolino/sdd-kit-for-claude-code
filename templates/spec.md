# Spec: {{FEATURE_NAME}}

- **ID:** {{NNN-slug}}
- **Created:** {{YYYY-MM-DD}}
- **Owner:** {{you}}

> The **WHAT** and **WHY**. No implementation detail — that belongs in `plan.md`.

## In short
{{3–4 plain sentences: what we are building, for whom, and why. Someone who reads only this
block should know what the spec is about.}}

## Problem / Why
{{What hurts today, or what opportunity this captures. Why now.}}

## Goal
{{One or two sentences describing the desired end state.}}

## User stories
- As a {{user}}, I want {{capability}} so that {{benefit}}.

## Acceptance criteria (must be checkable)
> Each criterion is something a command or observation can verify. No "clean", "fast", "good".
> Number them `AC-1`, `AC-2`, … so the plan, the tasks and `/spec:verify` can point at them.

- [ ] **AC-1** — {{e.g. `GET /health` returns HTTP 200 with body `{"status":"ok"}`}}
- [ ] **AC-2** — {{e.g. `pnpm test` passes including new test `health.test.ts`}}
- [ ] **AC-3** — {{e.g. Invalid input returns 400 with a validation error message}}

## Out of scope
- {{What this change will NOT do, in a full sentence. If it is planned for later, say where and
  when it will be handled.}}

## Open questions
- [ ] {{Anything unresolved. Resolve via `/spec:clarify` before planning.}}

## Research notes
{{Findings from the spec-researcher subagent, links, prior art. Optional.}}
