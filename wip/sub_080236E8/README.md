# sub_080236E8

0x080236E8, 316 bytes, THUMB, parked.

Best score so far: 79.8% (best.c).

## Files

- `sub_080236E8.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED Wave 71 at exact size 316/316, 68.0%. The sole structural residual is low-half truncation scheduling and its register permutation. Operand order, casts, scalar split statements and key-width variants are ruled out; the aggregate-pair hypothesis did not close. WAVE 81 (D): include/unknown-globals.h de-consts gUnknown_08499C7C (see the wave-81 comment there; promoted sub_0802361C, sub_08023860 and sub_0800105C re-verified exit 0 under it). This draft improves 68.0% -> 76.3% (still size-exact, first difference +0xe); the aggregate-pair lead is open again under the corrected allocation and is cheaper to test now than the old scheduling notes suggest. WAVE 82 (W82-B): THE AGGREGATE-PAIR LEAD AS TESTED IS DEAD IN TWO FORMS. (a) The single-expression packing next = (u16)(lo) | ((u16)(hi) << 16) is BYTE-IDENTICAL to the kept two-statement spelling (measured on the full function). (b) Swapped operand order next = ((u16)(hi) << 16) | (u16)(lo) is worse everywhere: hi computed first, guard/tail registers permuted further, pool grows (.word addend hops), still size-exact but lower-scoring. Surviving observation from target.s: ROM order is [x add][x lsl16][y add][y lsl16][x lsr16][orr] -- truncation of the FIRST sum deferred past the SECOND sum entirely; no statement-boundary or expression-order spelling reached it. The untested form remains a true SImode-aggregate/member-store pair as sub_08024F20 builds one. WAVE 83 (W83-A): THE AGGREGATE/PAIR LEAD IS NOW MEASURED AND DEAD IN EVERY FORM -- it reproduces the deferred order but ALWAYS spills. (a) two unsigned-long locals px/py assigned each sum left-shifted by 16 then next=(px>>16)|py; (b) reuse of the existing int k/n locals with unsigned widening at the single use next=((unsigned long)k>>16)|(unsigned long)n. BOTH give [x add][lsl16 whole][y add][lsl16][lsr16 of x-prod][orr] EXACTLY, but both add add-sp-4/str-map-[sp] traffic -- holding the un-narrowed x-product across y raises pressure one register over and the map pointer becomes overflow victim; target.s contains ZERO sp references (frame clean). The kept draft avoids the spill only by narrowing x immediately. Also: every wide-typed sum spelling emits movs-rN-0 / ldrsh-[rA,rN] zero-index signed reads for gUnknown_08499C7C[dir][n]; the ROM reads plain ldrh, so any candidate must keep those reads u16-narrowed -- but u16-bounded sums let combine fold the shifts back to the early truncation. The tension is now precise: deferral needs an unbounded sum, no-spill needs the register the narrow saves. Untested idea for next time: a u16-typed ALIAS view of gUnknown_08499C7C (new extern name or struct cast, NOT touching the shared extern s16 decl) plus the px/py form.

WAVE 84 (W84-B): the alias-view axis is DEAD -- dual-typed views (u16 (*)[2] / s16 (*)[2]) into gUnknown_08499C7C measure 304B (-12) with 258/316 differing: register-held merged bases eliminate the ROM's repeated pool-word double-loads. Three chained shell-run permute rounds improved the draft 76.27 -> 78.2 -> 79.4 -> 79.75% (64/316 differ, still size-exact 316/316); the round-3 candidate was adopted verbatim (statement-level n before |=, do{}while(0) wrappers, (&gUnknown_030032C4)->unkNN spellings) and independently byte-verified. CHAIN NOT EXHAUSTED.
