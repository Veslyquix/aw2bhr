# AW2:BHR decompilation agent guide

This repository is a byte-matching decompilation of Advance Wars 2: Black
Hole Rising. A function is complete only when agbcc reproduces the original
bytes and the integrated ROM still has SHA1
`14dd0b22c894865867aff89e8116b2dffae25605`.

This file is the Codex-facing counterpart to the existing Claude workflow.
Do not remove or replace anything under `../.claude/`. The detailed canonical
wave protocol remains:

- `../.claude/skills/decomp-wave/SKILL.md`
- `../.claude/skills/decomp-wave/brief-template.md`
- `../.claude/skills/decomp-wave/agent-prompts.md`

Read those files before orchestrating or participating in a decompilation
wave. If this file and the detailed protocol differ, follow the newest
measured rule in the detailed protocol and record the correction durably.

## Repository boundaries

- Work in this directory on `main`.
- Never push. `origin` is upstream, not the user's destination.
- Never edit `asm/`; it remains the immutable reference.
- Preserve unrelated user changes and inspect `git status` before integration.
- Builds run in WSL. Per-function matching tools run from the project-local MCP
  server or the Windows Python environment.

## Current operating model

- Ask the user for the concurrent matching-agent cap before each wave.
- The coordinator owns preflight, batching, the target ledger, independent
  verification, promotion, generated files, both builds, reindexing, progress,
  parking reconciliation, and the commit.
- Matching agents own explicit, non-overlapping target lists and their
  `work/<fn>/` drafts. They do not promote or commit.
- Give a matching agent 5-6 functions from one region/vocabulary. Anything
  above roughly 1,500 bytes gets a dedicated agent.
- Prefer a fresh agent when moving to an unrelated region. Retask only when the
  same structs, globals, callees, or compiler configuration genuinely carry.
- At more than three matching agents, one slot may investigate a concrete
  question. At three or fewer, attach the experiment to a matching batch with
  an explicit acceptance test.

## Selecting work after Wave 60

The exact-family, shape-similarity, and broad duplicate wells are nearly dry.
Do not run a giant address sweep or rank work by percentage alone.

Use this priority order:

1. Re-measure drafts excluded by the residual screen because their candidate
   binaries are missing or stale.
2. Target unspent small residuals, especially loop and straight-line drafts
   whose generated code length is within 2-4 bytes of the ROM.
3. Take coherent toolchain-sensitive blocks where compiler overrides are
   evidence-backed.
4. Work size-exact allocation/order residuals selectively; a high score often
   means an unreachable instruction-order decision rather than an easy match.
5. Give large incomplete transcriptions and functions over 1,500 bytes their
   own agents.
6. Sweep trivial return stubs as a bulk, signature-aware task rather than one
   agent per stub.

Run `python tools/overlap_screen.py --delta-only` for the current residual
queue. When using locality screening, explicitly lower stale floors and include
loops; the command defaults retain historical filters that can hide most of the
remaining corpus. Treat `best.json` percentages as leads only and re-test by
exit status.

Before parking a source-level miss, inspect `data/compiler-overrides.json` and
the surrounding block. Wave 60 found whole groups whose source was already
correct under a different compiler or optimization level.

## Matching-agent rules

- Read the current wave brief in full, then read only the relevant chapters of
  `docs/agbcc-codegen.md`.
- Check every target against `data/parked.json` and
  `data/asm-resident.json` before working it.
- Read the named promoted exemplar before the target assembly when one exists.
- Use the project MCP tools for independent lookups, `compile_probe`, and
  `try_match`; batch independent lookups into parallel calls.
- Start from the existing draft. Run it once, read the current diff, and
  classify the residual before editing. Do not discard prior measurements.
- Budget about ten tool-call turns per function. At the budget, record the
  exact remaining diff and ruled-out axes, then move on.
- Leave the final source at `work/<fn>/<fn>.c`. A report is not proof of a
  match; only an independently observed zero exit status is.
- Record durable code-generation discoveries in `docs/agbcc-codegen.md` and
  evidence-backed type/prototype corrections in the appropriate header.
- The MCP `permute` wrapper is known to mishandle timeout results. Until fixed,
  use `tools/permute.py`, preserve the starting draft, and re-run `trymatch.py`
  on any reported result.

## Shared-file coordination

The main collision surfaces are:

- `include/unknown-functions.h`
- `include/unknown-globals.h`
- `docs/agbcc-codegen.md`
- `data/parked.json`
- `data/compiler-overrides.json`

Prompts must identify expected cross-batch symbol collisions. One retry is
reasonable for an apparent torn header read; if the failure persists, run
`tools/proto_check.py` and treat it as real. Do not reshape a shared struct
without checking every promoted definition and caller affected by it.

Only the coordinator edits or regenerates integration state such as
`data/promoted.json`, `data/functions.json`, `data/families.json`, linker
scripts, `src/decomp/` promotion outputs, and `progress/index.html`.
`data/parked.json` must retain CRLF line endings and one-space JSON indentation.
Do not round-trip `data/asm-resident.json`; it contains evidence that must not
be silently normalized or discarded.

## Verification and integration gates

1. The coordinator writes one exact, deduplicated target list.
2. Run `python tools/verify_batch.py <list> --log <log>` after all matching
   agents are idle. Trust only reconciled `verified N of N` output and each
   function's exit status. `FAIL(2)` means no usable draft; `FAIL(1)` means a
   draft exists but misses.
3. Re-verify any already-promoted unit affected by shared header or type edits.
4. Run `tools/proto_check.py`, then promote only independently verified
   matches with `tools/promote.py`.
5. Regenerate in order: `split_asm.py`, `split_rodata.py`, `gen_lds.py`.
6. In WSL, delete `aw2bhr.gba` and `aw2bhr.elf` between routes. Run both
   `make SPLIT=1 compare` and `make compare` with independent exit codes and
   pipe failure propagation. Both must report the canonical ROM SHA1.
7. Only after both builds pass, run `index_functions.py`, `families.py`, and
   `progress_map.py`; reconcile parked entries and inspect the final diff.

The checked-in README progress can lag the machine tracker. Use
`data/functions.json`, the generated progress page, and the latest wave commit
when briefing agents.
