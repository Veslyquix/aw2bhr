#include "global.h"

/* PARKED.  The control flow is settled -- all four cases, every `||` pair and
 * every guard match the ROM instruction for instruction.  The residual is a
 * single REGISTER-ALLOCATION INVERSION and nothing else:
 *
 *   ROM:       r5 = x, r6 = y, r7 = ok, r8 = the kept neighbour coordinate,
 *              sb = the gUnknown_0808D818 pool address, r4 = scratch.
 *   candidate: ok lands in r8 and the kept neighbour in r7, so every
 *              `ok = 1` costs `movs rN,#1; mov r8,rN` instead of `movs r7,#1`
 *              and every `if (ok == 0)` costs `mov r1,r8; cmp r1,#0` instead of
 *              `cmp r7,#0`.  Same instruction sequence otherwise; the extra
 *              `mov`s are the whole difference.
 *
 * The two pseudos have near-identical allocno priority (refs / live_length) and
 * the candidate loses the tie.  Measured and NOT the lever:
 *   - `nx`/`ny` at function scope (2 long-lived pseudos)      -> ok still r8
 *   - `nx`/`ny` declared per case (8 short-lived pseudos)     -> ok still r8
 *   - one function-scope kept var + a per-case scratch        -> ok still r8
 *   - `u8 ok` instead of `int ok`                             -> ok still r8
 * decomp-permuter errored out on this one and was not retried; it is the
 * obvious next thing to try, since the instruction order is already correct.
 *
 * Also confirmed, and not worth re-deriving:
 *   - The tail is `r = 0; if (ok == 0) r = 1; return r;`, NOT `return ok == 0;`
 *     -- do_store_flag would add an `adds r0, rN, #0` the ROM does not have.
 *   - Cases 0xFD and 0x11D share their last block (_080096DC onward) purely by
 *     cross-jumping; the source is symmetric and both keep the neighbour in r8.
 *   - The `if (ok == 0) { if (A) {...} if (ok == 0 && B) {...} }` nesting is
 *     forced: the `A` guard's false edge goes to the NEXT guard while the outer
 *     `ok == 0` and the `B` guard's false edges both go to the exit, so the
 *     first is a nested `if` and only the second is an `&&`.
 *   - Each neighbour pair is one `if (E(..) || E(..)) ok = 1;`, which is what
 *     produces `bne <shared ok=1>` on the first and `beq <skip>` on the second.
 *
 * Promotion note: gUnknown_0808D818 is NOT a global.  The ROM word at
 * 0x0808D818 is 0x08499590, agbcc's -fforce-addr .rodata copy of
 * &gUnknown_08499590 (this function reads it seven times, which is why it gets
 * a pool word at all).  Promotion must carry "rodata": ["0x0808D818"].
 */
int sub_08009538(int x, int y)
{
  u8 *p;
  u8 *rows;
  unsigned int new_var2;
  u8 *tiles;
  int t;
  int off;
  short new_var;
  int tile;
  int ok = 0;
  int r;
  p = gUnknown_08499590;
  t = y * 2;
  rows = p + 0x417A;
  ok = *((u16 *) (rows + t));
  off = (ok + x) * 2;
  tiles = p + 0xA22;
  tile = *((u16 *) (tiles + off));
  switch (tile)
  {
    case 0xFC:
      if (y > 0)
    {
      int nx;
      int ny;
      ny = y - 1;
      if (sub_080015E4(x, ny))
      {
        ok = 1;
      }
      if (ok == 0)
      {
        if (x > 0)
        {
          nx = x - 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(nx, y))
          {
            ok = 1;
          }
        }
        if ((ok == 0) && (x < ((*((u16 *) gUnknown_08499590)) - 1)))
        {
          nx = x + 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(nx, y))
          {
            ok = 1;
          }
        }
      }
    }
      break;

    case 0xFD:
      if (x < ((*((u16 *) gUnknown_08499590)) + -1))
    {
      int nx;
      int ny;
      nx = x + 1;
      if (sub_080015E4(nx, y))
      {
        ok = 1;
      }
      if (ok == 0)
      {
        if (y > 0)
        {
          ny = y - 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(x, ny))
          {
            ok = 1;
          }
        }
        if ((ok == 0) && (y < ((*((u16 *) (gUnknown_08499590 + 2))) - 1)))
        {
          ny = y + 1;
          new_var = sub_080015E4(x, ny);
          if (sub_080015E4(nx, ny) || new_var)
          {
            ok = 1;
          }
        }
      }
    }
      break;

    new_var2 = 0;
    case 0x11C:
      if (y < ((*((u16 *) (gUnknown_08499590 + 2))) - 1))
    {
      int nx;
      int ny;
      ny = y + 1;
      if (sub_080015E4(x, ny))
      {
        ok = 1;
      }
      if (ok == 0)
      {
        if (x > 0)
        {
          nx = x - 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(nx, y))
          {
            ok = 1;
          }
        }
        if ((ok == new_var2) && (x < ((*((u16 *) gUnknown_08499590)) - 1)))
        {
          nx = x + 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(nx, y))
          {
            ok = 1;
          }
        }
      }
    }
      break;

    case 0x11D:
      if (x > 0)
    {
      int nx;
      int ny;
      nx = x - 1;
      if (sub_080015E4(nx, y))
      {
        ok = 1;
      }
      if (ok == 0)
      {
        if (y > 0)
        {
          ny = y - 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(x, ny))
          {
            ok = 1;
          }
        }
        if ((ok == 0) && (y < ((*((u16 *) (gUnknown_08499590 + 2))) - 1)))
        {
          ny = y + 1;
          if (sub_080015E4(nx, ny) || sub_080015E4(x, ny))
          {
            ok = 1;
          }
        }
      }
    }
      break;

  }

  r = 0;
  if (ok == 0)
  {
    r = 1;
  }
  return r;
}
