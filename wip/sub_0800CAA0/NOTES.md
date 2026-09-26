# sub_0800CAA0 — parked at 15.3% / +8 bytes

Wave 58 (W58-B) took this from +12 to +8 and settled what the +12 was. The
wave-50/51 analysis below is unchanged and still worth trusting. The score is
positional; read the diff, not the percentage.

## What the +12 was — ONE giv, and five of its six instructions are downstream

Of four address givs of the identical form `base_k + i`, agbcc reduced exactly
ONE: the fourth, the only one whose `add_val` is a `CONST` expression
(`sym + 0x10`) rather than a bare force-addr'd invariant. The other three have
their symbol in a hoisted pseudo, so their address is `reg + reg` and reduction
buys nothing.

That single pointer giv cost six instructions:

```
+3  preheader    giv init (ldr =sym / adds / adds)
+1  loop bottom  giv increment
-3  loop body    address arithmetic removed
+2  prologue/epilogue -- the giv is a NINTH live value, so a third hi register
                        is saved and restored
+1  loop body    the value it pushed out of a LOW register now needs a `mov`
```

**Only one of the six is the giv's own code.** The rest are downstream of one
extra live value. That is why the byte count over-reads the cause, and it is
why `first difference at +0x2` (the push mask) is a symptom and not a frame
problem.

**The draft never authored any of it.** The wave-58 brief's hypothesis was that
the batch's three +12 functions were spelling the loop optimiser's preheader in
C. Not here — the C has no preheader, just a `for` init and four plain
subscripts. `strength_reduce` created the giv unprompted, so the fix is to take
one away, which is the *opposite* operation from the one that matched
`sub_080200EC` in the same batch.

## The fix that bought 4 bytes, and why THIS spelling

Binding the fourth base to a **block-scoped** local inside the innermost
conditional removes the giv and its loop-bottom increment. The two block-scoped
spellings are not equivalent and the literal pool is what separates them:

- `p = gUnknown_08488900 + 0x10;` then `p[i]` folds the addend **into the pool
  word** (`R_ARM_ABS32` with addend `0x10`). The ROM's addend is 0.
- `p = gUnknown_08488900;` then `p[i + 0x10]` keeps the pool word at **addend
  0** — which the ROM has — and moves the `+0x10` into the `ldrb`
  displacement.

Both measure +8. Keep the second; it has the ROM's relocation.

## What is left is exactly one live value

Both spellings still HOLD the fourth base in a register across the loop, so the
candidate holds 9 values where the ROM holds 8, `sl` is saved that the ROM does
not save, and `gUnknown_084888F0` loses its LOW register (r6) and needs a
`mov r1,sl`.

**It is not register pressure.** The ROM pushes r7 and uses it only as a
scratch, so a callee-saved register was free and gcc still did not hold this
base — it never created the pseudo at all. No caller-side spelling has reached
that in three waves. The same hold/rematerialise inversion appears in
`sub_08026290` (+8) and `sub_08028D28` (+4); see the wave-58 chapter in
`docs/agbcc-codegen.md`.

## Wave 50/51 analysis — unchanged

Every statement, both loop tests, the break, the preset-then-overwrite result
and all five pool words in their ROM order are byte-exact.

The ROM's hoisting is ASYMMETRIC, and the asymmetry is itself evidence:

- the `+0x34` byte's VALUE is hoisted into r5 — it is in the first comparison,
  which executes on every iteration;
- the `+0x35` and `+0x36` ADDRESSES are recomputed inside the loop every
  iteration (`adds r1,r3,#0; adds r1,#0x35; ldrb r1,[r1]`), loads not hoisted;
- the `+0x37` ADDRESS is hoisted into `ip`, but its load stays inside;
- the fourth table's pool word is re-loaded inside the loop.

The three later loads sit in CONDITIONALLY executed blocks, so agbcc will not
hoist the loads — they might fault — but it may hoist the address arithmetic,
and it hoisted exactly one of the three. The candidate reproduces all of this;
it is only the fourth table that differs.

Also worth noting: the four tables sit at 0x084888B0, 0x084888D0, 0x084888F0 and
0x08488910 — evenly spaced 0x20 apart — yet the ROM's fourth pool word holds
0x08488900 with a separate `adds r0, #0x10`. Whatever the original declaration
was, it was NOT a uniform 2-D array, or the addend would have folded into the
pool word like the other three.

The table is NOT in data/parked.json.

## Wave 59 (W59-A) -- two more spellings measured, neither moves it

Still +8. Two additions to the ruled-out list, both in the .c:

- `p = gUnknown_08488900;` then `(p + 0x10)[i]` is BYTE-IDENTICAL to the
  current draft's `p[i + 0x10]`. The "two spellings" section above is really
  three, and two of them are the same code.
- **The COMPONENT_REF spelling is strictly worse, and the exemplar says
  otherwise.** `src/decomp/c_0800CB30.c` -- the same table block's other reader,
  and the exemplar this batch was handed -- records that row 1 must be reached
  as `((struct Unk88Rows *)sym)->row1[k]`, because only the member reference
  pins `base + 0x10` as its own value. That is true in STRAIGHT-LINE code and
  false in a loop: measured here it folds the addend into the pool word
  (`.word 0x10` + `R_ARM_ABS32`, where the ROM's addend is 0) AND lets LICM
  hoist the result. Still +8, now with the wrong relocation. The exemplar's rule
  is about which RTL the address expression BUILDS; in a loop LICM then hoists
  whatever was built and the distinction stops discriminating. Written up in
  docs/agbcc-codegen.md.

The structural fact worth carrying forward: bases 1-3 are SINGLE-INSN
force-addr'd symbol loads and all three are hoisted; base 4 needs a TWO-INSN
chain (`ldr` + `adds #0x10`, because no symbol exists at 0x08488910) and neither
of its two insns is hoisted. That is the only difference between the one gcc
declined to hoist and the three it took, and it points at loop.c's
`move_movables` cost test rather than at anything spellable in C.
