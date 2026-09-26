# sub_08031824

0x08031824, 292 bytes, THUMB, parked.

Best score so far: 97.3%.

## Files

- `sub_08031824.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

97.3% -- work/sub_08031824/sub_08031824.c (== w90-start.c == best.c)

### What still differs

Three register picks. Loop 1's `mov r0, r8` (ROM r1); `ldr r0, =gUnknown_020280C0; mov sl, r0` (ROM r1); the copy setup's `ldr r1` pair (ROM r3). The instruction stream is otherwise the ROM's.

### Why it is close

All three picks are RELOAD spill registers, not local_alloc choices: the .greg dump prints `Spilling for insn N. Spilling reg 0.` at each (a hi-reg pseudo, p in r8 or c in sl, needs a lo register for one insn). reload1.c find_reg takes the lowest spill_cost and breaks ties by REG_ALLOC_ORDER, which starts at r0. The ROM's r1/r3 mean some pseudo allocated to r0 (and r1/r2 at the third) was live across those insns in the original.

### Already ruled out

- Descending else-arm loop written by hand (W88): keeps the init in the source-bind slot; the source loop is ascending and check_dbra_loop reverses it (W89-B)
- One tail local for both ldrb values (W89-B): the ROM has two locals v and v2
- Permuter, old scorer: two chained 300 s runs, ~30.6k it (W89-B); the second found nothing past 97.3%
- Permuter, fixed scorer (PENALTY_REGALLOC 60, --stack-diffs): undirected 900 s 11,049 it and directed 900 s 10,679 it (LINESWAP over all 14 declarations + RANDOMIZE over the prologue and the 5-byte copy setup; w90-directed.perm.txt), both nothing better than 480 (W90-A)

### Settled

- The else arm is an ascending loop that gcc reverses; the if arm is not reversed because its biv feeds two givs (W89-B)
- `v = (v2 = sub_0803CD14(k));` is the 97.3% step (W89-B permuter)
- The residual picks are reload spill registers chosen by find_reg; the lever is which pseudos are live across those three insns, not how the insns are spelled (W90-A, .greg dump)

### Why it is parked

Parked in wave 90 (W90-A) after W88, W89 and W90 worked it. Four permuter runs across both scorers (~52k iterations) never moved the three reload picks. Notes: work/sub_08031824/W88-notes.md, W89-notes.md, W90-notes.md.

### Wave 90

W90-A: unchanged 97.3%/8 bytes. The fixed-objective permuter found nothing in 2 x 900 s (11,049 undirected, 10,679 directed). The .greg dump shows that the three residual picks W88/W89 called bare local_alloc scratch picks are reload spill registers (find_reg: spill_cost, then REG_ALLOC_ORDER from r0). The next attempt should make a pseudo that lives in r0 stay live across loop 1's r8 read, the gUnknown_020280C0 bind, and the copy setup.
