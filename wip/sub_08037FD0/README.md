# sub_08037FD0

0x08037FD0, 496 bytes, THUMB, parked.

Best score so far: 96.8%.

## Files

- `sub_08037FD0.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED wave 79 (W79-A), carried from waves 56/71. SIZE-EXACT 496/496 at 96.8%, 16 differing bytes, first at +0x188 -- RE-MEASURED in wave 79, the figure is current. THE RESIDUAL IS ONE COALESCING DECISION IN THE gUnknown_03003FC0.unk32 != 0 TAIL and nothing else: the ROM loads d into r1 and pays adds r0,r1,#0 to hand it to sub_08037F94 while loading c straight into r0; the candidate does the exact opposite. The two copies cancel, which is why the size still matches. WAVE 79 RULED OUT, do not re-derive: (1) inverting the two tested arms into if (a != 0) { if (c != 0) ... } else if (d != 0) ... -- 96.4%, two bytes WORSE, same residual; (2) flattening them into two independent if (a == 0 && d != 0) / if (a != 0 && c != 0) statements -- 96.8%, byte-identical to the draft, so the arm nesting is not the lever; (3) the wave-79 register-pinning lever that closed sub_080815C0, sub_08028EF0 and sub_0807EEEC -- a block-scoped register int dd asm("r1") copy of d and a register int cc asm("r0") copy of c BOTH regress to -4 bytes at 83.1% and 82.7%, because pinning a value that lives in a stack slot forces the whole switch layout to move. This is the wave-66 residual class 4: which of two identical predecessors of a cross-jumped call block gets the coalesced load. Permuter history is exhausted. The four levers recorded in the drafts header comment (int m with (u8) casts at each use, the chained a = b = c = d = 0;, the do { } while (0); before flag = 1;, and the bare break with one trailing call) are all still load-bearing -- keep the draft, do not rewrite it. W81-B: giving c and d INDEPENDENT definitions in the switch (c = (u8)m instead of c = a; d = (u8)m instead of d = b) is BYTE-IDENTICAL to the draft, same residual +0x188 -- the defining pseudo of neither value is the lever. Swapping the declaration order (int d; int c;) regresses to 95.0% with first difference moving to +0x9c because it reorders the stack slots themselves. Park stands. W83-C ran the textual-dependency lever literally: case 2 spells d = (c, b) -- compiles clean, values identical, but the tail restructures WORSE (an extra unconditional b into the call block and the gUnknown_03003FC0 literal moving down 4); coalescing does not follow def-site textual dependency either. Attempt reverted, draft restored.

WAVE 84 (W84-B): an explicit-dd hand-off temp at the d-arm call is NULL on the coalescing axis (d still loads straight to r0; only cosmetic pool-relocation shifts). Chained permuter from clean best.c halved internal textual scores but promoted NOTHING -- every win normalised to zero byte difference (best.json unchanged at 96.77%). Canonical verdict re-measured post-experiments unchanged.

WAVE 88 (W88-A): both remaining wave-87 mechanisms REFUTED and exactly byte-neutral -- (a) a `static inline` helper around the call-argument expression, (b) bind-both in source order in the gUnknown_03003FC0.unk32 tail. Draft restored to the wave-79 fixpoint and re-verified at 96.8%. That is FOUR consecutive byte-neutral axes (waves 79, 81, 83, 88): RETIRED from the batchable pool -- do not schedule without a lever whose reachable set provably includes a cross-jumped call block's coalesced predecessor load. Evidence: work/sub_08037FD0/W88-notes.md.
