# sub_080029F4

0x080029F4, 188 bytes, THUMB, parked.

Best score so far: 51.6% (best.c).

## Files

- `sub_080029F4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

51.6% identical, candidate 176 bytes (-12), 5 missing instructions

### What still differs

One expression. The ROM computes the a1 != 0 destination UNFOLDED in the merge block after the a4 == 0x19 join -- subs r1,r6,#1 / lsls r1,r1,#3 / movs r2,#0xa3 / lsls r2,r2,#2 / adds r1,r1,r2 / lsls r1,r1,#5 / ldr r2,=0x06010000 / adds r1,r1,r2, i.e. ((a1-1)*8 + 0x28C)*32 + 0x06010000 with every step separate. agbcc folds the whole chain to lsls r1,r6,#8 / ldr r2,=0x06015080 / adds. Everything else in the function is byte-identical; the diff's other hunks are offset shifts caused by the 12 missing bytes.

### Why it is close

Shape, arity (six parameters, a5 at [sp,#0x14] and a6 at [sp,#0x18]), branch polarities, pool layout and tail are all settled and byte-exact.

### Already ruled out

- Wave 52: four spellings of the expression -- * 8; << 3 instead (the wave-16 MULT-is-not-a-shift rule does not apply, both fold); the index as its own statement; the index as three separate statements. All produce the identical folded output.
- Wave 57: a STATEMENT boundary is not a fold barrier, only a real BASIC BLOCK boundary is -- and a barrier is needed at TWO joints, since even when split (a1-1)*8 + 0x28C still collapses to a1*8 + 0x284. The ROM has all eight instructions in ONE merge block, which no arrangement of C statements produces.
- Wave 59 (W59-A): THE TOOLCHAIN. A throwaway data/compiler-overrides.json entry with cc1 old_agbcc and -fprologue-bugfix removed gives byte-for-byte IDENTICAL output -- still 176 bytes / 51.6%, same lsls r1,r6,#8, same 0x06015080 pool word. This was the top-ranked remaining axis and the first override probe ever screened on a FOLD rather than on an address range or a call-in-loop. Entry reverted with git checkout.
- Wave 59 (W59-A): GIVING BOTH INTERMEDIATES A SECOND USE, using the dead-loop vehicle that matched sub_080079B8 (which pins a value through combine and leaves no code behind). Applied at both joints: byte-for-byte identical, not one instruction moved. THE PREMISE WAS WRONG -- the fold is done by cse, NOT by combine. cse works on value numbers and does not care how many uses an intermediate has, which is exactly why statement boundaries never helped and a block boundary does (cse resets its table at a label). Do not spend another attempt on reference counts.

### Notes

No ranked axis remains. Genuine 'compiler output we cannot spell'. Wave 59 (W59-A).

### Wave 87

WAVE 87 (W87-E): WAVE 59'S CENTRAL FINDING IS REFUTED -- the fold is COMBINE's and it IS use-count sensitive. Staging the chain through four distinct int locals and giving EACH a surviving second use produces the ROM's eight instructions in the ROM's order in the single merge block on the first probe (work/sub_080029F4/w87-probe-h-exact-chain.c), including the `movs #0xa3 / lsls #2` materialisation of 0x28C; the only extra code is the four pins (a volatile local sink survives flow and works at 4 bytes per pin). Also measured: two definitions of one local that are two EXPRESSIONS of the same value agree by the time cse sees them and the chain collapses (a W81-C 'disagreement' must differ in VALUE); `u32` for the whole chain byte-identical to `int`; each step in its own `static inline` helper (W87-B lever) folds; a store to a dead local / dead loop / `(void)t;` are deleted by flow BEFORE combine. Draft unchanged (176/188, 51.6%), 0 try_match. The open question is now exact: find a second USE of the intermediates that costs no instruction -- (1) a use the ROM ALSO has that the draft attributes to another expression (re-read the a1 == 0 arm's 0x06014BC0 / index 0x25E and the tail's gUnknown_08485D68[a1] for a shared subexpression); (2) a second use across the `if (a1 == 0)` branch where combine cannot reach and flow cannot delete; (3) the third argument of sub_08011E54 is 0x100 in both arms yet the ROM materialises it as `movs r2,#0x80 / lsls r2,#1` at BOTH sites -- the signature of a shared non-constant expression.
