# sub_08014DCC — parked at 116/120 bytes (-4)

Wave 42 (W42-D) analysis, copied out of the `.c` into this file by wave 51
(W51-J). **W51-J did not attempt this function** — job 1 (the 1,776-byte twin
pair, both matched) took the batch. Nothing below is new; it is carried forward
so the next wave does not have to dig it out of the `.c`.

## The residual — two instructions, one cause

The ROM does not coalesce `p = next`, and lays the copy out in a latch block
placed AHEAD of the loop header, so loop entry has to branch over it.

    ROM                                candidate
      cmp r1, #0                         cmp r1, #0
      bne <header>                       beq <ret0>
      b   <ret0>                         adds r3, r2, #0   (copy at loop TOP)
      adds r2, r3, #0   (latch)          ldr  r0, [r2, #8]
      ldr  r0, [r2, #8]                  ...
      ...                                ldr  r2, [r3]
      ldr  r3, [r2]                      cmp  r2, #0
      cmp  r3, #0                        bne  <top>
      bne  <latch>

Downstream of the same fact, in the split arm the ROM copies the new block's
address into r2 — p's register, free because p died at the loop — and uses r0 as
the scratch for `bestSize - total`, one instruction fewer than the candidate.
**Fix the coalescing and this closes with it; it is not a second problem.**

## Settled — do not re-derive

- The 16-byte header `{next, size, used, filler}` and every statement of the
  body: the candidate is instruction-for-instruction identical to the ROM apart
  from the two above, in the same registers.
- `push {r4, r5, r6, r7, lr}`, five callee-saved registers, is THE TELL that `p`
  and `next` are separate pseudos; the obvious spellings emit four.
- The tail layout: a single trailing `return NULL` is what puts the shared
  `movs r0, #0` block after the `adds r0, r5, #0; adds r0, #0x10` tail. Two
  early `return NULL;` statements put it in the middle instead.
- `q->used = 0` is a LITERAL zero; the ROM's register reuse is `reload_cse`, not
  something to author. sub_08014EF4 writes the same field with a plain
  `movs r0, #0`, which settles it.
- The round-up is on the `size` PARAMETER in place; `total = size + 0x10` is a
  real local; the compares are unsigned, so `size` and `bestSize` are u32.

## Ruled out by measurement — all coalesce `p = next` and emit four saved regs

- `while (1) { body; next = p->next; if (!next) break; p = next; }`
- `for (;; p = next) { body; next = p->next; if (!next) break; }` — gcc
  canonicalises these two together
- the same with an explicit `goto` past the copy; the goto is optimised away
- `do { body; next = p->next; p = next; } while (next != NULL);`

decomp-permuter: 300 s from wave 40's best produced nothing, which is expected —
the residual is MISSING instructions, not a slot swap.

## Next step

The loop-entry edge, not the loop body: find the spelling where `p = next` is
reached ONLY from the back edge, so the ROM's preheader copy is p's
initialisation, while `p` and `next` still conflict. Every shape that skips the
first copy has so far also coalesced; whether those two are actually coupled is
the open question.
