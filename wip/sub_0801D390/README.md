# sub_0801D390

0x0801D390, 856 bytes, THUMB, parked.

Best score so far: 63.0% (best.c).

## Files

- `sub_0801D390.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

PARKED at 800/856 (-56). The W56-H/W71 loop-top mask residual is SOLVED by the sub_0801DCD4 spellings (re-read *p, no cmd local; (u16)((s16)*p & ~0xfff) in an int). The remaining gap is global-alloc order: the ROM has p=r7, e=r8, and the 0x6000 arg copy in r6. See docs/agbcc-codegen.md, "sub_0801D390's remaining residual".
