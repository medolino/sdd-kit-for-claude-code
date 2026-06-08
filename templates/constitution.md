# Project Constitution — {{PROJECT_NAME}}

> Durable rules for this project. Read by Claude every session (imported from `CLAUDE.md`).
> Keep it short and concrete. Update it when a decision becomes permanent.

## 1. What this is
{{ONE_PARAGRAPH_SUMMARY — what the project does and who it's for.}}

## 2. Stack & tooling
- **Language / runtime:** {{e.g. TypeScript / Node 22}}
- **Framework:** {{e.g. Fastify, Hono, React, none}}
- **Package manager:** {{e.g. pnpm}}
- **Test runner:** {{e.g. vitest}}
- **Lint / format:** {{e.g. eslint + prettier, biome}}
- **Type checker:** {{e.g. tsc --noEmit}}

## 3. Conventions (non-negotiable)
- {{e.g. No default exports. Named exports only.}}
- {{e.g. Errors are returned, not thrown, across module boundaries.}}
- {{e.g. Every public function has a test.}}
- {{e.g. Prefer reusing existing utilities in src/lib over new code.}}

## 4. Non-functional requirements
- {{e.g. p95 endpoint latency < 200ms; no blocking I/O on the hot path.}}
- {{e.g. All input validated at the boundary (zod) before use.}}

## 5. Verification gates (the commands `/spec:verify` runs)
> These are the project's source of truth for "is it done?". Keep them runnable from the repo root.

```bash
# build / typecheck
{{e.g. pnpm typecheck}}
# lint
{{e.g. pnpm lint}}
# unit + integration tests
{{e.g. pnpm test}}
# smoke (Web/API): start server and hit a known endpoint
# {{e.g. curl -fsS http://localhost:3000/health  → expect 200}}
# smoke (CLI/library): the binary runs and self-describes
# {{e.g. node dist/cli.js --help  → expect exit 0}}
```

## 6. Out of scope / explicit non-goals
- {{e.g. No multi-tenant support in v1.}}

## 7. Decision log (append-only)
- {{YYYY-MM-DD}} — {{decision and one-line rationale}}
