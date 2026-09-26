# sub_08062C94

0x08062C94, 348 bytes, THUMB, parked.

Best score so far: 93.7% (best.c).

## Files

- `sub_08062C94.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

93.7% identical, SIZE-EXACT 348/348, 22 bytes, first difference +0x11 (configured). Waves 77 (W77-B), 79 (W79-E), 86 (W86-B). Status was `asm` (never parked) until wave 86.

### What still differs

Sixteen of the 22 bytes are a systematic renumbering: r3/r4 exchanged at +0x11..+0x25 and an r5-r7-r6 rotation at +0x101..+0x13B. The remaining 6 bytes at +0x18..+0x1D are one moved store (draft emits `strh rX,[r1]` before `ldrh r0,[r2]`, ROM after) which W79-E proved is COUPLED to the `(u = 0)` lever and cannot be fixed on its own.

### Why it is close

Instruction multiset exact; the volatile table model (struct Unk62C94Tab { volatile u16 v[0x19]; } over gUnknown_02029C20) and the stack twin loc[] are settled; the wave-47 dead load before every volatile store is reproduced.

### Already ruled out

- W79-E: the first loop's statement order, three spellings against the 93.7% draft -- chained `loc[i] = TAB->v[i] = 0;` regresses (fourth pool word, alignment short); volatile-store-first with `(u = 0)` dropped is 85.9%; volatile-store-first with `(u = 0)` kept is 352 bytes / 13.8%. `(u = 0)` only works while the stack store is the FIRST statement. DO NOT re-probe the first loop's order.
- W86-B: the W83 live-range-split lever on BOTH ties (r3/r4 and r5-r7-r6) is REFUTED -- 62.9% and 9.5%; both copy sources are loop counters, so nothing is split. A split aimed at the THIRD loop moved the first difference EARLIER into the first loop: in a multi-tie function a split cannot be aimed at one tie.
- W81-E: all seven profiles measured, no flip.
- Permuter: run (best.c 1513 B is its output); ceiling unmoved.

### Why it is parked

Residual kind 3 (allocation): a coupled r3/r4 + r5-r7-r6 rotation with nothing behind it. Full record: work/sub_08062C94/sub_08062C94.c header, NOTES.md and W86-notes.md.
