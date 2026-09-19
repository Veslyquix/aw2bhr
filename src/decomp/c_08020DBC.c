#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08020DBC.
 * sub_08020DBC @ 0x08020DBC
 */

bool8 sub_08020DBC(u8 a1, u8 x, u8 y)
{
  struct Map **mapPtr;
  int new_var2;
  struct Map *map;
  u16 n;
  u8 *new_var;
  int idx;
  int ty;
  int rowOff;
  n = 0;
  if (gUnknown_03003FC0.unk0d == 0)
  {
    return 1;
  }
  mapPtr = &gMap;
  map = *mapPtr;
  ty = y * 2;
  rowOff = 0x417a;
  new_var2 = 0x13;
  ;
  if (map->visible[(*((u16 *) ((((u8 *) map) + rowOff) + ty))) + x] == 0)
  {
    return 0;
  }
  if (((map->terrain[(*((u16 *) ((((u8 *) map) + rowOff) + ty))) + x] & 0x1f) != 4) && ((map->terrain[(*((u16 *) ((((u8 *) map) + rowOff) + ty))) + x] & 0x1f) != new_var2))
  {
    return 1;
  }
  if ((sub_08043050(a1) & 8) != 0)
  {
    return 1;
  }
  if (x != 0)
  {
    n = sub_08025744(x - 1, y);
  }
  if (y != 0)
  {
    n += sub_08025744(x, y - 1);
  }
  if (x < ((*mapPtr)->width - 1))
  {
    n += sub_08025744(x + 1, y);
  }
  if (y < ((*mapPtr)->height - 1))
  {
    n += sub_08025744(x, y + 1);
  }
  if (n != 0)
  {
    return 1;
  }
  idx = (*((u16 *) ((((u8 *) (*mapPtr)) + rowOff) + ty))) + x;
  if ((*mapPtr)->unit[idx] == 0)
  {
    return 0;
  }
  new_var = &gUnknown_08499594[(*mapPtr)->unit[idx]].unk00;
  if (((u8) ((*new_var) - 0x10)) <= 4)
  {
    return 1;
  }
  return 0;
}
