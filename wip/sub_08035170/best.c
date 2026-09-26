#include "global.h"

u8 sub_08035170(void)
{
  struct Unk03003FC0 *new_var;
  int v;
  u8 mode;
  v = gUnknown_03003FC0.unk2c;
  switch (v)
  {
    default:
      v = 0;

    case 0:
      new_var = &gUnknown_03003FC0;
      if ((*new_var).unk2d == 1)
    {
      if (sub_080129F8(gUnknown_03004490[2]))
      {
        v = 1;
      }
      else
        if (sub_080129F8(gUnknown_03004490[1]))
      {
        v = 2;
      }
    }
      break;

    case 1:

    case 2:
      mode = (*new_var).unk2d;
      if (((mode != 2) && ((v != gUnknown_03003FC0.unk2f) || (mode != 3))) && sub_08035080())
    {
      v = (*new_var).unk2f;
    }
      break;

  }

  return v;
}
