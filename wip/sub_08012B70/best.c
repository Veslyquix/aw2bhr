#include "global.h"

void sub_08012B70(u16 *dst, u16 *src, u16 x, u16 y, u16 add)
{
  u16 *p;
  u16 hdr;
  u16 w;
  u16 new_var2;
  u16 j;
  u16 h;
  u16 i;
  int new_var;
  new_var2 = *src;
  hdr = new_var2;
  w = (u8) hdr;
  h = hdr >> 8;
  dst = dst + x;
  do
  {
    new_var = y * 0x20;
    dst = dst + new_var;
    src++;
  }
  while (0);
  for (i = 0; i < h; i++)
  {
    p = dst + (i * 0x20);
    for (j = 0; j < w; j++)
    {
      *p = (*src) + add;
      p++;
      src++;
    }

  }

}
