# sub_0800CFDC

0x0800CFDC, 6384 bytes, THUMB, parked.

Best score so far: 19.1%, -4 bytes (best.c).

## Files

- `sub_0800CFDC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

14.3% positional identity, 6368 bytes against 6384 (-16). The complete candidate has exact EAF4 (6), EB5C (21), total-call (36), and bridge-predicate (159) counts; configured verification and the Wave 69 reconciled sweep both return a real source mismatch, first byte +0x23.

### What still differs

Aggregate rowOffset[] indexing removed the old over-materialisation and fixed the first E8CC allocation. The active candidate now has 327 ldrh against target 325 (+2), 672 add/adds against 663 (+9), and 436 lsl against 432 (+4), while all call and bridge counts are exact. The first structural mismatch is the entry zero temporary in r3 versus ROM r0. D0F4 is 120/124 bytes: only the ROM's allocator-generated high-register add/post-load copy chain remains. A DC32 rewrite removes its two duplicated ldrh/add/lsl chains exactly, but its whole-function composition changes cross-jump layout and becomes 36 bytes short.

### Why it is close

Every semantic region is written, all cases and neighbours are traced, and Waves 68-69 reduced the complete draft by 180 net bytes from 6532 to 6368. Aggregate typing, DC32's flat exception, E336's sparse-switch order, and D0F4's u32 lifetime now explain the dominant compiler mechanisms. work/sub_0800CFDC carries the active draft, the original checkpoint_6532 and Wave 69 6360 snapshots, exact region findings, and bounded experiment artifacts.

### Already ruled out

- The two casesi jump tables and their source order -- already exact.
- The -fforce-addr head route -- the honest gUnknown_08499590 spelling produces the ROM's three-level load and is exact through +0x34.
- Fully inline access: 5056 bytes (-1328); it CSEs far more row/cell arithmetic than the ROM.
- Conditional row macro: 7356 bytes (+972); it materialises too much.
- Persistent y*2 inline form: 5208 bytes (-1176); still over-CSE'd.
- Statement-local cell offset: 6060 bytes (-324); closer but still collapses too many row loads.
- Row-index plus row-offset locals: 6532 bytes (+148), the strongest complete checkpoint.
- A bounded _0800D0F4 CELL_ROW experiment: 6544 bytes (+160), 13.50%. It restored the local EAF4 call (6/6) and improved add count by one, but applying the shape to one region alone broke a cross-jump family and regressed twelve bytes.
- Aggregate rowOffset[] member indexing is load-bearing, not a cosmetic type: the pure aggregate probe compiled to 6328 (-56), fixed the initial r8 allocation, and restored 159/159 bridges, but over-unmerged EB5C to 22/21.
- DC32-only flat row arithmetic is the exact cross-jump exception. It reduces the aggregate candidate to EB5C 21/21 while retaining all 159 bridges; broad flat fallbacks over-merge to EB5C 20 and lose a bridge.
- Five entry/first-switch declaration, scope, zero-temporary, assignment-placement, and branch-inversion probes could not produce movs r0; mov sl,r0. Lexical forms were byte-neutral and CFG forms regressed allocation.
- E336 source case order 0x27, 0x67, then 0x24/0x25 restores the ROM's sparse decision tree and grows the 6336 checkpoint by exactly 24 bytes. Other measured case orders ranged from 6340 to 6364 and emitted different trees/pools.
- A volatile two-step E336 y+1 row reload emits exactly +1 ldrh/+2 adds with no lsl, call, or bridge changes, but combining it with the remaining sparse switches is still globally short because cross-jumping is non-additive.
- Sparse switches at five DAC6/DC32/DE3A range sites remove exactly six adds and five shifts with calls/bridges unchanged. The 6352 structurally faithful artifact scored lower positionally than the active 6360 checkpoint, so both are preserved.
- D0F4 statement-local u32 staging improves the retained candidate from 6360 to 6368 and reproduces the ROM's ip/sb/r9 setup. Embedded compound assignment, byte-pointer, volatile, and fixed-register forms did not recover the remaining four-byte high-register add/post-load chain without regressing entry allocation.
- The Wave 69 DC32 rows-2/rows-3 binding removes exactly two ldrh/add/lsl reload chains with EB5C and bridges unchanged. Combined with the faithful sparse-switch and D0F4 shapes it reaches exact ldrh count at 6348, but non-additive cross-jumping removes three extra shifts and twelve bytes.
- DFB4 row-plus-one binding is byte-neutral, and configured/default/no-force/old-agbcc profiles are identical; O1 is substantially larger.
- Wave 70 split-value and signed-first D0F4 lifetime probes are byte-neutral. They do not recover the ROM's high-register add/post-load copy chain.
- Wave 70 DC32 both-arm binding reaches 6388 but emits EB5C 22; binding only the 0x67 arm reaches 6392 with EB5C 22; binding only the 0x64/0x65 arm reaches 6364 with EB5C 21.
- An explicit DC32 shared goto tail reaches 6380/6384 (-4), 19.1%, with all 36 calls exact, but emits 160 bridge predicates against ROM 159. A boolean shared-tail form is 6392 and also emits 160. Both are diagnostics, not admissible canonical drafts.
- The four `bl _0800E8BA` sites are agbcc far jumps to the epilogue, not calls or a second entry point.

### Settled

- The complete top-level and all roughly twenty pattern regions are transcribed; there are no #if 0 blocks or placeholders.
- The parameter pair is (int x, int y), and the four callees are int sub_0800E8CC(int,int), int sub_0800E9F4(int,int), void sub_0800EAF4(int,int), and void sub_0800EB5C(int,int).
- The ten expression shapes and all neighbour constants come from the rebuilt predecessor-joined _symtrace rather than guesswork.
- Binding granularity must be changed for a complete cross-jump family at a time; a single-region experiment is not a valid global score.
- The map's row table is an aggregate member, DC32 is the one measured flat-index exception, and E336 is a sparse switch ordered 0x27, 0x67, then 0x24/0x25.
- All EAF4, EB5C, and bridge predicates are now present in the emitted candidate; the residual is compiler allocation, arithmetic spelling, and block layout rather than missing source semantics.

### Open question

Find one lifetime spelling that gives D0F4's target-only high-register add/post-load copy chain and the entry r0 zero lifetime. Then compose the already-proven DC32 reload removal with a compensating block-layout lever so its three lost shifts remain emitted; do not revisit call or bridge transcription.

### Why it is parked

Waves 68-70 removed the broad row-binding blocker and reduced the complete candidate from +148 to -16 while making every call and bridge count exact. Wave 70 reached a four-byte-short CFG only by adding a non-ROM bridge predicate, proving that the apparent size win is not composable. It remains parked because the final bytes are coupled compiler allocation and cross-jump/layout decisions; no semantic transcription remains.

### Park kind

TYPE/CSE AND BASIC-BLOCK LAYOUT RESIDUAL, NOT MISSING SEMANTICS

### Budget unit

Budget the next pass by the two coupled allocation/layout seams (entry plus D0F4, then DC32 cross-jump compensation), not by whole-function score or individual predicates. Preserve the active 6368 checkpoint, Wave 69's 6360 snapshot, and the structurally faithful 6352 switch artifact before probing.
