# Matching-agent prompt template

Read docs/decomp-wave/SKILL.md, AGENTS.md, and the current batch brief at
[brief path]. Work only on these assigned targets: [exact function list].

Read the named exemplars and relevant docs/agbcc-codegen.md chapters. Check
parked and asm-resident records. Start from the existing draft, run it once,
and classify its current diff before editing. Respect the per-function budget
and temporary compiler-profile rules in AGENTS.md.

Own only work/<fn>/ for your assigned functions. Coordinate any header/type
or code-generation documentation changes with the coordinator first. Expected
shared symbols and affected callers: [known list, or explicitly unknown].

Leave final candidates at work/<fn>/<fn>.c. Report each exit status, remaining
diff, experiments ruled out, and any evidence-backed compiler/type discovery.
Do not promote, edit integration state, or commit.
