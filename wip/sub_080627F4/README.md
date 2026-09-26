# sub_080627F4

0x080627F4, 752 bytes, THUMB, parked.

Best score so far: 99.2%.

## Files

- `sub_080627F4.c`: the current draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

Wave 74: exact 752/752, 99.2%, 6 differing bytes, first difference +0x3e.

### What still differs

Only two stack-slot numbers are swapped: ROM t at sp+24 and t*0x40 at sp+16; candidate has the reverse.

### Why it is close

Every opcode, register, branch, relocation and frame size otherwise matches.

### Already ruled out

- First-reference order, parameter/counter split, comma association, inner end bound, scoped bases, lockstep counters and dead assignments were measured without closing the swap.
- The generic permuter normalizes stack offsets and cannot score this residual.
- W77-M: the ROM's t*0x40 spill is NOT a source local. An explicit `base = t * 0x40;` used as the inner loop init and bound is 469 bytes with the declaration first and 466 with it last; an absolute inner bound `(t + 1) * 0x40` is 491; declaring an unused extra local alone stays byte-neutral at 6. This is W77-B's "read a ROM spill as pressure, never as an instruction to add a local" rule reproducing on a stack-slot residual.
- W81-A: merging the two guards into `(a1 == 1 && bit == 1) || (a1 == 0 && bit == 0)` before `continue` is byte-neutral: still exact 752/752, 99.2%, same six differing bytes, first difference +0x3e, and both duplicated t+1 precompute stores survive the merge. Guard shape joined the ruled-out list.
- W82-A: declaring u before t is LIVE, not neutral: 8 of 752 differ (98.9%, first difference unchanged +0x3e) vs 6 for t-first, so declaration order reaches spill-slot numbering here but regresses. ROM still allocates u's slot below t's; pseudo-creation order says the original source created u's spill pseudo first, with no declarative reorder found that reproduces it.
- W83-C RESIDUAL REDECODED: it is a three-way ROTATION, not a pair swap -- ROM slots are outer t @ sp+24, inner u @ sp+20, inner-end constant (t*0x40+0x40, the exit-test spill) @ sp+16; original candidate u@16/t@20/end@24. Levers measured: (a) an `int u = 0;` declaration-initializer as first declaration is LIVE and wrong -- pushes u to sp+24 and shifts every lower slot down 4; declaration-initializer statements DO reach this allocator where plain declaration order does not. (b) agbcc cannot parse asm inside a comma expression -- only statement form exists for this lever family. (c) statement-form zero-code input asm immediately before the inner for (`asm volatile("" : : "r" (t * 0x40 + 0x40));`, forces end-const RTL expansion ahead of u's init) FIXES u to sp+20 exactly as ROM -- the first lever ever to touch u correctly -- but exchanges e between [sp,#12] and sl elsewhere and leaves t/end swapped (candidate t@16/end@24 vs ROM end@16/t@24). Draft restored to the 99.2% baseline. KEY FACT: slot number here demonstrably does NOT follow pseudo creation order (ROM expanded t earliest yet t sits HIGHEST), so the mechanism is some later pass -- likely spill-decision/instantiation order; W77-M already ruled out every explicit end-var spelling.

### Settled

- Declaration order and explicit/implicit base forms remain byte-neutral; target spill pseudo creation instead.

### Why it is parked

Wave 74 W74-G. Pure spill-slot-order fixpoint.

### Wave 84

WAVE 84 (W84-B): the parked decode above was REFUTED by direct disassembly. The frame is {a1@#4, m@#8, e@#0xc, t+1-temp@#0x10/#0x18, u@#0x14 CORRECT BOTH SIDES, K=t*0x40 temp@#0x18/#0x10} -- a pure pair swap between two COMPILER TEMPS; u was never mis-slotted. Measured: commute-mul NULL; y-only and x-only splits NULL; BOTH x+y (>>1)>>1 split-shifts together flip the whole layout so K lands at #0x10 exactly as ROM, leaving only u<->(t+1) swapped ({t14,K10,u18} vs ROM {t18,K10,u14}); a third stacked nudge was neutral in every form tried (>>0 dropped pre-count; else-arm (v>>2) split folds before counting). The W56-F gcse-pre insn-count lever DOES reach this function -- the wave-60 no-effect test folded at the wrong site; NEXT-WAVE LEAD: sweep early-region (bitexpr/address-scaling) single-insn fold-backs stacked on the both-splits base. Draft = 99.2% baseline (w84-baseline.c).

### Wave 86

WAVE 86 (W86-A): W84-B's insn-count lead run full length -- half CONFIRMED (the W56-F gcse-pre lever does reach this function; wave 60's no-effect test folded at the wrong site), half REFUTED as a route: the lever's reachable set from this body is exactly TWO stack layouts (ROM P@0x18/Q@0x10/R@0x14; 0-or-1 split-shifts give P@0x10/Q@0x18; 2 split-shifts give a third that is not the ROM's either) because only two same-direction shift-of-shift sites survive to gcse -- eleven other 'fold-back' spellings (((a<<1)>>1)>>2, (t*0x20)<<1, t*0x40+0x20+0x20, 0x40+t*0x40, ((g>>t)&3)&1, &g[0]+u, x/y swapped, ...) fold BEFORE gcse and are byte-identical. Configured profile, 752/752, 6 bytes at +0x3e, unchanged. Full table and the N-spellings-in-one-unit harness in work/sub_080627F4/W86-notes.md and the wave-86 doc chapters. No source route left on this axis; the frame's three contended slots P/Q/R are spill-decision order, not creation order.
