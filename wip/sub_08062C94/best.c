#include "global.h"

/* gUnknown_02029C20's first 0x32 bytes are a VOLATILE u16[0x19] counter table:
 * every store to them in the ROM carries the wave-47 dead load, and every store
 * to the stack twin beside them does not. */
struct Unk62C94Tab
{
    /* 0x00 */ volatile u16 v[0x19];
};

#define TAB ((struct Unk62C94Tab *)gUnknown_02029C20)

void sub_08062C94(void)
{
  u16 loc[0x19];
  int i;
  int t;
  int u;
  int k;
  int m;
  for (i = 0; i <= 0x18; i++)
  {
    loc[i] = (u = 0);
    ((struct Unk62C94Tab *) gUnknown_02029C20)->v[i] = 0;
  }

  for (t = 0; t <= 3; t++)
  {
    if (((gUnknown_08499598[gUnknown_030033EC].unk2c >> t) & 1) == 0)
    {
      for (u = t * 0x40; u < ((t * 0x40) + 0x40); u++)
      {
        if (gUnknown_08499594[u].unk00 != 0)
        {
          loc[gUnknown_08499594[u].unk00] += gUnknown_08499594[u].unk04_0;
        }
      }

    }
    else
    {
      k = t * 0x40;
      for (u = k; u < (k + 0x40); u++)
      {
        if (gUnknown_08499594[u].unk00 != 0)
        {
          ((struct Unk62C94Tab *) gUnknown_02029C20)->v[gUnknown_08499594[u].unk00] += gUnknown_08499594[u].unk04_0;
        }
      }

    }
  }

  for (k = 1; k < (0x18 + 1); k++)
  {
    if (((struct Unk62C94Tab *) gUnknown_02029C20)->v[k] != 0)
    {
      for (m = 1; m <= 0x18; m++)
      {
        ((struct Unk62C94Tab *) gUnknown_02029C20)->v[k] -= sub_08043070(gUnknown_08499598[gUnknown_030033EC].unk1d, gUnknown_08499598[gUnknown_030033EC].unk1e, m, k, 0) * loc[m];
      }

    }
  }

}
