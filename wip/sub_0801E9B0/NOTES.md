# sub_0801E9B0 — parked at 21.2%, size -20 (804 vs 824), wave 54, W54-G

**The decomposition is settled.** Score is meaningless here: the -20 makes it
positional. Everything below is verified against the diff, not guessed.

## What is already byte-exact

- Prologue, frame (`sub sp, #44`) and the **whole stack-slot layout**:
  `[sp,#0]`=a3, `#4`=n, `#8`=i, `#12/16/20`=t0/t1/t2, `#24/28`=sx/sy,
  `#32`=flag, `#36`=hoisted `(s16)a2`, `#40`=`a6 << 16`.
  Slot order is **declaration order**, not assignment order — sx/sy are
  assigned before t0..t2 but declared after them. Getting the declaration list
  into that order was worth ~30 bytes on its own.
- The 0x80 guard, the `a6 != -1` scale lookup, the OAM triple build, the
  `flag`/`prio` block, both sign-extend idioms, the `sub_080169A4` call and the
  whole loop tail including `p += 3;` **before** `dst += 2;`.

## The entire remaining residual: the two scaling arms CROSS-JUMPED into one

The ROM keeps `if (t0 & 0x200)` and its `else` (the `/ 2` variant) as two
separate tails, sharing only the last three instructions
(`asrs r0,#16; adds r0,r5,r0; subs r5,r0,r1`). The candidate merges the whole
`x = x + a2 - dx; y = y + a3 - dy;` pair as well, which is the missing 20 bytes.

**It is a register-numbering tie, not a wrong decomposition.** gcc's
cross-jumping compares instructions including hard registers. In the ROM the two
arms differ in exactly one register — `dx` lives in r2 in the `& 0x200` arm and
in r4 in the `/ 2` arm (`dy` is r1 in both), because the `/ 2` arm needs an extra
scratch for the `lsrs #31; adds; asrs #1` rounding. The candidate allocates both
arms identically, so the merge runs further.

## Tried and measured, in order

1. Shared `dx`/`dy` locals across both arms — merged the tails, -72 bytes.
2. **Distinct locals per arm (`dx`/`dy` vs `ex`/`ey`) — this is the wave-35
   W35-C lever and it PARTLY worked**: -72 → -20. It split the arms but did not
   split the final `x`/`y` update pair. W35-C says "write the two arms'
   expressions INLINE and DISTINCT"; distinct *locals* are apparently weaker
   than distinct *expressions* here.
3. Interleaving `dx = …; x += dx; dy = …; y += dy;` (rather than both loads then
   both adds) — required, matches the ROM, kept.

## Untried, and the next thing to try

- Write the two arms' `x`/`y` updates as **inline distinct expressions** rather
  than through `ex`/`ey` locals, so the two tails are not textually identical —
  the literal reading of W35-C, which attempt 2 only half-applied.
- W34-E's "three locals, in order" and W34-H's rider (a pure register-numbering
  tie is a different residual) both bear on this; W34-H says the three-local
  lever needs an EXTRA instruction in the ROM to bite, and here the ROM's extra
  instruction is the `/ 2` rounding, so the lever should be reachable.
- The permuter is explicitly the right tool for this class (order-wrong /
  slot-wrong); it has not been run.

## Wave 65 final probe

Binding `gUnknown_0848B6F6` to a block-local pointer in only the `t0 & 0x200`
arm desynchronised the two arms after reload and recovered eight bytes: 812/824
(-12), 27.79%, versus 804/824 (-20), 21.24%. The arms now keep more of their
tails distinct, but still cross-jump the final signed-a2/a3 update and retain a
register-numbering mismatch throughout the `/ 2` arm. This improved draft is
active; no permuter pass was started because the wave's global slot was busy.

## Header work done for this function, all verified separately

- `gUnknown_03000548` retyped `u32` -> `struct Unk03000548 { u16 unk00, unk02,
  unk04; }`. The old comment flagged the `u32` as an alignment guess.
- `gUnknown_0848B6F6` / `gUnknown_0848B6F8` declared `const s16 [][8]` — the OBJ
  width/height tables, confirmed against the ROM bytes.
- `sub_080169A4` declared (promoted-but-undeclared).

## Wave 78 result

Configured reverified at 812/824 (-12), 27.8%. Replacing the final `dx/dy` and
`ex/ey` updates with distinct inline table expressions compiled byte-identical
to the active draft, so that documented axis is now ruled out. The established
stack-slot order and readable transcription were restored unchanged.
