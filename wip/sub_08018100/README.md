# sub_08018100

0x08018100, 92 bytes, THUMB, parked.

Best score so far: 22.8% (best.c).

## Files

- `sub_08018100.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

22.8%

### What still differs

ONE extra instruction, `adds r5, r1, #0` at +0x06, and the register renaming it drags through the body. The ROM puts the promoted parameter straight into r5 (`lsls r0, r0, #0x10; lsrs r5, r0, #0x10`) and reads r5 at both uses; every candidate lands it in r1 and copies it to r5, then reads r1 before the call and r5 after.

### Why it is close

Pool-word order, the .rodata address constant for gUnknown_0200C528 (which the disassembly calls gUnknown_0808E568), the whole if-body and the whole tail are instruction-for-instruction right. The percentage is low because best.json counts register fields and the extra copy shifts every following register number.

### Already ruled out

- binding the node pointer to a local inside the if
- binding the halfword to a local and passing it to sub_0801815C
- `u16 a` parameter with `(s16)a` at both uses
- an extra unused second parameter (changes entry liveness, not the copy)
- folding the global assignment into the call argument
- inverting the test and duplicating the increment into both arms
- naming the node twice so CSE sees a third reference

### Settled

The copy tracks the CSE-HOISTED BASE POINTER, not the parameter. sub_08018464 -- matched, same block, same shape, but with only ONE reference to gUnknown_0200C528 so no hoist -- carries the identical copy in the ROM (`lsrs r1, r0, #0x10; adds r4, r1, #0`), and a probe with the base not hoisted drops it. So the ROM coalesced a parameter copy that agbcc declines to coalesce whenever that base is live across the call. Register allocation, not structure: do not rewrite the body.

### Why it is parked

wave 32 (W32-A)

### Wave 81

WAVE 81 (D): profile sweep COMPLETED -- o1 and o1-no-force were never tested before and are both worse (21.7%); default 22.8; old-agbcc 25.0; no-force and old-agbcc-no-force BOTH 82.6% size-exact, but that profile rematerialises the gUnknown_0200C528 base instead of hoisting r4 and shrinks the push list -- mechanism divergence, not convergence, and the ROM's two-deep ldr r4,[pc]/ldr rN,[r4] keeps -fforce-addr, so no-force is not canonical without an override cluster near 0x08018000 (none recorded). Probes: even with the array base passed as an explicit pointer PARAMETER (zero hoisted-base pressure), agbcc emits the narrow-into-r1 then callee-saved copy under BOTH no-force and old-agbcc-no-force; so across all seven configurations agbcc declines this coalescence. Wave 32's twin argument ('the ROM coalesced because the base was not live') carries that qualification.

### Wave 82

WAVE 82 (W82-C): no-force RE-MEASURED myself on the current compact draft: 92 of 92 bytes size-exact, verbatim verdict: bytes: 16 of 92 differ  (82.6% identical). The parameter-copy disease does NOT vanish under no-force -- it RENAMES itself: narrow lands in r1 and agbcc emits adds r4,r1,#0 before the bl (a kept in callee-saved r4), where configured emits lsrs into r1 plus adds r5,r1,#0. So the winning-profile delta is entirely the ROM-side -fforce-addr evidence: the two-deep ldr r4,[pc]/ldr rN,[r4] base hoist of gUnknown_0200C528 plus push {r4,r5,lr}, both of which the ROM demonstrably keeps, so no-force is structurally farther from the truth even at a higher score. Classification (b): across all seven profiles agbcc declines the direct-narrow-into-shared-callee-saved coalescence whenever any constant base is live across the bl; no flag combination produces the ROM coalescence, override claim NOT made.

### Wave 86

WAVE 86 (W86-C): hypothesis 'the narrowed parameter's two homes come from coalescing with the CALL-ARGUMENT copy' REFUTED by the ROM itself: sub_0801815C's argument is in r0 and is the halfword just stored to gUnknown_03002F08+2 re-narrowed to u8 (ldr/ldrh/strh/lsls #24/lsrs #24/bl); r1 at the bl holds (s16)a left over from the index computation and is dead. The draft's sub_0801815C(gUnknown_03002F08.unk02) is right. Twin sub_08018464's ROM has TWO homes for its parameter (the copy), so the ROM itself usually does not coalesce either. Probe: parameter used only after a call gives `adds r4,r0,#0; lsls; lsrs` (copy first, narrow in place) -- still two instructions. Across wave 32's seven spellings, waves 81/82's seven profiles and these two probes, no configuration of agbcc produces the direct narrow into the callee-saved home. Bare allocation residual, no construct. Configured, 92/92 size-exact, 22.8% (71 of 92 positional), unchanged.
