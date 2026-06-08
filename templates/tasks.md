# Tasks: {{FEATURE_NAME}}

- **Plan:** ./plan.md
- **Status:** not started · _Created {{YYYY-MM-DD}}_

> Numbered, dependency-ordered. Each task has a checkable "done when". Work top-down, in batches,
> committing at phase boundaries. Check boxes as you go.

## Phase 1 — {{Foundation}}
- [ ] 1. {{Add zod schema for request body}} — done when: {{`src/schema.ts` exports `BodySchema`; `pnpm typecheck` passes}}
- [ ] 2. {{Create route handler}} — done when: {{handler file exists and compiles}}

## Phase 2 — {{Wiring}}
- [ ] 3. {{Register route in app}} — done when: {{server starts; `curl /health` → 200}}

## Phase 3 — {{Tests & verify}}
- [ ] 4. {{Write tests covering acceptance criteria}} — done when: {{`pnpm test` passes}}
- [ ] 5. {{Run full verification gates}} — done when: {{`/spec:verify` reports all green}}

---
**Review gates:** stop for human review at the end of each phase before continuing.
