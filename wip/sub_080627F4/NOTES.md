# sub_080627F4 — 99.2%, 6 bytes, a pure STACK-SLOT SWAP (wave 50, orchestrator)

**There is a compilable draft at `sub_080627F4.c` scoring 99.2%.** This file is
analysis beside it, not a replacement for it.

## The entire remaining difference

6 of 752 bytes. Every one is the same thing: **two stack slots are swapped.**

| | original | our candidate |
|---|---|---|
| loop counter `t` | `[sp, #24]` | `[sp, #16]` |
| the `t * 0x40` temp | `[sp, #16]` | `[sp, #24]` |

Six sites — four `str`, two `ldr` — and nothing else in the function differs.
Size matches exactly, every instruction matches, every relocation matches. The
control flow, the switch table, the struct accesses and the call sequence are
all already correct.

## Axes ruled out — do not repeat these

1. **Declaration order does not control it.** Moved `base` from fifth to first
   in the declaration list. Result: byte-identical output, still 6 bytes, the
   same two slots still swapped. So agbcc is not assigning these slots in
   source declaration order, which is the obvious first guess and it is wrong.
2. **Making the temp implicit does not control it.** Deleted the explicit
   `int base` and inlined `for (u = t * 0x40; u < t * 0x40 + 0x40; u++)` so the
   compiler creates its own CSE temp rather than being handed a named local.
   Result: identical, still 6 bytes. (The draft is left in this inlined form —
   it is the more faithful phrasing and scores the same.)

Both attempts produced *byte-identical* output to each other, which is itself
the useful datum: **the slot assignment for these two pseudos is stable against
both source-level changes tried.** Whatever picks it is downstream of how the
locals are written.

## Where to go next

The two pseudos need their allocation ORDER exchanged, so look at what orders
spilled pseudos in this frame rather than at the two variables themselves:

- Try changing which of the two is **first written** in the function body,
  rather than first declared — spill-slot order tends to follow the order
  pseudos are created, and that follows first use.
- The frame also holds slots at `#4` and `#20`; a change that alters the total
  number of live spills may renumber everything. Check the frame size first
  (`sub sp, #N`) — if ours already matches, the swap is purely ordinal.
- `-fforce-addr` is on. Confirm neither slot is holding a hoisted address
  constant, which would make the "temp" not a temp at all.

Do NOT re-derive the body. It is correct.

## Wave 60 (W60-F): two more axes ruled out, and the permuter is UNAVAILABLE here

3. **The gcse insn-count lever does not reach it.** Per W56-F the lever for a
   spill-ORDER residual is the gcse PRE hash-table size, which is a function of
   the pre-register-allocation insn count, so `x >> 2` was rewritten as
   `(x >> 1) >> 1` at both `x`/`y` sites (two extra insns at gcse time, folded
   back by combine). Result: **still exactly 6 bytes, still the same two slots
   swapped.** That is now the third source-level change measured to produce
   byte-identical output.
4. **decomp-permuter cannot be used on this function at all.**
   `python tools/permute.py sub_080627F4` sets up correctly and then prints
   `base score 0` and exits without searching — its scorer normalises `[sp, #N]`
   immediates away, so a residual made ENTIRELY of them is invisible to it.
   `try_match` on the identical source returns not-matched. **This is not a
   permuter negative**; the search never ran. See the new chapter in
   `docs/agbcc-codegen.md`. (Contrast `sub_08062AE4`, whose residual includes a
   register choice as well as slots, and which scores non-zero and does run.)

The draft is back to the honest spelling — the split-shift version scored
identically, so there is no reason to keep it.

## Wave 63: two more lifetime/scope axes ruled out

- A deleted self-assignment through `gUnknown_08499594[t].unk00` after the
  outer loop, intended to extend only `t`, compiled byte-identically: the same
  six stack-slot immediates differ.
- Moving `u` from function scope into the outer `t` loop body on top of that
  deleted self-assignment also compiled byte-identically: the same six
  stack-slot immediates differ. This scopes the combined spelling, not the
  scope change in isolation.

The configured fixpoint remains size-exact, 6/752 bytes different (99.2%).

## Wave 72: isolated `u` scope axis

Moving `u` from function scope into the outer `t` loop body, without the
Wave-63 deleted self-assignment, is byte-identical to the retained draft:
size-exact, 6/752 bytes different (99.2%), first difference +0x3e. The same
`t`/`t*0x40` slots remain at sp+16/sp+24 instead of sp+24/sp+16. The honest
function-scope spelling is restored; no further order/slot grinding was done.

## Wave 74: first-reference, copy-splitting, and disjoint-lifetime matrix

The configured draft was remeasured before probing: target 752 bytes,
candidate 752 bytes, 6 differing bytes, first difference at `+0x3e`. The exact
byte offsets remain `+0x3e`, `+0x4e`, `+0x5e`, `+0x62`, `+0x2c8`, and
`+0x2d2`; they are still only the `t` / `t * 0x40` stack-slot swap.

The following first-reference and lifetime spellings compile byte-identically
to the retained draft, with the same six offsets:

- initialise `u` first and commit `t` from it in the outer `for` init;
- initialise a named `base` before committing `t`, then reassign `base` to
  `t * 0x40` for the inner loop;
- compute `t * 0x40` through a short-lived block-scoped `base`, copy it to `u`,
  end the block, then enter the inner loop;
- feed the inner-loop initialiser through a dead assignment to each of the
  later-live locals `c`, `m`, `x`, `y`, and `v`;
- feed the outer-loop zero through each of `bit`, `m`, `c`, `x`, `y`, and `v`
  before assigning `t`.

The broader copy/bound variants regress and were reverted immediately:

- a never-reassigned copy of parameter `a1`: 752 bytes, 17 bytes differ,
  first `+0x10`;
- a statement-level outer-counter copy, and the same copy comma-anchored in
  the bit expression: 756 bytes, 538 bytes differ, first `+0xa`;
- an honest inner `end = u + 0x40` bound: 748 bytes, 47 bytes differ, first
  `+0x3e`;
- a base whose block encloses the whole inner loop: 752 bytes, 466 bytes
  differ, first `+0xa`;
- saving `a1` and reusing the parameter as the outer counter: 764 bytes,
  612 bytes differ, first `+0xa`;
- two lockstep outer-counter locals updated in the `for` increment: 752 bytes,
  170 bytes differ, first `+0x14`.

This rules out first-reference reordering by zero-copy association, dead
in-expression assignment through an already-conflicting local, ordinary
parameter/counter live-range splitting, and both short-lived and loop-lived
named base/bound pseudos. The active file is restored to the strongest semantic
fixpoint. The generic permuter remains inapplicable because this residual has
no scorable register or opcode difference.
