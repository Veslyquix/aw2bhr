# `sub_0800CFDC` volume checkpoint

## Wave 70 allocator/shared-tail pass

The retained configured fixpoint remains 6,368 bytes against 6,384 (`-16`),
14.3% positional identity, first difference `+0x23`, with 327 `ldrh`, 672
`add`/`adds`, and 436 `lsl`/`lsls`.  All 36 calls, EAF4 6/6, EB5C 21/21,
and all 159 emitted bridge predicates remain exact.

Two new D0F4 allocator-priority spellings were ruled out.  Splitting the cell
address and loaded value into separate `u32`/`u16` SSA names is byte-for-byte
neutral, as is changing the natural `first` chain from `u32` to signed `int`:
both configured candidates remain 6,368 bytes, 14.3%, first `+0x23`, and
327/672/436.  Thus neither source type nor a distinct loaded-value lifetime
forces the target-only high-register add/load/copy chain.

A narrower DC32 experiment bound the y-minus-two row only in the `0x67` and
`0x64/0x65` arms while retaining the active if ladder.  Expressing both arms
naively gives 6,388 bytes and 16.1% identity, but duplicates an emitted EB5C
tail (22 versus 21).  The arm bisection shows that the `0x67` arm causes the
duplication: it alone gives 6,392 bytes, 12.8%, EB5C 22; the `0x64/0x65` arm
alone gives 6,364 bytes, 12.4%, EB5C 21.

An explicit shared `goto` tail for those two arms is the strongest structural
diagnostic: configured 6,380 bytes (`-4`), 19.1%, first `+0x23`, counts
326/671/436, and all 36 calls exact (EAF4 6, EB5C 21).  It is not admissible,
because it emits 160 bridge subtract/test sequences versus the required 159.
A boolean shared-tail spelling was checked by configured-profile local compile
before any verdict; it is 6,392 bytes, 326/670/436, EB5C 21, and still 160
bridges.  The 6,380 candidate is preserved as
`experiment_wave70_dc32_shared_tail.*`, but the exact-call/exact-bridge 6,368
fixpoint remains canonical.

## Wave 69 concentrated D0F4/DC32 pass

The active draft is now 6,368 bytes against the 6,384-byte target (`-16`),
14.3% positional identity, first difference `+0x23`.  A configured verdict and
an independent reconciled `verify_batch.py` run both return `FAIL(1)`; this is
not an exact match.  All 36 calls and all 159 bridge predicates remain exact.

The retained D0F4 spelling stages the first cell offset through a
statement-local `u32`.  It reproduces the ROM's `ip` y-minus-one staging,
`sb`/`r9` first-offset staging, and exact EAF4 call setup.  D0F4 is now 120
bytes against 124.  The remaining target-only chain is the allocator form
`add sb,r1; mov r4,sb; ldrh r4; mov sb,r4; mov r0,sb`; agbcc continues to
fold it to `mov r4,sb; adds r0,r4,r1; ldrh r0`.  Embedded compound assignment,
byte-pointer, volatile, and fixed-register variants did not recover it without
regressing the prologue.

`experiment_wave69_c_dc32_rows_23.c` removes exactly two DC32
`ldrh`/`add`/`lsl` reload chains while preserving EB5C 21 and bridges 159 on
the structurally faithful 6,352-byte base.  Composing it with the D0F4 change
produces 6,348 bytes with the exact global `ldrh` count (325), but cross-jump
layout removes three additional shifts and twelve bytes.  It is therefore a
useful diagnostic, not the retained whole-function candidate.  DFB4's obvious
row-plus-one binding is byte-neutral.  Configured/default/no-force/old-agbcc
profiles are all 6,360 bytes on the Wave 68 base; O1 regresses to 6,568.

Preserved Wave 69 artifacts include `snapshot_wave69_start_6360.*`,
`experiment_wave69_entry_d0_selfsteps.c`,
`experiment_wave69_c_dc32_rows_23.c`, and
`experiment_wave69_c_findings.md`.

## Wave 68 concentrated residual pass

The active draft is now 6,360 bytes against the 6,384-byte target (`-24`),
14.29% positional identity, first difference `+0x23`.  This is a 172-byte net
improvement over the prior 6,532-byte checkpoint.  Configured `try_match` and a
from-scratch `verify_batch.py` sweep both confirm that it remains unmatched.

The decisive new type fact is that `+0x417A` must be exposed as an aggregate
`rowOffset[]` member.  Using member indexing in `CELL_AT` gives gcc the middle
CSE granularity the ROM shows, fixes the first `sub_0800E8CC` result from `r9`
to `r8`, and restores all 159 bridge predicates.  DC32 alone must retain the
older flat row spelling to reproduce its three-source-call to two-emitted-call
cross-jump.  The active draft therefore has exact callee and predicate counts:
EAF4 6/6, EB5C 21/21, bridges 159/159.

The E336 family is a sparse switch, not an if/range chain.  Source case order
`0x27`, `0x67`, then `0x24/0x25` restores its 24-byte decision tree.  A volatile
two-step row-index reload (`rowIndex = a; rowIndex += 2`) is the exact local
lever for E336's missing `+1 ldrh/+2 add`, and remains preserved as
`experiment_wave68_round2_e336_scaledvolatile.c`.  Five analogous sparse
switches in DAC6/DC32/DE3A remove six adds and five shifts without changing any
call or bridge count; the combined structurally faithful 6,352-byte artifact is
`experiment_wave68_early_switch_e336_2767r_d9volatile.c`.

