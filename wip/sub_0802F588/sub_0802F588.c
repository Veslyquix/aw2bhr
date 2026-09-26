#include "global.h"

struct Unk0802F588Ring { volatile u16 ring[512]; };

/* Wave 74 (W74-C): fresh configured baseline was already size-exact 280/280,
 * but only 39.3% identical (170 differing bytes), not the stale 284-byte
 * metadata result.  Splitting `sum = n + 0x4fff` into two assignments and
 * reversing only the second ROM-pointer equality improves the independently
 * verified draft below to 40.4% (167/280 bytes differ), first difference
 * +0x0e.  Two drained `--current` permuter runs found no match.  Their apparent
 * 45.7% size-exact candidate was rejected: it executes `sum += prod` before
 * `prod` is initialized and removes the sum update from the checksum loop.
 * Initializing `chk` before `cur` grows the function to 288 bytes; tested
 * declaration reorderings were neutral. */

/* Wave 72 (W72-C): fresh configured verdict is size-exact 280/280.  Wrapping
 * either checksum RMW in a zero-trip do/while changes the accumulator allocno
 * but does not reach the ROM allocation.  The old permuter result that binds
 * gUnknown_030040CC scores higher positionally but is 284/280, so the
 * structurally exact COMPONENT_REF draft below remains the fixpoint. */

/* Wave 49 (W49-F).  NOT MATCHED: 272 bytes against the ROM's 280.  The control
 * flow, both loops, all five ring-full exits, the checksum arithmetic and the
 * literal pool are in the right order; the residual is 4 instructions, and 2 of
 * them are one identified codegen fact (below).
 *
 * This function is the send half of the link ring.  It writes a 0x4FFF marker,
 * the halfword count, a running sum and its complement, then the payload,
 * bailing with -1 the moment the write cursor laps gUnknown_030040CC.
 *
 * The RETURN TYPE was void in include/unknown-functions.h and is now int --
 * the body has two exits, -1 and the count, and void cannot produce either.
 * All eight callers discard the result, so the change is byte-neutral at every
 * one of them.
 *
 * The three pool symbols were settled by DEREFERENCING baserom.gba, not by
 * inference: 0x08090C80/84/88 hold 0x0300410C, 0x02025818 and 0x030040CC, so
 * they are a ROM table of pointers to the send ring and its two cursors -- the
 * same three objects this function also names directly further down.  Typed in
 * include/unknown-globals.h with that evidence.
 *
 * REMAINING DIFF -- 4 instructions (8 bytes) short:
 *  1. The two stores through gUnknown_08090C84 want a DEAD `ldrh` of the
 *     destination in front of the `strh`, and no pointer spelling produces
 *     one.  MEASURED, and it is a general fact worth keeping: agbcc emits the
 *     volatile dead-load-before-store ONLY for a decl-rooted lvalue (an array
 *     subscript or an aggregate member), NEVER for a store through a pointer
 *     variable.  Three spellings were probed and all three emit the bare
 *     `strh`: `p[i] = v` on `volatile u16 *const p`, `(*p)[i] = v` on
 *     `volatile u16 (*const p)[512]`, and a local `volatile u16 *` copy.
 *     The stores lower down in this same function, which name
 *     gUnknown_02025818 directly, DO get the dead load and are byte-exact --
 *     that contrast is the measurement.  So the original reaches the ring
 *     through something decl-rooted at that point; the untried candidate is a
 *     COMPONENT_REF (a struct with a `volatile u16 [512]` member, reached as
 *     `p->ring[i]`), which is the one shape the probe did not cover.
 *  2. Two instructions of register shuffling in the second loop's preheader
 *     (the ROM parks four values in sl/sb/r8/r7, this draft three) -- expected
 *     to move once (1) is fixed, since it is downstream of it.
 * Fixed since the measured attempt: the multiply operand order.  The ROM loads
 * the payload halfword FIRST and multiplies it by the counter
 * (`ldrh r0; adds r2,r3,#1; adds r1,r0,#0; muls r1,r2,r1`), so the source is
 * `src[i] * (i + 1)`, not `(i + 1) * src[i]`, which reverses the copy. */

int sub_0802F588(struct Unk0202575C *a1, int a2)
{
  u16 sum;
  u16 chk;
  int n;
  int i;
  int cur;
  int prod;
  n = ((u16) a2) >> 1;
  chk = 0;
  cur = *gUnknown_08090C80;
  sum = 0x4fff;
  sum = n + sum;
  ((struct Unk0802F588Ring *) gUnknown_08090C84)->ring[cur] = 0x4fff;
  cur = (cur + 1) & 0x1ff;
  if (cur == (*gUnknown_08090C88))
  {
    return -1;
  }
  ((struct Unk0802F588Ring *) gUnknown_08090C84)->ring[cur] = n;
  cur = (cur + 1) & 0x1ff;
  if ((*gUnknown_08090C88) == cur)
  {
    return -1;
  }
  for (i = 0; i < n; i++)
  {
    prod = ((u16 *) a1)[i] * (i + 1);
    sum += prod;
    chk += ~prod;
  }

  gUnknown_02025818[cur] = sum;
  cur = (cur + 1) & 0x1ff;
  if (cur == gUnknown_030040CC)
  {
    return -1;
  }
  gUnknown_02025818[cur] = chk;
  cur = (cur + 1) & 0x1ff;
  if (cur == gUnknown_030040CC)
  {
    return -1;
  }
  for (i = 0; i < n; i++)
  {
    gUnknown_02025818[cur] = ((u16 *) a1)[i];
    cur = (cur + 1) & 0x1ff;
    if (cur == gUnknown_030040CC)
    {
      return -1;
    }
  }

  gUnknown_0300410C = cur;
  return n;
}









