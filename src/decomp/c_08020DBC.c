#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08020DBC.
 * sub_08020DBC @ 0x08020DBC
 */

struct Unk20DBCMap
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0012 - 0x0004];
    /* 0x0012 */ u8 unitId[0x1432 - 0x0012];
    /* 0x1432 */ u8 terrain[0x1E42 - 0x1432];
    /* 0x1E42 */ u8 plane1E42[0x417A - 0x1E42];
    /* 0x417A */ u16 rowOffset[1];
};

bool8 sub_08020DBC(u8 a1, u8 x, u8 y)
{
  u8 **mapPtr;
  int new_var2;
  struct Unk20DBCMap *map;
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
  mapPtr = &gUnknown_08499590;
  map = (struct Unk20DBCMap *) (*mapPtr);
  ty = y * 2;
  rowOff = 0x417a;
  new_var2 = 0x13;
  ;
  if (map->plane1E42[(*((u16 *) ((((u8 *) map) + rowOff) + ty))) + x] == 0)
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
  if (x < (((struct Unk20DBCMap *) (*mapPtr))->width - 1))
  {
    n += sub_08025744(x + 1, y);
  }
  if (y < (((struct Unk20DBCMap *) (*mapPtr))->height - 1))
  {
    n += sub_08025744(x, y + 1);
  }
  if (n != 0)
  {
    return 1;
  }
  idx = (*((u16 *) ((((u8 *) ((struct Unk20DBCMap *) (*mapPtr))) + rowOff) + ty))) + x;
  if (((struct Unk20DBCMap *) (*mapPtr))->unitId[idx] == 0)
  {
    return 0;
  }
  new_var = &gUnknown_08499594[((struct Unk20DBCMap *) (*mapPtr))->unitId[idx]].unk00;
  if (((u8) ((*new_var) - 0x10)) <= 4)
  {
    return 1;
  }
  return 0;
}