Current active counts are 327 `ldrh` versus 325, 673 add/adds versus 663, and
436 lsl versus 432.  The remaining source questions are localized: D0F4 needs
the ROM's high-register address add; DC32 has two row-reload chains; DFB4 has
two excess adds/two shifts; and the entry zero temporary still uses r3 instead
of the ROM's r0.  Five declaration/scope/zero/branch-order probes did not move
that entry copy without regressing allocation.  See
`experiment_wave68_residual_findings.md` and
`wave68-round2-head-handoff.md` for the exact region table and negatives.

The full function is transcribed in `sub_0800CFDC.c`; no pattern region is
left as a placeholder. `tools/symtrace.py` was rerun against `target.s`, and
the resulting 1,190-line trace is in `_symtrace.txt`.

## Configured oracle result

- candidate: 6,532 bytes
- target: 6,384 bytes
- delta: +148 bytes
- positional identity: 13.8%
- first byte difference: `+0x36`
- first structural difference: the first `sub_0800E8CC` result occupies `r9`
  in the candidate and `r8` in the ROM. The entry through `+0x34` is exact,
  including the force-address pool route.

Seventeen configured `try_match` verdicts were used while converting the
zero-body park into this complete candidate. Important measured checkpoints:

| candidate shape | bytes | delta | identity |
|---|---:|---:|---:|
| direct inline cell expressions | 5,056 | -1,328 | 8.5% |
| conditional exact-row macro | 7,356 | +972 | 9.6% |
| persistent `y * 2`, inline offsets | 5,208 | -1,176 | 7.6% |
| statement-local cell offset | 6,060 | -324 | 9.7% |
| statement-local row index + row offset, honest global | 6,532 | +148 | 13.8% |

## Remaining binding work

The transcription and case values are settled. The residual is the row-value
binding/allocation layer:

- The candidate emits 353 `ldrh` instructions against the target's 325
  (`+28`). Each `CELL_AT` expansion currently reloads `ro[y+K]`; the ROM keeps
  repeated rows within a pattern region.
- The candidate correspondingly has 721 `add` instructions against 663 and
  464 `lsl` instructions against 432.
- Removing the statement-local row binding is not the answer: it lets CSE
  collapse cell addresses and produces a 5,208-byte candidate, 1,176 bytes
  short. The next step is explicit per-region bindings for repeated
  `ro[y-2]`/`ro[y-1]`/`ro[y]`/`ro[y+1]`/`ro[y+2]`, starting at `_0800D0F4`.
- Two target calls survive cross-jumping that the candidate merges: emitted
  calls are 5 vs 6 for `sub_0800EAF4` and 20 vs 21 for `sub_0800EB5C`.
- The final candidate emits 157 bridge subtract/test sequences against 159 in
  the target. This is downstream of the same cross-jumping/binding issue; the
  source contains every traced predicate.

Work the regions independently in target order. The useful boundaries are the
two switch bodies (`_0800D0E8` through `_0800D954`) followed by nine pattern
families beginning at `_0800D9D4`, `_0800DAC6`, `_0800DC32`, `_0800DE3A`,
`_0800DFB4`, `_0800E1B6`, `_0800E336`, `_0800E546`, and `_0800E6B6`.

## Bounded `_0800D0F4` row-binding experiment

One configured checkpoint tested only the first switch region, leaving all
later regions unchanged.  The experimental source is preserved as
`experiment_D0F4.c` (with its `.bin`, `.s`, and `.o` artifacts); the active
`sub_0800CFDC.c` was restored to the stronger 6,532-byte checkpoint above.

The tested spelling moved the region bindings behind the `x > 0 && y > 0`
guard, bound `ym1 = y - 1`, materialised its doubled row index before binding
`rows`, loaded `ro[y-1]` once, and passed that row value to two separate
statement-local cell-offset expansions.  A focused `compile_probe` established
that this is the middle granularity: it reuses the row halfword without CSEing
the two neighbouring cell addresses.

The emitted `_0800D0F4` block consequently acquired the target's local shape:

- bounds tests precede the `gUnknown_08499590`/`rows`/`tiles` bindings;
- the `ro[y-1]` `ldrh` is shared by the first two predicates;
- the first `sub_0800EAF4` call no longer cross-jumps away, bringing the whole
  candidate's call count to the target's 6 (the baseline has 5).

The full configured result nevertheless regressed globally:

| candidate | bytes | delta | positional identity | first diff |
|---|---:|---:|---:|---:|
| active/restored checkpoint | 6,532 | +148 | 13.78% | `+0x36` |
| `_0800D0F4` experiment | 6,544 | +160 | 13.50% | `+0x36` |

The experiment emitted 353 `ldrh`, 720 `add`/`adds`, and 464 `lsl` instructions
overall.  Thus the local saved row reload was offset by the newly unmerged call
tail: total `ldrh` stayed at +28, `add` improved by one, and size grew 12 bytes.
Call counts became `sub_0800EAF4` 6/6 and `sub_0800EB5C` 20/21.

This rules out applying a single region in isolation as a score-improving edit,
but it does not rule out the row-binding granularity.  The next pass should use
`experiment_D0F4.c` as the template and convert a complete cross-jump family
before taking another configured verdict.  In particular, keep `CELL_ROW`
statement-local: the simpler inline row-value macro CSEs adjacent cell
addresses and collapses too far, repeating the already measured short-candidate
failure mode.
