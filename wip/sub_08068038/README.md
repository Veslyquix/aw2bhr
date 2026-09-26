# sub_08068038

0x08068038, 172 bytes, THUMB, parked.

Best score so far: 36.6% (best.c).

## Files

- `sub_08068038.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

36.6% identical, candidate 176 bytes (+4), first difference at +0xc -- in the frame. First measurement of this function; wave 59 (W59-E).

### What still differs

ONE ALLOCATION DECISION, and every other hunk follows from it. ROM: the str parameter is SPILLED to a stack slot ('str r0,[sp]', reloaded at all three uses), a2 * 32 lives in sb, &gUnknown_08581160 in sl, &gUnknown_0202F208 in r8 (held for the whole function) and i in ip -- four HI registers plus one stack slot. Candidate: str in sl, a2 * 32 spilled to the stack, and &gUnknown_0202F208 rematerialised from the pool after the call instead of held. The candidate carries one live value fewer than the original.

### Why it is close

The whole control-flow skeleton is byte-exact in place: the outer test, the inner scan loop over the global cursor, the 'goto advance' re-entry, the short-circuit ||, the CROSS-JUMP MERGE that gives both arms one shared 'bl Decompress', the 'ldr r0,[r0,#0x64]' fold for the sentinel's entry-12 data, and the epilogue. Every branch and every constant agrees. The scan cursor genuinely lives in memory -- gUnknown_0202F208 is zeroed before the loop, loaded at the top of every inner iteration and stored back on increment -- and no local reproduces that.

### Already ruled out

- Wave 59 (W59-E): DO NOT chase the '=gUnknown_08581164' pool word. It is not a separate global and not a second table: '&tbl[g].data' is '(g * 8) + (base + 4)', and which spelling agbcc picks is decided by where the base landed. With the base in a HI register (the ROM, sl) there is no 'adds rD,rHI,#4' available, so it forces a fresh pool word holding base+4; with the base in a LOW register (the candidate, r6) CSE reaches it with 'adds r0,r6,#4'. The pool word and the register assignment are ONE fact.
- Wave 59 (W59-E): dropping the 'next' and 'dst' binding locals -- writing 'i++' after the Decompress call and the destination expression inline at the call site, on the theory that both are inner-loop-invariant and so would be LICM-hoisted anyway. STRICTLY AND BADLY WORSE: 156 bytes (-16), 11.6%. Without the locals gcc strength-reduces BOTH walks, turning str into a walking pointer ('adds r4,#1') and the destination into a giv ('movs r0,#128' / 'lsls r0,#2' / 'adds r6,r6,r0'). The ROM carries NEITHER and recomputes 'str + i' and 'i * 512' from the index on every outer iteration. So the two locals are load-bearing. This is the sub_0800CAA0 direction of the induction-variable axis -- the CANDIDATE carrying givs the ROM does not -- and it is a useful counter-example to the usual 'binding locals are punctuation, split them' advice: here REMOVING binding locals cost 16 bytes.
