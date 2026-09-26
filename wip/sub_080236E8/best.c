#include "global.h"
#include "hardware.h"

/* W84-B: adopted verbatim from the chained wave-84 permuter run that moved the
 * configured draft 76.27% -> 78.2% (size-exact 316/316, first difference still
 * +0xe). Three load-bearing mutations, all semantically exact:
 *   1. the high half of `next` is computed into its own statement-level `n`
 *      ((u16)(unk02 + tab[dir][1]) << 16) BEFORE the |=;
 *   2. the first movement block's two stores are wrapped in do { } while (0);
 *   3. the second movement block's += is spelled (&gUnknown_030032C4)->unk02.
 * Do NOT tidy any of them -- wave-80 precedent: folding these back regresses.
 * Residual remains low-half truncation scheduling + register permutation. */

struct Map236E8
{
    /* 0x0000 */ u8 filler_00[0x2852];
    /* 0x2852 */ u8 cells[0x417A - 0x2852];
    /* 0x417A */ u16 rows[1];
};

void sub_080236E8(void)
{
  struct Map236E8 *map;
  int keys;
  int dir;
  u32 next;
  int new_var;
  int n;
  if (((*((u16 *) (gUnknown_08499590 + 0x10))) & 0xf) != 0)
  {
    return;
  }
  keys = gpKeySt->unk02;
  dir = ((((u16) keys) >> 2) >> 2) & 0xf;
  map = (struct Map236E8 *) gUnknown_08499590;
  next = (u16) (gUnknown_030033E4.unk00 + gUnknown_08499C7C[dir][0]);
  n = ((u16) (gUnknown_08499C7C[dir][1] + gUnknown_030033E4.unk02)) << 16;
  next |= n;
  if (((((s8) map->cells[map->rows[gUnknown_030033E4.unk02] + gUnknown_030033E4.unk00]) > 0) && (map->cells[map->rows[next >> 16] + ((u16) next)] > 0x78)) && (((u16) keys) != gpKeySt->held))
  {
    return;
  }
  n = gUnknown_030033E4.unk00 + gUnknown_08499C7C[dir][0];
  if ((n >= 0) && (n < (*((u16 *) gUnknown_08499590))))
  {
    do
    {
      gUnknown_030032C4.unk00 += gUnknown_08499C7C[dir][0] * 4;
      gUnknown_030033E4.unk00 = n;
    }
    while (0);
    do
    {
      if (gUnknown_08499C7C[dir][0] != (new_var = 0))
      {
        sub_0803B4DC(0x6a);
      }
    }
    while (0);
  }
  n = gUnknown_030033E4.unk02 + gUnknown_08499C7C[dir][1];
  if ((n >= 0) && (n < (*((u16 *) (gUnknown_08499590 + 2)))))
  {
    (&gUnknown_030032C4)->unk02 += gUnknown_08499C7C[dir][1] * 4;
    gUnknown_030033E4.unk02 = n;
    if (gUnknown_08499C7C[dir][1] != 0)
    {
      sub_0803B4DC(0x6a);
    }
  }
}
