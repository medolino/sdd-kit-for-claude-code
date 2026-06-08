# Plan: {{FEATURE_NAME}}

- **Spec:** ./spec.md
- **Status:** draft · _Created {{YYYY-MM-DD}}_

> The **HOW**. Derived from spec.md + the project constitution. Code is generated from this.

## Approach (chosen)
{{2–4 sentences: the strategy and why it fits the constitution. State the approach you picked,
not every alternative considered.}}

## Architecture / data flow
{{Brief description or ASCII diagram of how the pieces fit. Reuse existing modules where possible —
name them with paths.}}

## Files to create / change
| File | Action | Purpose |
|------|--------|---------|
| {{src/routes/health.ts}} | create | {{health endpoint handler}} |
| {{src/app.ts}} | edit | {{register the route}} |
| {{test/health.test.ts}} | create | {{cover acceptance criteria}} |

## Data model / API contracts
{{Schemas, request/response shapes, types, DB changes. Skip if N/A.}}

## Key decisions & tradeoffs
- {{Decision}} — {{why; what we gave up}}.

## Risks / unknowns
- {{Risk}} → {{mitigation}}.

## Verification mapping
> How each spec acceptance criterion will be proven.
- {{criterion}} → {{the test / command that proves it}}.
