#include "global.h"
#include "hardware.h"

/* W84-B adopted draft: chained decomp-permuter round 3 result, configured
 * profile 316/316 size-exact at 79.75% (first difference +0xe), improved from
 * the wave-parked 76.27% baseline across three shell-run chains (76.27 ->
 * 78.2 -> 79.4 -> 79.75). Mutations are semantically exact and must NOT be
 * tidied (wave-73/80 rule): statement-level n for the high half before |=,
 * do { } while (0) wrappers around movement-block stores, pointer-deref
 * spellings (&gUnknown_030032C4)->unkNN, and possibly further artifacts the
 * permuter added -- adopt verbatim from work/sub_080236E8/best.c.
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
