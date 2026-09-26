# sub_08056638 — 144 bytes, 95.8%, size-exact, NOT matched

Wave 58, W58-D. Re-read against the wave-52 park. **Nothing in the wave-52 note
below is wrong and none of it needs re-measuring.** What this wave adds is the
classification and the reason it is not worth another attempt.

## The residual is THREE instructions, and it is an LICM-hoist inversion

Instruction counts are identical. Diffing `target.s` against the draft's own
`sub_08056638.s`, all six differing bytes are these three plus the pool order:

| | ROM | candidate |
|---|---|---|
| loop head, 1st base | `mov r3, sb` | `ldr r3, .L21+4` |
| loop head, 2nd base | `mov r0, sb` | `ldr r0, .L21+4` |
| swap block base | `ldr r2, =gUnknown_0202980A` | `mov r2, r9` |

Both compilations hoist ONE of the two row symbols to a callee-saved hi register
for the whole function and rematerialise the other from the literal pool at its
uses. The ROM hoists `gUnknown_02029822` (the sort key, read every iteration in
the loop head) and rematerialises `gUnknown_0202980A`; the candidate does the
exact opposite. The pool words come out swapped because the hoisted one's `ldr`
is emitted first — that is a symptom of the same fact, not a second fact.

**This is the W58-B "HOLD/REMATERIALISE inversion" residual** (see
`docs/agbcc-codegen.md`), and specifically it is an LICM decision: which
invariant `reg = symbol_ref` is moved to the preheader. W58-A's chapter "LICM
hoists a non-const global load out of a loop that CONTAINS CALLS" puts that in
the unreachable family — instruction ORDER across a loop boundary, reachable by
neither a declaration nor the permuter.

## Ruled out THIS wave, in addition to wave 52's list

- **The member/struct spelling is settled and is NOT the lever.** Both rows are
  0x6c-stride rows of `gUnknown_02029808` through their own linker symbols, and
  `include/unknown-globals.h` (W48-G, W49-M) records the discriminator directly:
  the member form emits `=gUnknown_02029808` plus `adds rB, #0x1a`, an extra
  instruction this function does not have. The flat form both rows already use
  is the right one. Do not spend a probe re-deriving this.
- **The wave-39 LICM blocker does not apply.** The only documented way to stop
  LICM hoisting an invariant is a SECOND assignment to the pseudo
  (`n_times_set == 2`). Here the pseudo being hoisted is the bare `symbol_ref`
  itself, which is single-set by construction — no C spelling gives one symbol
  two different values inside the loop without changing the address arithmetic
  the ROM already matches.

## Do not run the permuter

Wave 52 ran four sessions, ~85k iterations, three starting points. It moves
registers; it cannot move an insn across the loop boundary.

## Wave 81 (W81-B)
Deferring the gUnknown_02029822[side][j] = b; store past both payload writes (semantically free -- different arrays) so the payload base pseudos are created first: 85.4% / 21 bytes, first difference +0x26. The write order inside the swap block is also load-bearing. Park stands as classified.