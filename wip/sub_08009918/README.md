# sub_08009918

0x08009918, 544 bytes, THUMB, parked.

Best score so far: 93.9% (preprocessed form, not included).

## Files

- `sub_08009918.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

STALE RECORD -- RE-MEASURE BEFORE USING ANY OF IT (wave 77, W77-I). The wave-37 record below describes a 542-of-544-byte draft with a two-byte register-allocation inversion confined to the y-branch. THAT DRAFT IS GONE. work/sub_08009918/sub_08009918.c now measures 540 bytes, 61.2% identical, first difference at +0x34, and diverges structurally -- it emits a three-level load (ldr / ldr / ldrh) where the two-level gUnknown_08499590 read belongs (the global is `extern u8 *gUnknown_08499590;`). best.c is 143 KB of permuter-expanded headers, so there is no hand file to recover the described draft from; the likely cause is the documented hazard that a losing try_match submission overwrites the active draft. RULED OUT this wave, and it was the wave-37 record's own NEXT STEP: hoisting `cnt` to function scope to raise its allocno priority above `rows` is WORSE, losing a further 4 bytes. WAVE-37 RECORD, kept because the structural findings are still believed good but NONE of it has been re-verified: this is sub_0800977C's twin (src/decomp/c_0800977C.c is the exemplar); `ok = sub_08009CF8(x, y) != 0;` gives the ROM's `rsbs; orrs; lsrs #0x1f`; `cnt` must be declared ONCE at the `terrain == 0xC` block scope (per-arm declarations give two pseudos and the shared `adds r6,#1; cmp r6,#1; ble` tail at _08009B06 is duplicated into the x-arm instead of cross-jumped); each row offset must be bound as its own statement (`t2 = (y-1)*2;`, `t3 = (y+1)*2;`) or CSE finds the common `rows + y*2`; and `off = idx * 2;` must precede `tiles = p + 0xA22;`. The wave-37 residual was: the ROM keeps `rows` in r3 and spills the CELLS POINTER to r8 while holding `cnt` in r6, the candidate has `cnt` in r3 and keeps `rows` in r8 -- the ROM under one more unit of low-register pressure. NEXT STEP: rebuild the draft to the wave-37 description and re-measure BEFORE trying any allocation lever. Needs "rodata": ["0x0808D820"] on promotion.
