# sub_08060DAC

0x08060DAC, 296 bytes, THUMB, parked.

Best score so far: 73.0% (preprocessed form, not included).

## Files

- `sub_08060DAC.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Draft 50.0% (positional; first difference in the prologue push mask), SIZE-EXACT 296/296; best.c (permuter-expanded blob) 73.0%, first difference +0xe (configured). Waves 63 (permuter), 85 and 86 (W86-A). Status was `asm` (never parked) until wave 86.

### What still differs

The ROM holds FIVE loop-invariant values in registers, the draft FOUR: ROM sl=0x417A (pool word, loaded once), ip=0x1f (`movs r0,#0x1f; mov ip,r0` once, `mov r0,ip` at the second use), sb=gUnknown_085767F2, r8=&gUnknown_085766E4, r3=&gUnknown_08499590 kept in a LOW register across the if-body, frame 0xc with &gUnknown_085766E4[n] spilled to sp+8. Draft: sl=&gUnknown_08499590, ip=0x417A, r9=gUnknown_085767F2, r8=&gUnknown_085766E4, 0x1f rematerialised twice, frame 8. The halves balance (movs #imm and mov rN,ip are both 2 B).

### Why it is close

Every instruction, branch, both map-plane reads, both terrain lookups and the store block are in the right order; pool order matches (0x417a, gUnknown_085767F2, 0x1432). The `t = y*2; rows = p + 0x417a;` ordering, the guard's separate `cells` local vs the store block's in-place `p += 0x1432; p += off;`, the genuine recomputation of the terrain expression in the store block (the strb may alias the map) and `flags = p + 0x12` after `off` are all SETTLED -- see the draft header and src/decomp/c_0805AD90.c.

### Already ruled out

- Draft header (wave 63): no `t` local (operands swap); `cells` bound before the table (wrong pool order); the draft's order is the only one giving the ROM's pool.
- W86-A: the W81-C reading ('a second local whose definitions disagree by value' for the 0x1f mask) REFUTED -- ip is already occupied by 0x417A in the draft and by 0x1f in the ROM; no second definition changes which constant wins ip. Two independent FULL-LENGTH permuter chains (wave 85 and W86-A from best.c) end at the same 73.0% ceiling.
- W81-E: all seven profiles measured, no flip.

### Why it is parked

Residual kind 3 (allocation): the ip/sl/low-register assignment of {0x1f, 0x417A, &gUnknown_08499590} -- a bare coupled choice with no source construct behind it. Full record: work/sub_08060DAC/sub_08060DAC.c header and W86-notes.md.
