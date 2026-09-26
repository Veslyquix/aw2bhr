# sub_0800CAA0

0x0800CAA0, 144 bytes, THUMB, parked.

Best score so far: 15.3% (best.c).

## Files

- `sub_0800CAA0.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

15.3% identical, candidate 152 bytes (+8). The percentage is positional; first difference at +0x2 is the push mask and is a SYMPTOM, not a frame problem.

### What still differs

EXACTLY ONE LIVE VALUE. The ROM does not hold the fourth table's base across the loop -- it rematerialises ldr r0,=gUnknown_08488900 / adds r0,#0x10 / adds r0,r2,r0 every iteration -- while every candidate holds it. That gives 9 live values where the ROM has 8, so sl is saved that the ROM does not save and gUnknown_084888F0 loses its LOW register (r6) and needs a mov r1,sl. It is NOT register pressure: the ROM pushes r7 and uses it only as a scratch, so a callee-saved register was free and gcc still never created the pseudo.

### Why it is close

Every statement, both loop tests, the break, the preset-then-overwrite result and all five pool words in their ROM order are byte-exact.

### Already ruled out

- Wave 58: gUnknown_08488900[i + 0x10] with no local is +12 -- it becomes a pointer giv with a loop-bottom increment, and five of those six instructions are downstream of the extra live value rather than the giv's own code.
- Wave 58: p = gUnknown_08488900 + 0x10; then p[i] is +8 but folds the addend INTO the pool word (R_ARM_ABS32 with addend 0x10); the ROM's addend is 0.
- Wave 59 (W59-A): p = gUnknown_08488900; then (p + 0x10)[i] is byte-identical to the current draft's p[i + 0x10]. Still +8, still holds the base.
- Wave 59 (W59-A): THE COMPONENT_REF SPELLING, and it is worth recording because the exemplar this batch was given, src/decomp/c_0800CB30.c, states the opposite. That file says row 1 must be reached as ((struct Unk88Rows *)sym)->row1[k] because base[k + 0x10] hoists k + 0x10, (base + 0x10)[k] folds the whole address into one pool word, and only the member reference pins base + 0x10. TRUE IN STRAIGHT-LINE CODE, FALSE IN A LOOP: measured here the member reference folds the addend into the pool word AND lets LICM hoist the result, i.e. strictly worse on both counts. The exemplar's rule is about which RTL the address expression BUILDS; inside a loop, LICM then hoists whatever was built and the distinction collapses.

### Notes

The remaining axis is loop.c's move_movables cost test, not addressable from C by any of the four spellings measured across four waves. The structural asymmetry is that bases 1-3 are single-insn force-addr'd symbol loads and are all hoisted, while base 4 needs a TWO-INSN chain (there is no symbol at 0x08488910) and neither of its insns is hoisted. The same hold/rematerialise inversion appears in sub_08026290 (+8) and sub_08028D28 (+4).

### Wave 87

WAVE 87 (W87-A, old-park x post-park-rule axis): pre-registered W86-C 2-D ARRAY base (`((const u8 (*)[0x10])g)[1][i]` and a genuine `extern const u8 g[][0x10]`) REFUTED: both fold +0x10 into the RELOCATION (`g+0x10`, worse than the draft) and neither stops the hoist. Sharpened rule: W86-C's array tell only exists when the index must be SCALED; with a u8 element and an unscaled index `&g[1]` is a link-time constant the front end folds before -fforce-addr sees an array. Header NOT retyped, c_0800CB30.c untouched. W86-F's bare-symbol form is HALF-confirmed and ALREADY IN THE DRAFT: ten spellings split completely by which side of the `+` carries the constant -- INDEX side (`g[i + 0x10]`, `g[0x10 + i]`, `p = g; p[i + 0x10]`) gives the bare pool word + runtime `add #0x10` (the ROM's pair), POINTER side (`(g + 0x10)[i]`, `*(g + 0x10 + i)`, `*(&g[0x10] + i)`, `q = g + 0x10; q[i]`, casts) folds into the reloc. Every one of the ten hoists the pair into the preheader (then strength-reduces it to a pointer giv); the ROM's four in-loop instructions are reachable, only their POSITION is not, so the residual is LICM and nothing else -- PROVED, not assumed. Declaring `p` at function top folds 0x10 into the ldrb displacement (keep the local inside the `if`). ACCIDENTAL POSITIVE: a malformed probe `g[(i + 1) * 0x10 / 0x10]` (== i + 1) left a bare `ldr =g` INSIDE the loop body un-hoisted with the other three bases hoisted -- the exact inversion needed -- differing only by ONE EXTRA VALUE live across the loop (`add r3,r2,#1`). So move_movables' pressure test IS flippable, by ADDING a live value, not by respelling the reference. Named next step: find a semantically honest extra live value across the loop (the ROM pushes r7 and uses it only as a scratch -- that scratch may be it). Configured, 152/144 (+8), 15.3%, draft unchanged (w87-start.c), 0 try_match.
