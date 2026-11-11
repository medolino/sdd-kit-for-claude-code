---
description: Run the project's verification gates and validate against the spec's acceptance criteria.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Bash, Grep, Glob, Edit
---

Verify spec `$ARGUMENTS` (default: latest) is actually done.

First read `~/.claude/spec-templates/writing-rules.md` and follow it for everything you write.

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
   - Check everything you can yourself. Start the app, call the endpoint, read the output.
   - When a criterion passes with proof, tick its box in `spec.md`. That is the only edit you
     may make — fix nothing in this step.
   - If only a person can check a criterion (how something looks, a real device, an account you
     cannot reach), leave its box open and hand it to me in the "Your turn" block with exact
     steps. Tick it after I confirm.
4. Report in this order:
   - **Verdict** in one line:
     - ✅ all gates green and every criterion met → done, suggest committing/shipping.
     - ❌ anything failed → say exactly what failed, show the output, and propose the fix.
     - ⏳ everything you could check passed, but some checks are waiting for me.
   - **Gates** — one line each: name, command, pass/fail.
   - **Acceptance criteria** — one line each: the ID, what it says, pass/fail, and the proof.
   - The **"Your turn"** block: for each check that is mine, the steps and what I should see.

Be honest about failures — surface the real output, never paper over a red gate.
