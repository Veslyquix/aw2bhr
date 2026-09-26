#include "global.h"

void sub_080073F8(int a1, int a2)
{
  struct Unk0200B0B0 *p;
  struct Unk0200B0D0 *d;
  struct Unk0200B224 *e;
  unsigned short new_var3;
  int v = -1;
  int w = 0;
  int n;
  int m;
  int i;
  int new_var;
  int new_var2;
  int row;
  int idx;
  {
    int test = a1;
    if (test != 0)
    {
      goto after_switch;
    }
  }
  switch (a2)
  {
    case 6:

    case 8:

    case 10:

    case 11:

    case 14:
      v = 0;
      w = 0;
      break;

    case 38:

    case 40:

    case 42:

    case 43:

    case 46:
      v = 0x20;
      w = 1;
      break;

    case 70:

    case 72:

    case 74:

    case 75:

    case 78:
      v = 0x40;
      w = 2;
      break;

    case 102:

    case 104:

    case 106:

    case 107:

    case 110:
      v = 0x60;
      w = 3;
      break;

    case 134:

    case 136:

    case 138:

    case 139:

    case 142:
      v = 0x80;
      w = 4;
      break;

    default:
      v = -1;
      break;

  }

  after_switch:
  for (i = 0; i < 10; i++)
  {
    gUnknown_0200B0D0[i].unk00 &= ~1;
  }


  p = gUnknown_0200B0B0;
  row = p->unk3a;
  if (a1 == 0)
  {
    idx = p->unk36;
  }
  else
  {
    idx = p->unk38;
  }
  n = 8;
  if (a1 == 0)
  {
    n = 10;
  }
  m = 7;
  if (a1 == 0)
  {
    m = 9;
  }
  e = &gUnknown_0200B224[idx];
  for (i = 0; i < m; i++)
  {
    d = &gUnknown_0200B0D0[row];
    d->unk00 &= ~1;
    new_var3 = (unsigned short) i;
    d->unk06 = new_var3;
    d->unk00 |= 8;
    d->unk10 = 0x8200;
    if (gUnknown_0200B0B0->unk07 == 0)
    {
      d->unk0c = gUnknown_084886F8[a1][4] << 8;
      d->unk08 = gUnknown_084886F8[a1][i];
      d->unk14 = 0;
    }
    else
    {
      d->unk0c = gUnknown_084886F8[a1][3] << 8;
      d->unk08 = gUnknown_084886F8[a1][i];
      new_var2 = 0;
      d->unk14 = new_var2;
    }
    d->unk04 = e->unk00;
    if ((a1 == new_var2) && (v >= 0))
    {
      new_var = ((*((volatile u16 *) (&d->unk04))) & 0x1f) | v;
      d->unk04 = new_var;
    }
    e++;
    idx++;
    if (a1 == 0)
    {
      if (idx > 0x10)
      {
        do
        {
          e -= 0x11;
        }
        while (0);
        idx -= 0x11;
      }
    }
    else
      if (idx > 0x13)
    {
      e -= 0x14;
      idx -= 0x14;
    }
    row++;
    if (row >= n)
    {
      row -= n;
    }
  }

  if ((a1 == 0) && (v >= 0))
  {
    sub_080077EC(a2, w);
    sub_08007B74();
  }
}
