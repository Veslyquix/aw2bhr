#include "global.h"

struct Unk0802F588Ring { volatile u16 ring[512]; };

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
  volatile u16 *new_var;
  n = ((u16) a2) >> 1;
  chk = 0;
  cur = *gUnknown_08090C80;
  new_var = &gUnknown_030040CC;
  sum = n + 0x4fff;
  ((struct Unk0802F588Ring *) gUnknown_08090C84)->ring[cur] = 0x4fff;
  cur = (cur + 1) & 0x1ff;
  if (cur == (*gUnknown_08090C88))
  {
    return -1;
  }
  ((struct Unk0802F588Ring *) gUnknown_08090C84)->ring[cur] = n;
  cur = (cur + 1) & 0x1ff;
  if (cur == (*gUnknown_08090C88))
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
    if (cur == (*new_var))
    {
      return -1;
    }
  }

  gUnknown_0300410C = cur;
  return n;
}
