# sub_0801C090 — parked, register allocation only

Wave 50, W50-K. Every instruction in the draft is the right instruction; the
residual is which register each value lives in. Do NOT rewrite the shape.

## What is already settled (do not re-derive)

- The function mirrors a sprite horizontally when `a1 & 0x1000` (the OAM h-flip
  bit) is set. Mirrored x is `a1 - x - width`, with `x` the 9-bit signed field
  of attr1 and `width` from `gUnknown_0848B56C`.
- `gUnknown_0848B56C` is the 4x4 OAM `{width, height}` table in PIXELS, now
  declared in `include/unknown-globals.h` with the ROM contents that prove the
  layout. `gUnknown_03002B20` is added to the Y (attr0) and
  `gUnknown_030030D0` to the X (attr1) — note that this is the OPPOSITE of what
  the existing header comments on those two globals claim ("the y half of the
  scroll origin pair whose x half is gUnknown_03002B20"). One of the two is
  wrong; this function is direct evidence and nothing was changed.
- `gUnknown_03002F2C` must be re-read every iteration: the `strh` through `dst`
  may alias it. No `volatile` is involved.
- `dw` and `dx` are `s16` locals. Their def is `lsl #16; lsr #16` (agbcc's
  PROMOTE_MODE zero-extends sub-word locals regardless of signedness) and every
  read is `lsl #16; asr #16`. `dx`'s pair is folded by combine into
  `lsl #16; rsb; ... asr #16` because its def and use are in the same block;
  `dw`'s is not, because its def is before the `if (src[1] & 0x100)` merge.

## The finding that unblocked this — worth reusing

`(u16)x = <expr with a 32-bit mask>` is NOT what the ROM compiles. Written
directly, combine merges the store's `zero_extend(subreg:HI ...)` into the
`and`/`ior` and narrows the constant: `& 0xffffff00` becomes
`& 0xff00` (emitted `mov #0xff; lsl #8`), and the truncation then disappears
because the value provably fits. The ROM keeps the pool word `0xFFFFFF00` AND
the `lsl #16; lsr #16`.

Routing the value through a 32-bit local first — `t = <expr>; attr0 = t;` —
blocks that combination and reproduces the ROM exactly. Four spellings that do
NOT work (all narrow): `u16 a = expr`, `a |= C`, `a = (u16)(expr)`,
`u32 a = (u16)(expr)`. Two that do: `u32 t = expr; a = t;` and
`u32 hi = <masked part>; a = hi | <low part>;`. Recorded in
`docs/agbcc-codegen.md`.

## The exact remaining diff

Instruction-for-instruction the draft matches; these registers do not:

| value | ROM | draft |
|---|---|---|
| a1 | `ip` | r7 |
| a2 | `sb` | r8 |
| count | **stack slot `[sp,#4]`** | r9 |
| dw | r8 | `ip` |
| src | r5 | r4 |
| dst | r6 | r5 |
| frame | `sub sp, #8` | `sub sp, #4` |

Everything else follows from `count` being spilled in the ROM and not in the
draft:

- ROM's decrement is `ldr [sp,#4]; lsl #16; ldr =0xFFFF0000; add; lsr #16;
  str [sp,#4]; cmp r0,#0` — the test reads the PRE-`lsr` value. The draft's
  in-register form is `sub #1; lsl #16; lsr #16; cmp`. Same semantics, 1 byte
  of frame and a different instruction each.
- ROM keeps `src[0]` live in r2 across the table-index computation
  (`ldrh r2,[r5]; lsrs r0,r2,#0xe` — the shift goes to a different register),
  so the attr0 statement reuses it. The draft destroys it
  (`ldrh r0,[r4]; lsr r0,r0,#0xe`) and reloads. Same for `src[1]`.
- In the table index the draft's `lsl #2` on the size term is scheduled after
  the shape term instead of immediately after its own `lsr`.

## Wave 60 (W60-A) — measurements, and the permuter IS now attempted

**The draft is `-16` bytes, not `-12`, and it scores 14.2%.** Measured with
`try_match` on the draft itself this wave. Two briefs have quoted `-12`; the
number to work against is 16.

**That 4-byte gap is NOT silent drift, and it is worth saying so explicitly**
because wave 60 (W60-D) found a real case of exactly that signature elsewhere: a
draft losing 4 bytes with nobody editing it, because a *correct* header change
made for another function killed a conversion in it (`sub_080152C0`'s return
type going to `s8` made a `(u16)` cast feeding only a `strh` provably dead). The
mechanism does not need a callee — a global's declared type reaches a function
that calls nothing — so it was a live hypothesis here. It is excluded:

- `sub_0801C090` calls nothing at all.
- It touches four symbols, and `git log -S` over `include/` shows the last
  commit changing any of them is **wave 50** (`gUnknown_0848B56C`, the wave that
  wrote this draft and these notes). `gUnknown_03002F2C` last moved in wave 40;
  `gUnknown_03002B20` and `gUnknown_030030D0` in wave 7.
- It declares no struct or typedef of its own and uses none.

So nothing this function reads has been retyped since the draft was written, and
the `-12` is simply a figure that was wrong in the brief. **Do not go looking for
a lost 4 bytes.**

**`best.c` is a much better starting point than this draft and always was.**
It now holds a **42.5%** spelling. Do not open the draft first next time —
`work/*/best.json` is the index the wave-20 chapter says to sweep, and here it
was worth 28 percentage points over the file everyone reads.

**The permuter was run for the first time this wave (300 s, 6 threads) and it
made real progress: 14.2% -> 42.5%.** It did not close the function. What it
found is worth reading, because all three of its edits are the block/binding
levers rather than value rewrites:

- a `do { ... } while (0)` wrapped around the **entire while-loop**;
- `t = 0x100;` bound to the `t` scratch before `if (src[1] & t)`;
- `new_var = a1 | src[1]` bound inside the else-arm's `& 0xfffffe00`.

That is the same family of lever that closed `sub_0801C4D4` and `sub_0801C640`
in this wave (see the wave-60 subsection of the zero-trip-loop chapter in
`docs/agbcc-codegen.md`). **Chain another run from `best.c`, not from this
draft** — wave 59 and this wave both show the escalation only works from the
previous best.

**Run 2, chained from that `best.c`, went 42.5% -> 44.72% and found no zero
score.** It kept all three of run 1's edits and added two more: an identity
`inline_fn(src)` around the `src[1]` read in the table index, and a `(char)`
cast on that index's `* 4` term. Treat the `(char)` as suspect — it is a
semantic change the permuter cannot know is wrong, and it is the kind of edit to
drop before promoting anything built on this line. Compare the same chain on `sub_0801C2DC` in this wave, which went
81.6 -> 97.1 -> 99.6 -> match on three runs: **there the escalation was large at
every step, here it is a couple of points.** That difference is the signal worth
acting on.

**Run 3, chained again, went 44.72% -> 45.83%. No zero score in any of the three
runs.** So the sequence is 14.2 -> 42.5 -> 44.72 -> 45.83: one large jump when
the block levers first go in, then about a point per run. **That shape means the
residual is not reachable by randomisation.** Do not spend a fourth run; spend
the budget on the spill hypothesis below. For contrast, the chain that works
looks like `sub_0801C2DC` in the same wave — 81.6 -> 97.1 -> 99.6 -> match, large
at every step.

Two practical notes on running it here:

- **The check phase is O(candidates) and this function produces a lot of them:**
  678 output directories, each re-scored twice through `trymatch` after the
  search ends. The search itself finished in its 300 s; the tail took over 20
  minutes and was still going. If the log says `Exiting.` and no
  `found new best score! (0 ...)` line ever appeared, **no candidate can be a
  byte match** and the tail is only updating `best.c` — it is safe to stop.
- **Killing `permute.py` leaves raw `cpp -P` output in `work/<fn>/<fn>.c`.**
  Confirmed here: the draft came back as 6,956 lines of expanded headers and had
  to be restored from a copy. The brief documents this for abnormal exits; it
  happens on a deliberate kill too. Copy the draft somewhere safe first.

## What to try next

Wave 65 tested the concrete spill hypothesis by binding `src[1]` and `src[0]`
to per-arm `u16` locals and reusing them through each attr calculation. It moved
the active draft from 344 to 348 bytes (-16 to -12), but scored only 22.22%,
did not spill `count`, and remained well below the 45.83% permuter best. This
rules out the simple "keep the two source halfwords live" lever; the clean
active draft was restored after the verdict.

1. ~~This is exactly the permuter's case (order-wrong / slot-wrong register
   allocation, instruction stream already correct) — `docs/agbcc-codegen.md`
   says run it for 300 s before a third hand rewrite. Not attempted here.~~
   **Done in wave 60 — see above. It is worth chaining further, not repeating
   from scratch.**
2. Failing that, the lever is making `count` the lowest-priority allocno so it
   spills. Its priority is refs/live-length; the draft's is identical to the
   ROM's by inspection, so the difference is more likely one extra live value
   somewhere in the arms than anything about `count` itself.
3. Do NOT try to fix the mask narrowing again — it is solved. Do not remove the
   `u32 t` intermediates.

## Local notes from a separate pre-merge pass (2026-09-25)

These came from a checkout that had not yet seen the notes above. Its
`best.c` (75.6%, size-exact) is the one published here.


- The starting Ghidra draft was 360/360 bytes but only 15.0% byte identical.
- The readable `sub_0801C090.c` is 360/360 bytes, 75.56% identical, and does
  not match. `python3 tools/trymatch.py sub_0801C090 --diff` is the verdict.
- The sprite template is a count followed by three `u16` OAM attributes per
  entry. The output cursor advances by four halfwords per entry. Shape and
  size index `gUnknown_0848B56C` for the horizontal mirror width.
- Two 120-second permuter runs produced no byte match. The second run briefly
  reached 78.33%, but its 364-byte candidate added a preprocessed `inline_fn`
  helper. Its output remains under `permuter/` for inspection. The clean,
  size-exact draft is retained as `best.c`.
- The remaining diff starts with the tile-offset store before the source
  pointer copy. In the mirror branch, the ROM uses `r4` for source attr1,
  computes the table address in `r1`, then retains the sign extension in `r3`.
  The draft puts source attr1 in `r3`, computes the address in `r0`, and places
  the sign extension in `r4`. The ordinary branch and loop tail also have
  register assignments that differ, despite the same control flow and size.
- `sub_0801C090.md` is the decomp.me packet generated from the retained draft.
