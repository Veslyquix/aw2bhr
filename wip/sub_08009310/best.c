#include "global.h"

/* PARKED at 474 of 476 bytes.  Every instruction of the ROM is present, in the
 * ROM's order, with the ROM's operands.  Two residuals remain, and they are one
 * fact, not two:
 *
 *   1. The `default:` arm is missing the ROM's `adds r6, r0, #0` after
 *      `bl sub_08008D70` (-2 bytes).  That copy means the ROM binds the result
 *      to a pseudo that global_alloc placed in a CALLEE-SAVED register, i.e. a
 *      variable referenced from more than one basic block.  Writing it as the
 *      function-scope `n` (the same variable the second switch and the tail
 *      use) DOES produce the copy -- and then cross-jumping folds the arm's
 *      whole `cmp/ble/b` tail into a single `b` to the shared tail at
 *      _080094D4, which is 4 bytes SHORT instead of 2.  Writing it as a
 *      block-local `int k` (below) blocks the merge -- the two tails compare
 *      different pseudos, so rtx_equal_p fails -- but then `k` is a local
 *      allocno, gets r0, and the copy disappears.  Both spellings were
 *      measured.  No spelling found so far gives the copy AND blocks the merge.
 *
 *   2. As a consequence, `n` lands in r7 and the gUnknown_0808D814 pool-address
 *      pseudo in r6, where the ROM has them the other way round, and the two
 *      shared exit blocks are emitted in the opposite order (candidate:
 *      `bgt -> return 1` with `return 0` falling through; ROM: `ble -> return 0`
 *      with `return 1` falling through, which also swaps 0x1c8/0x1d4 in the
 *      second jump table).  Both are zero-byte differences that should follow
 *      the moment residual 1 is closed.
 *      Flipping the source tail to `if (n <= 0) return 0; return 1;` was tried
 *      and is WORSE: gcc then places the `return 1` block inline at 0x9c.
 *
 * Ruled out and load-bearing (do not undo these):
 *   - `d = sub_08008D14(x, y); if (d & 6)` -- the binding is REQUIRED.  Written
 *     inline as `if (sub_08008D14(x, y) & 6)` agbcc folds it to
 *     `mov r1,#6; and r1,r1,r0` (2 insns); the ROM's
 *     `adds r1,r0,#0; movs r0,#6; ands r0,r1` (3 insns) needs the local.
 *     The same lever is what closed sub_08009264 this wave.
 *   - The `case 2/4/6` membership test MUST be one `||` with a single
 *     `n = 0x16;` store, which is why the comma operators are here: the ROM's
 *     first block does `beq _080094D2`, jumping INTO the store that the second
 *     block falls through to.  Two separate `if`s emit two stores and no merge;
 *     `n = 0x16; break;` merges them but is then jump-threaded away entirely
 *     (the store dies and both arms become `b <return 1>`), because a store
 *     followed by a JUMP gets const-propagated through `if (n > 0)` while a
 *     store followed by a FALL-THROUGH does not.  Locals cannot be assigned
 *     inside a `||` operand any other way -- the exemplar's spelling
 *     (bind `rows`/`cells`) is required for the address arithmetic, see
 *     include/unknown-globals.h on gUnknown_08499590.
 *   - The `case 0/8/9` arm has NO store at all: all three of its success paths
 *     are `return 1` in the ROM (the 0x13 value is fully jump-threaded away),
 *     which is why it is spelled with `return 1;` and the 2/4/6 arm is not.
 *
 * Promotion note: gUnknown_0808D814 is NOT a global.  The ROM word at
 * 0x0808D814 is 0x08499590, i.e. agbcc's -fforce-addr .rodata copy of
 * &gUnknown_08499590.  This file names the global honestly, so promotion must
 * carry "rodata": ["0x0808D814"].
 */
int sub_08009310(int x, int y)
{
  int t;
  int terrain;
  int n;
  int d;
  {
    u8 *p;
    u8 *rows;
    u8 *cells;
    int idx;
    p = gUnknown_08499590;
    t = y * 2;
    rows = p + 0x417A;
    idx = (*((u16 *) (rows + t))) + x;
    cells = p + 0x1432;
    terrain = *(cells + idx);
  }
  if (terrain == 0xC)
  {
    return 1;
  }
  if (((terrain == 7) || (terrain == 0xD)) || (terrain == 0x13))
  {
    switch (sub_08008D14(x, y))
    {
      case 1:

      case 2:

      case 4:

      case 8:
        sub_08008CB8(x, y);
        return 1;

      case 3:

      case 5:

      case 10:

      case 12:
        return 0;

      case 6:

      case 7:

      case 9:

      case 11:

      case 13:

      case 14:
        return 1;

      default:
      {
        int k;
        k = sub_08008D70(x, y);
        if ((k + 1) > (0 + 1))
        {
          return 1;
        }
        return 0;
      }

    }

  }
  if (sub_08009B38(x, y) == 0)
  {
    return 0;
  }
  n = 0;
  switch (sub_08008CB8(x, y))
  {
    case 0:

    case 8:

    case 9:
      d = sub_08008D14(x, y);
      n = d & 6;
      if (n)
    {
      return 1;
    }
      if (x > 0)
    {
      u8 *p;
      u8 *rows;
      u8 *cells;
      int t2;
      int idx;
      p = gUnknown_08499590;
      terrain = 0x1432;
      t2 = y * 2;
      rows = p + 0x417A;
      idx = *((u16 *) (rows + t2));
      idx--;
      idx += x;
      cells = p + terrain;
      if ((*(cells + idx)) == 0xC)
      {
        return 1;
      }
    }
    {
      u8 *pe;
      pe = gUnknown_08499590;
      if (x < ((*((u16 *) pe)) - 1))
      {
        u8 *rows;
        u8 *cells;
        int t2;
        int idx;
        t2 = y * 2;
        rows = pe + 0x417A;
        idx = *((u16 *) (rows + t2));
        idx++;
        idx += x;
        cells = pe + 0x1432;
        if ((*(cells + idx)) == 0xC)
        {
          return 1;
        }
      }
    }
      break;

    case 2:

    case 4:

    case 6:
    {
      u8 *p;
      u8 *rows;
      u8 *cells;
      u8 *pe;
      u8 *rows2;
      u8 *cells2;
      int t2;
      int t3;
      int idx;
      int idx2;
      d = sub_08008D14(x, y);
      if (d & 9)
      {
        return 1;
      }
      if (((y > 0) && ((p = gUnknown_08499590, t2 = (y - 1) * 2, rows = p + 0x417A, idx = (*((u16 *) (rows + t2))) + x, cells = p + 0x1432, (*(cells + idx)) == 0xC))) || ((pe = gUnknown_08499590, (y < ((*((u16 *) (pe + 2))) - 1)) && ((t3 = (y + 1) * 2, rows2 = pe + 0x417A, idx2 = (*((u16 *) (rows2 + t3))) + x, cells2 = pe + 0x1432, (*(cells2 + idx2)) == 0xC)))))
      {
        n = 0x16;
      }
    }
      break;

  }

  if (n > 0)
  {
    return 1;
  }
  return 0;
}
