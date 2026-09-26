# sub_0800F8D4

0x0800F8D4, 1136 bytes, THUMB, parked.

Best score so far: 11.3% (best.c).

## Files

- `sub_0800F8D4.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft

## What has been tried

From `data/parked.json`.

### Best so far

11.3% identical, 1276 bytes against 1136 (+140). Two rounds: 6.2% then 11.3%.

### What still differs

The candidate needs SIX callee-saved registers where the ROM needs five: `mov r7,sl; mov r6,sb; push {r6,r7}` against the ROM's `mov r7,r8; push {r7}`, and the extra spill/reload is the whole +140 bytes. The ROM keeps exactly three things live across the body -- `ip` = the address of this unit's -fforce-addr pool word, r5 = x, r4 = y. Instruction streams otherwise line up: same compare chains, same constant chain, same four pool words, same branch structure.

### Why it is close

Zero callees and one data ref, so nothing in it depends on an unsettled prototype or global. The control-flow skeleton is fully derived: a 14-term dispatch on the centre cell, then six branches (322|354, 323|355, 353, 321, 352, 320), each two bounds guards plus two 7-term neighbour chains. The cell access is src/decomp/c_08001158.c's idiom. What moved the score from 6.2% to 11.3% was TWO things and both are recorded in the draft: fixing a transcription error in branch 322|354's second chain (`289, 288`, not `259, 258`) and splitting the value types (`u16` for the neighbour cell, `int` for the centre one).

### Already ruled out

- function-scope p/rows/tiles/t/off shared by all 13 accesses -- 608 instructions against the ROM's 544, worse than block-scoping
- the same five bound in a BLOCK per access -- 600, and what the draft carries
- `n` block-scoped per branch rather than function-scope -- byte-neutral, so `n` is NOT the extra live value
- c_local `pp = &gUnknown_08499590` with `*pp` at each access -- 574 instructions, the BEST count seen and WRONG: it emits two indirections where the ROM has three, i.e. it buys 26 instructions by dropping a level of the pointer model
- declaring the pool word as `u8 **const gUnknown_0808D898` and dereferencing it -- 602 and FOUR indirections, because agbcc force-addrs the declared symbol's address on top. Do not declare the pool word; the honest `gUnknown_08499590` supplies the ROM's middle level
- `u16 v` for the centre cell -- 9.7%, worse than `int v` at 11.3%
- the guard spelling is NOT an open axis: the ROM's `subs r0,r5,#1; cmp r0,#0; bge` is literally the draft's `if (x - 1 < 0)`
- Wave 80 (W80-E): `register int x asm("r5")` pinned copy of x (the ROM's register for x, W79-A lever 1): 1288 bytes (+152), WORSE than the unpinned +140 -- the pin does not reproduce the ROM's allocation cascade
- Wave 80 (W80-E): the row-index axis named below is MOOT AS SPELLED: the draft's compiled output already reuses the guard's y-1 pseudo for the neighbour access (`sub r5, r4, #1` at the guard, `lsl r2, r5, #1` at the access), exactly the ROM's `subs r3, r4, #1` / `lsls r2, r3, #1` -- the block's (y - 1) * 2 does not refold

### Settled

- `u16` neighbour value and `int` centre value, and the tell is in the listing: the neighbour range test carries `lsls #16; lsrs #16` and the centre one does not, so they are different types rather than one
- the ROM chains ONE live constant through the whole tail (0x143, +0x1d -> 352, +1 -> 353, +2 -> 355, -0x40 -> 291, -0x20 -> 259, -1 -> 258) and branch tails jump INTO that chain after an adjusting adds/subs -- so a chain's constants cannot be read off its own immediates, which is how a wrong transcription survived a round
- A CROSS-JUMPED TAIL IS NOT EVIDENCE THE CONSTANTS ARE RIGHT: the wrong `259, 258` scored BETTER (600 insns) than the correct `289, 288` (607) precisely because 259/258 are the shared tail's constants and merged where the correct code cannot

### Why it is parked

Register allocation rotation, diagnosed sharper in wave 80 (W80-E): BOTH the ROM and the candidate carry the same three dispatch constants into late bodies (322, 353, 354 -- ROM in r6/r7/r8, five `cmp r1, r8` sites; candidate in r7/ip/r9). The ROM spends ONE callee-saved hi reg (r8 = 354) with the -fforce-addr pool address in caller-saved ip; the candidate spends TWO (r8 = pool, r9 = 354) plus ip = 353, which is the whole push-list diff. The rotation is seeded in the very first access block: x lands in r6 (ROM r5) because that block's 0x417A scratch takes r5 (ROM r6), and every later assignment shifts one position. The instruction streams are identical modulo renaming at the seed point, so no source handle was found -- this is the allocno-tie class that went 0-of-5 in wave 79. The row-index axis previously named here is moot (see axes).

### Park kind

ORDINARY NEAR-MISS -- a real candidate exists and the axes below were actually probed. This is NOT the volume park sub_0800CFDC is.
