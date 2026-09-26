#include "global.h"
#include "hardware.h"

/* sub_08066A20's twin on the other arm of sub_08066B40's dispatch: same
 * opening scan over gUnknown_03002040[] and ->unk70[], same closing
 * "every slot is still zero" test.
 *
 * The shared tail body is written TWICE in the source and cross-jumped by the
 * compiler into one copy -- that is what puts the body ahead of the
 * `cnt == 0` arm in address order and what turns the `unk31` test into
 * `bne <else>` plus `b <body>` rather than a single conditional branch.
 *
 * gUnknown_0816E150 is a -fforce-addr pool word holding &gUnknown_08580934. */
void sub_08066874(void)
{
  int i;
  struct Unk08580934 *state;
  int cnt;
  char new_var;
  struct KeySt *key;
  cnt = 0;
  gUnknown_08580934->unk32 = gUnknown_08580934->unk25;
  for (i = 0; i < gUnknown_08580934->unk08; i++)
  {
    if (((struct KeySt *) (&gUnknown_03002040))[i].held & 2)
    {
      cnt++;
    }
    if (((s8) gUnknown_08580934->unk70[i]) == (-1))
    {
      cnt = 0;
      break;
    }
  }

  if (gUnknown_08580934->unk08 == 2)
  {
    if (gUnknown_08580934->unk31 == 1)
    {
      sub_0806377C(gUnknown_08580D0C);
      gUnknown_08580934->unk26 = 0;
      sub_08063A00(gUnknown_08580AF0, sub_08066200);
      sub_08063A00(gUnknown_08580B90, sub_08066200);
      sub_08063A00(gUnknown_08580BC8, sub_08066200);
      sub_08063A00(gUnknown_08580A38, sub_08066210);
      sub_08063A00(gUnknown_08580A08, sub_08066210);
    }
    else
    {
      sub_080152EC(gUnknown_08580D54, 4);
    }
  }
  else
  {
    state = gUnknown_08580934;
    if ((new_var = cnt) != 0)
    {
      sub_0806377C(gUnknown_08580D0C);
      gUnknown_08580934->unk26 = 0;
      sub_08063A00(gUnknown_08580AF0, sub_08066200);
      sub_08063A00(gUnknown_08580B90, sub_08066200);
      sub_08063A00(gUnknown_08580BC8, sub_08066200);
      sub_08063A00(gUnknown_08580A38, sub_08066210);
      sub_08063A00(gUnknown_08580A08, sub_08066210);
    }
    else
    {
      for (i = 0; i < gUnknown_08580934->unk08; i++)
      {
        if (((s8) gUnknown_08580934->unk70[i]) == 0)
        {
          key = &((struct KeySt *) (&gUnknown_03002040))[i];
          sub_080660BC(key->unk02, i, i == gUnknown_08580934->unk25);
        }
      }

      sub_0806666C();
      if (((s8) gUnknown_08580934->unk70[gUnknown_08580934->unk25]) == 0)
      {
        sub_08066078();
      }
      for (i = 0; i < gUnknown_08580934->unk08; i++)
      {
        if (((s8) state->unk70[i]) == 0)
        {
          break;
        }
      }

      if (i == gUnknown_08580934->unk08)
      {
        sub_080152EC(gUnknown_08580D54, 4);
      }
    }
  }
}
