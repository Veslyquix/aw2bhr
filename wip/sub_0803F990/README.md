# sub_0803F990

0x0803F990, 664 bytes, THUMB, parked.

Best score so far: 99.5% (best.c).

## Files

- `sub_0803F990.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

99.5% identical, SIZE-EXACT 664/664, 3 bytes at +0x75/+0x78/+0x7A (configured). Waves 77 (W77-B) and 86 (W86-B). Status was `asm` (never parked) until wave 86; the record lived only in the draft header.

### What still differs

In ONE loop the -fforce-addr base of gUnknown_03003150 and the scaled index (s16)i*4 SWAP HOMES (r0/r1): loop-top ldr Rd, asrs Rd, adds Rn/Rm. Same four instructions, same sequence. Both are compiler temps with no source construct behind either.

### Why it is close

Everything else is byte-exact. The flags/raw `register asm` pins in the draft are LOAD-BEARING (dropping them costs 107 bytes); the `record` pin is byte-neutral.

### Already ruled out

- W77-B (configured): every source addend order (&g[i], g + i, i + g, (T*)((int)g + i*4)) is byte-neutral at 3; (T*)(i*4 + (int)g) is worse at 7; an `off = i * 4;` local is 7; register asm on the base or the index is catastrophic (489/493 bytes, 26%) -- an extra fixed register inside the loop reruns global allocation for the whole body.
- W86-B: the W83 live-range-split lever (a live narrow copy of i, three placements: before the loop, at the loop top, before the first use) is REFUTED -- 94.0% / 29.2% / 26.8%, all worse. Mechanism: a split re-ranks only when the ORIGINAL pseudo DIES at the copy; i is the loop counter, kept live by the for-increment and exit test, so the copy ADDS a pseudo inside a loop already carrying the base, i*4, record, x, y, w, h and two pinned registers.
- tools/permute.py CANNOT RUN on this draft: it aborts on the load-bearing register-asm locals. Not a negative about the permuter axis.
- W81-E: all seven compiler profiles measured, no flip.

### Why it is parked

Residual kind 3 (allocation), a two-temp home swap with nothing behind it. Callee exemplar src/decomp/c_0803FC28.c. Full record: work/sub_0803F990/sub_0803F990.c header and work/sub_0803F990/W86-notes.md.
