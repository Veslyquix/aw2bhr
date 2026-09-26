# sub_0808A3DC

0x0808A3DC, 160 bytes, THUMB, parked.

Best score so far: 60.0% (best.c).

## What it does

Builds a BG screen from compressed data. It clears the tilemap buffer, decompresses the tile graphics into VRAM and the tilemap into the buffer, adds a tile and palette offset (0x1020) to every entry, and copies the finished map to the BG's screen block.

## How close it is

Measured with the settings the neighbouring flash code uses (-O1, force-addr off; no override entry yet): right size (160 bytes), 55.6% of bytes match, differing from the first instruction because the original saves two more registers. The one real difference: the original reaches gUnknown_0849957C and gUnknown_03001FE8 through this function's own compiler-made address words (one more load each) and holds the word addresses in saved registers, where the draft reaches the globals directly.

## What is left

Make the code use those address words: the compiler builds them under every spelling tried but leaves them unused. Untested idea: the ROM words from 0x08499578 on are a table of EWRAM buffer pointers 0x800 apart and gUnknown_0849957C is its second entry, so reading it as element 1 of an array at 0x08499578 would make the table's address the value used, the only case in which such words have been seen in use.

## Already tried

- Default -O2 and the older compiler: worse (the older compiler 71 against 64 differing bytes at -O2).
- A plain u16 fill value instead of volatile: the compiler computes the stack address once where the original computes it twice.
- Non-volatile element access in the loop: 12 bytes too long (172).
- `*(u16 **)&gUnknown_0849957C` at every use: fixes the pool word order but is still one load short.
- Binding both addresses to local pointers: the original's register use, but 4 bytes short (22.5%).
- Mixing a bound local and the plain name: the address word is still built and ignored.

## Files

- `sub_0808A3DC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

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

</details>
