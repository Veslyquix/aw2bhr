# sub_0805DCD4

0x0805DCD4, 740 bytes, THUMB, parked.

Best score so far: 67.7% (preprocessed form, not included).

## Files

- `sub_0805DCD4.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

47.6% draft (code +4, section -4), first difference +0x1f; best.c (permuter-expanded blob) 67.7% (configured). Waves 55 (W55-C/F), 66 (W66-M), 76, 86 (W86-D). Status was `asm` (never parked) until wave 86.

### What still differs

Per the draft header: the ROM keeps BOTH 0x417A and 0x376A in registers across the second loop body; the draft keeps only 0x417A, so it has a spare callee-saved register and parks &gUnknown_08499590 there where the ROM does not. Read the draft header for the full hunk list.

### Why it is close

Two-scan search; both scans, the calls (sub_0801FD9C, sub_080202A4, sub_0805D648) and the pool are right. Twin by vocabulary: sub_0805E87C (src/decomp/c_0805E87C.c), a same-vocabulary neighbour, NOT a shape twin (352B single scan).

### Already ruled out

- W66-M and W86-D, two independent measurements: BINDING A BASE (the +0x12 base in wave 66; the 0x376A base to a pointer local live across the loop, c_0805E87C's construct, in wave 86) is a pressure-REDUCING construct here -- the bound pointer collapses the two re-spelled member accesses into one register, the loop needs FEWER live values, and another pool word drops (-4 -> -8; restored). Stop trying to ADD pressure by binding things: every binding lever available reduces it. If the ROM's allocation really is the more expensive one, the extra live value must come from a value genuinely USED twice in the second loop, not from an alias of one used once.
- Permuter run (best.c is its output; 67.7%, contaminated -- do not adopt).
- W81-E: all seven profiles measured, no flip.

### Why it is parked

Residual kind 3 (register pressure, one live value the ROM has and the draft does not). Full record: work/sub_0805DCD4/sub_0805DCD4.c header and W86-notes.md.
