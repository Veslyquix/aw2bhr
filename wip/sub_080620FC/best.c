#include "global.h"

struct Unk620FCRec
{
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
};

void sub_080620FC(int a1, int a2)
{
  u8 *new_var5;
  int x;
  int y;
  int new_var6;
  int new_var7;
  int new_var4;
  int n;
  int k;
  int i;
  int j;
  unsigned short new_var2;
  u8 *p;
  int new_var;
  u8 *rows;
  u8 *cells;
  int t;
  u8 *new_var8;
  u8 *new_var9;
  int new_var10;
  int new_var3;
  unsigned int off;
  n = 0;
  k = 0;
  sub_080581A4(gUnknown_08499590 + 0x3262, 0);
  sub_0801F92C(gUnknown_08499590 + 0x2852);
  sub_08062330();
  while ((u8) sub_080623C4(&x, &y))
  {
    gUnknown_030013EC(x, y, a2, 0x78, 0);
    n = gUnknown_02029ED8[(k + (a1 * 0x20)) + (gUnknown_030033EC * 0xc00)];
    for (j = 0; j < (*((u16 *) (new_var8 = gUnknown_08499590 + 2))); j++)
    {
      for (i = 0; i < (*((u16 *) gUnknown_08499590)); i++)
      {
        if ((gUnknown_03003340[j][i] + 1) > 0)
        {
          p = gUnknown_08499590;
          t = 2;
          t = j * t;
          y = t;
          new_var9 = p;
          rows = new_var9 + 0x417a;
          off = (*((u16 *) (rows + y))) + i;
          cells = p + 0x1432;
          new_var4 = cells[off] & 0x1f;
          if (gUnknown_085767D5[new_var4] != 0)
          {
            cells = p + 0x3262;
            if (cells[off] == 0)
            {
              ((struct Unk620FCRec *) (&gUnknown_02029ED8[((n * (new_var2 = 8)) + (a1 * 0x3e0)) + (gUnknown_030033EC * 0xc00)]))->x = i;
              ((struct Unk620FCRec *) (&gUnknown_02029ED8[((n * new_var2) + (a1 * 0x3e0)) + (gUnknown_030033EC * 0xc00)]))->y = j;
              p = gUnknown_08499590;
              new_var5 = p;
              rows = new_var5 + 0x417a;
              off = (*((u16 *) (rows + y))) + off;
              new_var = (n * new_var2) + (a1 * 0x3e0);
              new_var6 = off + 0x193a;
              *((u8 **) (&gUnknown_02029F3C[new_var + (gUnknown_030033EC * 0xc00)])) = &p[new_var6];
              t = (*((u16 *) (rows + y))) + i;
              new_var7 = t;
              cells = new_var5 + 0x3262;
              cells[new_var7] = 0xff;
              off = i;
              n++;
              if (n > 0x7a)
              {
                goto done;
              }
            }
          }
        }
      }

    }

    done:
    ((struct Unk620FCRec *) (&gUnknown_02029ED8[((i = n * new_var2) + (a1 * 0x3e0)) + (gUnknown_030033EC * 0xc00)]))->x = 0xfe;

    k++;
    new_var10 = 1;
    if (k > 0x1e)
    {
      break;
    }
    gUnknown_02029ED8[(k + (a1 * 0x20)) + (gUnknown_030033EC * 0xc00)] = n + new_var10;
  }

  new_var3 = ((n * new_var2) + (a1 * 0x3e0)) + (gUnknown_030033EC * 0xc00);
  ((struct Unk620FCRec *) (&gUnknown_02029ED8[new_var3]))->x = 0xff;
  gUnknown_02029ED8[(k + (a1 * 0x20)) + (gUnknown_030033EC * 0xc00)] = -1;
}
