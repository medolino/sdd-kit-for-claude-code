# Plan: {{FEATURE_NAME}}

- **Spec:** ./spec.md
- **Created:** {{YYYY-MM-DD}}

> The **HOW**. Derived from spec.md + the project constitution. Code is generated from this.

## In short
{{3–4 plain sentences: what will be built, how, and which part is the riskiest. Someone who reads
only this block should know what the plan is about.}}

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
> How each spec acceptance criterion will be proven. Write the ID and what it says.
> If only a person can check a criterion, say so and write the steps that person will follow.
- **AC-1** ({{criterion in a few words}}) → {{the test / command that proves it}}.
