# sub_0801B120 — parked, ONE address constant in the wrong register

Wave 50, W50-K. Two `try_match` attempts. The whole shape is derived and
correct; the residual is a single register-allocation decision and everything
else in the diff follows from it.

## What the function does (settled)

Picks the active save slot among the 16 `gUnknown_0200CC38` entries whose id
matches `a1`. `a1 == 0xff` is the "unnamed" case: the key becomes 0 and a
candidate additionally requires `gUnknown_0200CC88[i] == 0`. Among matches the
highest `gUnknown_0200CC88[i]` wins; ties do NOT reset the tally. `cnt[]` on the
stack counts one entry per chunk index (`unk30 >> 4`), and the answer is
accepted only when the first `(unk30[best] & 0xf) + 1` counters are all 1 and
every later one is 0. If the group is incomplete, every member of it is
invalidated (`ids[i] |= 0xff`) and the entire scan runs again — that is the
outer `for (;;)` and the `b _0801B16C` at the end. Returns 0xffff for "none".

Stack: `cnt[16]` at sp+0, `ids[16]` at sp+0x10, the spilled `a1` at sp+0x20 and
the spilled `&ids[0]` at sp+0x24. Frame is 0x28.

## Two findings that were needed to get this far

1. **The clear loop is written TWICE in the source.** The ROM has two full
   copies (at `_0801B1AA` and `_0801B206`) and gcc does not cross-jump them
   because the first also carries the `adds r2,r4,#1; mov ip,r2` loop-increment
   copy. Writing the natural nested form
   `if (best == -1 || g88[best] != g88[i]) { best = i; clear; }` emits ONE copy
   and is ~34 bytes short. The shape that produces two is
   `if (best == -1) {A} else if (best > -1 && g88[best] <= g88[i]) { if (g88[best] != g88[i]) {A} } else continue;`
   with the clear block spelled out in both arms.
2. The `best > -1` conjunct is real and is what emits the second
   `cmp r8, r0; ble` — same readout as `sub_0801B2FC`'s selection loop.

## The remaining diff

`sl` holds the wrong address constant:

| constant | ROM | draft |
|---|---|---|
| `&gUnknown_0200CC38.unk30[0]` (0x0200CC68) | **`sl`**, built once before the outer loop as `ldr =gUnknown_0200CC58; adds #0x10` | not held — built as `[sp,#0x24] + 0x30` |
| `gUnknown_0200CC88` | rematerialised from the pool at every use (three separate pool words) | **`sl`** |
| `gUnknown_0200CC38` base | no pseudo outside the init loop | an extra SPILL at sp+0x24 |

Consequences, all downstream of that one choice:

- frame is 0x2c instead of 0x28 (the extra spill slot), so every `[sp,#N]` for
  `ids` is off by 4;
- `gUnknown_0200CC38.unk30[i]` costs 3 instructions
  (`ldr [sp,#36]; adds #48; adds r0,r4,r0`) where the ROM spends 2
  (`mov r2,sl; adds r0,r4,r2`), in both the record block and the `n = ...`
  statement;
- because that block is 3 instructions instead of 2, the `g88[best] ==
  g88[i]` path cross-jumps differently: the ROM duplicates the 2-instruction
  address computation and jumps to `_0801B220`, the draft branches into the
  shared block with a `beq`.

This is the wave-17 rule ("of two address constants used the same number of
times, the pseudo created FIRST wins the register and the loser is
rematerialised"), and it is pointing the wrong way here: in the draft
`gUnknown_0200CC88` is referenced first, in the candidate test
`(a1 != 0xff || gUnknown_0200CC88[i] == 0)`, while `unk30` is not touched until
the record block. The ROM builds `unk30`'s constant BEFORE the outer loop and as
`gUnknown_0200CC58 + 0x10` — i.e. derived from the unk20 address constant, not
from the struct base — which is the thing to reproduce.

Not tried: the wave-17 comma-operator anchor to create the `unk30` reference
earlier, and the permuter (which the docs say is exactly right for a
slot-wrong residual with a correct instruction stream).

## Wave 65 result

A safeguarded permuter run was stopped early because another agent owned the
global search slot, but it independently found the same concrete lever implied
above: bind `&gUnknown_0200CC38.unk30[i]` to a `u8 *meta` before the candidate
test and use `*meta` for the counter index. The hand-cleaned spelling is now the
active draft. It moves 464/476 at 29.83% to exact-size 476/476 at 47.27%.
The address pseudo is now created early enough, but the ROM holds the derived
unk30 base in `sl` while this candidate advances the per-element pointer in
`r9`; the remaining residual is allocation and cross-jumped block placement.
No further permuter run was made.

## Wave 78 result

Configured remains size-aligned at 476/476, 47.3% positional identity (the
prior 51.7% best is retained separately). Moving a direct
`gUnknown_0200CC58 + 0x10` base to the outer-loop preheader, with and without a
fixed-register/empty-asm anchor, grew the candidate to 500 bytes and changed
the frame/allocation globally. Direct struct-base, pointer-to-array, explicit
association, and comma-anchor spellings did not recover the ROM preheader.
The readable per-element `meta` draft was restored and configured-reverified.
