# Writing rules for the spec kit

These rules apply to everything you write in this workflow: messages to me, and the text in
`spec.md`, `plan.md` and `tasks.md`. I must be able to read any of it once and know what it is
about and what I have to do.

## 1. Plain language

- Short sentences. Everyday words. One idea per sentence.
- Say the main point first, details after.
- Explain a term the first time you use it, or pick a simpler word.
- Write full sentences, not compressed notes. Say who does what, and when.
- Keep exact things exact: commands, file paths, status codes, schemas, names from the code.
  Plain language is for the words around them. Never drop a detail that an agent needs to build
  or check something.

## 2. Labels and IDs

- Do not invent labels, codes or abbreviations (no `G4`, `E6`, `R-N`, `A1`).
- The only IDs you may use are the ones the templates define: `AC-1`, `AC-2`, … for acceptance
  criteria, plus task numbers and phase numbers.
- Never write an ID alone. Put what it says next to it:
  "AC-3 (invalid input returns 400)", "task 5 (register the route)".
- Call a verification gate by its name and its command: "lint (`pnpm lint`)". Do not number gates.
- Point to another document by saying what is there: "the research notes at the end of
  `spec.md`". Do not use a section code.

Example.

- Not this: `E6: backlog item 8 stays open, marked designed in R-N and built by the next spec.`
- This: "CSV export (item 8 on the backlog) is not built in this spec. This spec only writes
  down its design, in the research notes at the end of `spec.md`. The next spec will build it.
  You do not need to do anything."

## 3. End every stop with a "Your turn" block

Whenever you stop and wait for me, the last thing in your message is this block:

```
**Done:** what you finished, in 1–3 lines.

**Your turn:**
1. What to do: the exact command to run, file to open, or page to visit.
   You should see: what a good result looks like.
2. …

**Then reply:** the exact answers I can give, e.g. "`ok` to continue, or tell me what to change".

**Left for later:** what stays open, who will do it, and when. Leave this line out if nothing.
```

Rules for the block:

- Check everything you can yourself before you stop. Hand me only what needs a person: how
  something looks or feels, a real device, an account you cannot reach, a decision.
- I must be able to do each step without opening another file to decode it. Give the command,
  where to run it, and what I should see.
- When you hand me a check, say in a few words why you could not do it yourself.
- When I only need to read and approve a file, name the file and the 2–3 points in it that most
  need my eyes (a guess you made, a tradeoff, something left out).
- If there is nothing for me to check, write: "**Your turn:** nothing to check. Reply `ok` to
  continue."
- If something failed, say that first, before anything else.
