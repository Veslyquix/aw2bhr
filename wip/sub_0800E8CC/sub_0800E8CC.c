#include "global.h"

/* PARKED at 92.23%, wave 73 (W73-E). Configured candidate and target are both
 * exactly 296 bytes. The semantic five-neighbour transcription is complete, all
 * four call-argument copy sequences are present, and the prologue/epilogue have
 * the target's three saved high-register slots.
 *
 * THIS BODY IS A DECOMP-PERMUTER RESULT AND MUST NOT BE TIDIED. Two chained
 * runs took it 83.11% -> 91.22% -> 92.23%, each starting from the previous
 * `best.c` (the wave-59 method). Every mutation it kept is semantically inert
 * and each one is worth bytes:
 *   - `gUnknown_08499590 += 0;`  (pre-existing lifetime probe, byte-neutral)
 *   - `(cells = rows)` inside the second block's index expression -- a DEAD
 *     assignment; `cells` is not read in that block
 *   - `new_var2 = t * 2;` bound out of that same index expression
 *   - `new_var = sub_0800119C(x, t, 4); r |= new_var << 1;` in the y+1 block,
 *     splitting the call result off the shift
 * Folding any of these back cost bytes when it was tried on other functions
 * (see "do not tidy a permuter win" in docs/agbcc-codegen.md). Re-run
 * `try_match` after ANY cosmetic edit here.
 *
 * REMAINING DIFF: a register-allocation cycle. The ROM uses sb for the 0x417A
 * constant; in the first two blocks it keeps t*2 in r2 and the row
 * address/index in r0 while this draft uses r0 for t*2 and r2 for the row
 * address/index. Instruction count, control flow, calls, constants and pool
 * order are exact.
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
 * member view. Its instruction not to run the permuter again is REFUTED -- see
 * data/parked.json.  *
 * WAVE 77, W77-L. Re-verified unchanged: 296/296, 23 differing bytes, first
 * difference at +0x4e. NEWLY RULED OUT: binding the 0x417A displacement to one
 * shared `int k = 0x417A;` local used by all five blocks -- the obvious way to
 * give that constant a single 5-reference pseudo that could win the ROM's sb --
 * is catastrophic at 261 of 296 differing (11.8%), still size-exact. gcc
 * const-propagates the local. The ROM's sb holding 0x417A is an allocator
 * outcome, not a source-visible binding.
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
