---
description: Surface ambiguities in the active spec and resolve them via targeted questions.
argument-hint: "[spec id, default = latest]"
allowed-tools: Read, Edit, AskUserQuestion, Agent
---

Tighten the active spec before planning. Target: spec `$ARGUMENTS` (default: highest-numbered
folder in `specs/`).

Steps:
1. Read the spec's `spec.md`.
2. Hunt for ambiguity and underspecification: unstated edge cases, vague acceptance criteria,
   undefined terms, missing error/empty/limit behavior, implicit assumptions, unresolved items
   in "Open questions".
3. For things research can settle, dispatch the `spec-researcher` subagent. For things only I
   can decide, ask me with AskUserQuestion — batch related questions, max a few at a time.
4. Update `spec.md` in place: rewrite weak acceptance criteria into checkable ones, fill gaps,
   clear resolved open questions.
5. Report what changed and confirm the spec is ready for `/spec:plan`.

Edit only the spec. No plan, no code.
