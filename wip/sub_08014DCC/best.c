#include "global.h"

/* PARKED, SIZE-EXACT at 120/120, 70.0% (wave 73, W73-E). Waves 40, 42 (W42-D),
 * 51 (W51-J), 73 (W73-C), 73 (W73-E). W73-C left this size-exact at 10.0%.
 *
 * THIS BODY IS A DECOMP-PERMUTER RESULT WITH ONE HAND CORRECTION. DO NOT TIDY
 * IT. Three chained runs took best.c 52.5 -> 63.33 -> 65.83 -> 68.33, and the
 * hand step that made the last of those USABLE took it to 70.0%. Mutations kept,
 * all semantically inert:
 *   - `total = size; total = total + 0x10;`  (split, not folded)
 *   - `new_var2 = size;` bound before the guard and again at _scan_done
 *   - `p->next += 0;`  -- a read-modify-write of the same value
 *   - `next = (p = p->next);` folding the advance and the exit read together
 *   - `total = 0; q->used = total;` -- materialising the literal zero through a
 *     variable that is dead afterwards
 * Re-run `try_match` after ANY cosmetic edit here.
 *
 * TWO OF THE THREE PERMUTER GAINS ON THIS FUNCTION WERE SEMANTICALLY WRONG, and
 * that is the main thing to carry forward (see the "A permuter GAIN is not a
 * permuter WIN" chapter of docs/agbcc-codegen.md):
 *   - run 2 (65.83%) moved `new_var = p->size;` INSIDE the if-body whose guard
 *     reads `new_var`, so the guard read an uninitialised value;
 *   - run 3 (68.33%) ended the function `return (void *) total;`, where `total`
 *     is `size + 0x10` on both NULL-returning paths, not 0. Correcting just that
 *     one return to `return (void *) 0;` and keeping everything else is what
 *     produced this 70.0% body -- so an invalid gain can still be worth reading:
 *     three of its four mutations were sound.
 *
 * THE LEVER W73-C FOUND, `goto` INSTEAD OF `break` FOR A TRAILING EXIT TEST, is
 * what made this function size-exact and therefore reachable by the permuter at
 * all. A user `goto` to a label after the loop is not a jump to the loop's own
 * end_label, so expand_end_loop does not roll the exit and does not rotate the
 * `p = next` copy up to the loop header. Wave 42's ruled-out list contained a
 * goto INTO the loop past the copy; a goto OUT had never been tried.
 *
 * REMAINING RESIDUAL, now small and legible (36 of 120 bytes, first difference
 * at +0x6):
 *   - The ROM rounds `size` UP IN PLACE in r1 (`adds r1,#15; ands r1,r0`) and
 *     then makes total as a copy (`adds r7,r1,#0; adds r7,#16`). This candidate
 *     rounds into r3, copies BACK to r1 and makes total in r3, and pays an extra
 *     `adds r7,r1,#0` for `new_var2`.
 *   - At the tail the ROM writes `q->used` with `str r3,[r2,#8]` where r3 still
 *     holds `next` -- which is provably NULL at _scan_done, since that label is
 *     only reached by the `next == NULL` goto. This candidate emits
 *     `movs r3,#0; str r3,[r0,#8]`. Wave 42 called this reload_cse and not
 *     something to author, but the value the ROM reuses is `next`, not a zero
 *     constant it happened to have, so `q->used = (u32)next;` is a semantically
 *     valid probe nobody has run. THAT IS THE NEXT PROBE.
 *
 * MEASURED THIS WAVE AND DO NOT REPEAT IT (W73-E): deleting `new_var2` and using
 * `size` directly at all three sites costs FOUR BYTES (120 -> 116, 13.3%) and
 * drops r7 out of the push mask. It is not redundant -- it is buying a register.
 *
 * WHAT IS SETTLED -- do not re-derive any of it:
 *   - The 16-byte header {next, size, used, filler} and every statement of the
 *     body; the instruction stream is the ROM's.
 *   - Basic-block placement is NOT what is left: the ROM places the latch
 *     physically ahead of the header so the back edge falls through and pays
 *     `bne <header>; b <ret0>` at the guard, this candidate falls into the
 *     header and pays a `b` at the loop bottom -- seven instructions either way.
 *   - The tail layout: a single trailing `return NULL` is what puts the shared
 *     `movs r0, #0` block AFTER the `adds r0, r5, #0; adds r0, #0x10` tail.
 *   - The round-up is on the `size` PARAMETER in place; `total = size + 0x10` is
 *     a real local; the compares are unsigned, so size and bestSize are u32.
 *
 * RULED OUT BY MEASUREMENT (wave 42) -- all coalesce `p = next`:
 *   - `while (1) { body; next = p->next; if (!next) break; p = next; }`
 *   - `for (;; p = next) { body; next = p->next; if (!next) break; }`
 *     (gcc canonicalises these two together)
 *   - the same with an explicit `goto` INTO the loop past the copy
 *   - `do { body; next = p->next; p = next; } while (next != NULL);`
 *   - wave 42's own fixpoint, `next` seeded before the loop with `p = next` as
 *     the first body statement: keeps them apart but runs the copy on the first
 *     iteration too, which is the -4. Superseded by this draft. */

struct MemBlock
{
    /* 0x00 */ struct MemBlock *next;
    /* 0x04 */ u32 size;
    /* 0x08 */ u32 used;
    /* 0x0c */ u32 filler_0c;
};

void *sub_08014DCC(int head, int size)
{
  struct MemBlock *best;
  int new_var2;
  struct MemBlock *p;
  struct MemBlock *q;
  struct MemBlock *next;
  struct MemBlock *bestNext;
  int new_var;
  u32 total;
  u32 bestSize;
  best = (void *) ((unsigned char) 0);
  p = (struct MemBlock *) head;
  size = (size + 15) & (~15);
  total = size;
  total = total + 0x10;
  bestSize = 0;
  bestNext = (void *) 0;
  new_var2 = size;
  if (new_var2 != 0)
  {
    new_var = size;
    while (1)
    {
      if ((p->used == 0) && (p->size >= ((u32) new_var2)))
      {
        if ((bestSize > p->size) || (bestSize == 0))
        {
          best = p;
          p->next += 0;
          bestSize = p->size;
          bestNext = best->next;
        }
      }
      next = (p = p->next);
      if (((void *) 0) == next)
      {
        goto _scan_done;
      }
    }

    _scan_done:
    if (bestSize != 0)
    {
      if (bestSize >= (new_var2 + 0x20))
      {
        q = (struct MemBlock *) (((u8 *) best) + total);
        best->next = q;
        best->size = new_var;
        best->used = 1;
        new_var2 = new_var;
        q->next = bestNext;
        q->size = bestSize - total;
        total = 0;
        q->used = total;
      }
      else
      {
        best->next = bestNext;
        best->size = bestSize;
        best->used = 1;
      }
      return best + 1;
    }

  }
  return (void *) 0;
}
