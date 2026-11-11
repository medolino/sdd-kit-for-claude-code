# Tasks: {{FEATURE_NAME}}

- **Plan:** ./plan.md
- **Created:** {{YYYY-MM-DD}}

> Numbered, dependency-ordered. Each task has a checkable "done when". Work top-down, one phase
> at a time, committing at phase boundaries. Check boxes as you go.
>
> **Who does each task** (change any label before `/spec:implement` if you disagree):
> - `[main]` — the main session does it itself.
> - `[delegated-sonnet]` — handed to a Sonnet subagent. The main session checks the result.

## Phase 1 — {{Foundation}}
- [ ] 1. `[delegated-sonnet]` {{Add zod schema for request body in `src/schema.ts`}} — done when: {{`src/schema.ts` exports `BodySchema`; `pnpm typecheck` passes}}
- [ ] 2. `[main]` {{Create route handler}} — done when: {{handler file exists and compiles}}

## Phase 2 — {{Wiring}}
- [ ] 3. `[delegated-sonnet]` {{Register route in `src/app.ts`}} — done when: {{server starts; `curl /health` → 200}}

## Phase 3 — {{Tests & verify}}
- [ ] 4. `[delegated-sonnet]` {{Write tests covering AC-1 to AC-3 in `test/health.test.ts`}} — done when: {{`pnpm test` passes}}
- [ ] 5. `[main]` {{Run full verification gates}} — done when: {{`/spec:verify` reports all green}}

---
**Review gates:** stop for human review at the end of each phase before continuing.

## Run log
> Filled in by `/spec:implement` at the end of each phase. Shows who did each task.

| Task | Done by | Result | Tries |
|------|---------|--------|-------|
