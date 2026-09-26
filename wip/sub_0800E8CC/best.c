#include "global.h"

/* PARKED at 83.11%, wave 67. Configured candidate and target are both exactly
 * 296 bytes. The semantic five-neighbour transcription is complete, all four
 * call-argument copy sequences are present, and the prologue/epilogue now have
 * the target's three saved high-register slots.
 *
 * The remaining 50 differing bytes are a register-allocation cycle. The ROM
 * saves sl/sb/r8 and uses sb for 0x417A; this draft saves sl/r9/r8 and uses r9.
 * In the first two blocks the ROM keeps t*2 in r2 and the row address/index in
 * r0, while this draft uses r0 for t*2 and r2 for the row address/index. The
 * same cycle propagates through the centre, y+1 and y+2 blocks; instruction
 * count, control flow, calls, constants, and pool order are exact.
 *
 * WHAT IS CONFIRMED against the target:
 *  - it ORs together five cells at y-2, y-1, y, y+1, y+2, each tested == 4 and
 *    each contributing sub_0800119C(x, yy, 4) shifted by 4, 3, 2, 1, 0;
 *  - the first contribution is an ASSIGNMENT (`lsls r6, r0, #4`) and the rest
 *    are `orrs`, the same first-neighbour rule as src/decomp/c_08008CB8.c;
 *  - the y-2 and y-1 blocks are guarded `y > 2` and `y > 1`, the y+1 and y+2
 *    blocks by `y < height - 1` and `y < height - 2`;
 *  - blocks 1, 2 and 3 use the advance-twice pointer shape and blocks 4 and 5
 *    preserve the base.
 *
 * Wave 67 ruled out declaration-order changes, commuted row-address
 * expressions, split-load temporaries, pointer-advance spelling, and a struct
 * member view. Swapping row/off assignment order changes scheduling away from
 * the target without breaking the cycle. A prior 300-second permuter campaign
 * already exhausted this exact-size allocation species; do not repeat it
 * without a genuinely new allocator lever.
 */

int sub_0800E8CC(int x, int y)
{
  u8 *p;
  u8 *rows;
  u8 *cells;
  int t;
  int new_var;
  int new_var2;
  int idx;
  int off;
  int r;
  r = 0;
  if (y > 2)
  {
    gUnknown_08499590 += 0;
    p = gUnknown_08499590;
    t = y - 2;
    off = t * 2;
    rows = p + 0x417A;
    idx = (*((u16 *) (rows + off))) + x;
    p += 0x1432;
    p += idx;
    if ((*p) == 4)
    {
      r = sub_0800119C(x, t, 4) << 4;
    }
  }
  if (y > 1)
  {
    p = gUnknown_08499590;
    t = y - 1;
    new_var2 = t * 2;
    rows = p + 0x417A;
    idx = (*((u16 *) ((cells = rows) + new_var2))) + x;
    p += 0x1432;
    p += idx;
    if ((*p) == 4)
    {
      r |= sub_0800119C(x, t, 4) << 3;
    }
  }
  p = gUnknown_08499590;
  off = y * 2;
  rows = p + 0x417A;
  idx = (*((u16 *) (rows + off))) + x;
  p += 0x1432;
  p += idx;
  if ((*p) == 4)
  {
    r |= sub_0800119C(x, y, 4) << 2;
  }
  p = gUnknown_08499590;
  if (y < ((*((u16 *) (p + 2))) - 1))
  {
    t = y + 1;
    off = t * 2;
    rows = p + 0x417A;
    if (1)
    {
      idx = (*((u16 *) (rows + off))) + x;
    }
    cells = p + 0x1432;
    if ((*(cells + idx)) == 4)
    {
      new_var = sub_0800119C(x, t, 4);
      r |= new_var << 1;
    }
  }
  p = gUnknown_08499590;
  if (y < ((*((u16 *) (p + 2))) - 2))
  {
    t = y + 2;
    off = t * 2;
    rows = p + 0x417A;
    idx = (*((u16 *) (rows + off))) + x;
    cells = p + 0x1432;
    if ((*(cells + idx)) == 4)
    {
      r |= sub_0800119C(x, t, 4);
    }
  }
  return r;
}
