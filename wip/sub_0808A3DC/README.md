# sub_0808A3DC

0x0808A3DC, 160 bytes, THUMB, parked.

Best score so far: 60.0% (best.c).

## Files

- `sub_0808A3DC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

60.0% (wave 46, W46-D then W46-I)

### What still differs

First difference at +0xa. Calls CpuFastSet, CpuSet and Decompress -- all hub callees with settled prototypes, so the residual is not a prototype problem. The usual trap in this shape is the CpuSet/CpuFastSet mode word (count OR'd with the fill/copy flag), which is a constant expression at the call site.

### Already ruled out

TOOLCHAIN AXIS RULED OUT (wave 46, W46-I): the candidate C was held constant and compiled under five configurations -- default, -fprologue-bugfix off, -fforce-addr off, old_agbcc, and old_agbcc + no force-addr -- with .text compared against work/<fn>/_target.bin each time. old_agbcc is byte-for-byte IDENTICAL to the default on sub_0808AAF4 and sub_0808AC7C (it does not change one instruction) and is strictly WORSE on sub_0808A3DC (64 -> 71 differing bytes). Dropping -fforce-addr is worse on three of four. The wave-46 brief predicted this block needed old_agbcc on the strength of compiler-overrides.json's 'the sound and flash libraries came out of the SDK prebuilt with their own settings' plus four of six functions differing at +0x0; that prediction is REFUTED. Do not re-run it. Full table in docs/agbcc-codegen.md, 'The flash driver at 0x0808A000 is NOT a toolchain-axis block'. This is the function old_agbcc makes strictly WORSE (64 -> 71 differing bytes), which is the strongest single piece of evidence against the axis for this block.

### Wave 60 o1

WAVE 60: MEASURED AT -O1, WHICH IS THE CORRECT CONFIGURATION FOR THIS BLOCK. The flash library is -O1, established this wave by nine byte-for-byte matches across 0x0808A3DC-0x0808B91C with no source change (see data/compiler-overrides.json). EVERY SCORE AND EVERY RULED-OUT AXIS RECORDED HERE BEFORE WAVE 60 WAS MEASURED AT -O2 AND IS THEREFORE INVERTED EVIDENCE, NOT WEAK EVIDENCE -- do not trust the axes above. This function has NO override entry, because the project's standard for that file is a byte-for-byte match under the named configuration and this is not one yet. To work it, add a throwaway entry {"cflags_remove": ["-O2"], "cflags_add": ["-O1"]} and remove it if it does not close. -O1 score at the end of wave 60: 60.0%, size-exact, first difference at +0x0.

### Wave 88

WAVE 88 (W88-A then W88-D): the brief's 60.0% was stale; current is 55.6% size-exact under BOTH `o1` and `o1-no-force`. Residual isolated to the address-constant indirection. Wave-60 note REFUTED: agbcc builds the two-level `.rodata` block every time and leaves it dead; a load-base use never triggers the indirection at any count, only an address VALUE does -- and (W88-D) the doc's mixed-spelling rule is a PRESERVATION rule, not a creation rule: the ROM's mixed shape still emits .LC0 and ignores it. Settled from data/promoted.json: the function's two words are the gap between c_08089C14.c's and c_0808A978.c's carved blocks in a run of seven, so they are compiler-generated and must NOT be declared as variables. Evidence: work/sub_0808A3DC/W88-notes.md.
