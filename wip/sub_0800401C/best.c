#include "global.h"

struct Unk3F44Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 plane[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 cell[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F44Map *)gUnknown_08499590)

void sub_0800401C(int cx, int cy, int w, int h, int t)
{
  int x;
  int y;
  int rx;
  int ry;
  int new_var;
  int tt;
  tt = t;
  y = cy - (h >> 1);
  new_var = h;
  if (y < 0)
  {
    y = 0;
  }
  for (ry = new_var; ry > 0; ry--)
  {
    x = cx - (w >> 1);
    if (x < 0)
    {
      x = 0;
    }
    for (rx = w; rx > 0; rx--)
    {
      if ((w <= 3) && (new_var <= 3))
      {
        if (w == 3)
        {
          sub_08003F44(x, y, tt);
        }
      }
      else
        if (((ry != new_var) && (ry != 1)) || ((rx != w) && (rx != 1)))
      {
        sub_08003F44(x, y, tt);
      }
      x++;
      if (x >= ((struct Unk3F44Map *) gUnknown_08499590)->width)
      {
        break;
      }
    }

    y++;
    if (y >= ((struct Unk3F44Map *) gUnknown_08499590)->height)
    {
      break;
    }
  }

}
