---
description: Run the project's verification gates and validate against the spec's acceptance criteria.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Bash, Grep, Glob
---

Verify spec `$ARGUMENTS` (default: latest) is actually done.

Steps:
1. Read the **verification gates** in `./docs/constitution.md` §5 and the **acceptance criteria**
   in `specs/NNN-slug/spec.md`.
2. Run the gate commands from the repo root. Defaults by stack if the constitution is sparse:
   - **Web/API:** typecheck → lint → unit/integration tests → start the server and smoke a known
     endpoint (`curl -fsS <url>` expecting 2xx; check the response body/contract).
   - **CLI/library:** typecheck → lint → unit tests → run the binary (`--help` exits 0) plus one
     real invocation; if the README has a usage example, run it.
3. Go through each acceptance criterion and mark it **pass/fail**, citing the command output or
   observation that proves it. Don't claim pass without evidence.
4. Report a clear verdict:
   - ✅ all gates green and every criterion met → done, suggest committing/shipping.
   - ❌ anything failed → list exactly what failed with the output, and propose the fix.

Be honest about failures — surface the real output, never paper over a red gate.
