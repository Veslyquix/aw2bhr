#include "global.h"
#include "hardware.h"
#include "proc.h"

struct Unk80860DCProc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
    /* 0x30 */ int unk30;
    /* 0x34 */ u8 filler_34[0x18];
    /* 0x4c */ s16 unk4c;
    /* 0x4e */ s16 unk4e;
    /* 0x50 */ u8 filler_50[0x02];
    /* 0x52 */ u16 unk52;
    /* 0x54 */ u8 filler_54[0x04];
    /* 0x58 */ int unk58;
    /* 0x5c */ int unk5c;
};

void sub_080860DC(ProcPtr procp)
{
  struct Unk80860DCProc *p = procp;
  u8 *q;
  int g;
  unsigned short w;
  if (((p->unk4e != 0) || (p->unk52 != 0)) && (p->unk4c <= 7))
  {
    return;
  }
  if (p->unk2c <= 0x10)
  {
    return;
  }
  if (gpKeySt->unk02 & 0x40)
  {
    if (p->unk58 <= gUnknown_02027F74.unk36)
    {
      return;
    }
    p->unk58--;
    if (gUnknown_03003FC0.unk01 == 2)
    {
      sub_08087B60(p->unk58);
      if ((gUnknown_03005930 > 1) || (p->unk5c == 0))
      {
        gUnknown_03005930--;
      }
      else
      {
        p->unk5c--;
        p->unk30 = 1;
      }
      gUnknown_03005900 = p->unk5c;
    }
    else
    {
      if ((gUnknown_03005980 > 1) || (p->unk5c == 0))
      {
        gUnknown_03005980--;
      }
      else
      {
        p->unk5c--;
        p->unk30 = 1;
      }
      gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
    }
    if ((p->unk4e != 0) || (p->unk52 != 0))
    {
      sub_08013C54();
      sub_08013AFC();
      gUnknown_03002F18 = sub_08087298() + (p->unk4e * 0x100);
      p->unk4c = 8;
      p->unk52 = 0;
    }
    else
    {
      p->unk4c = 0;
    }
    w = 0xFFFF;
    *((u16 *) (&p->unk4e)) = w;
    gUnknown_03001FE8.bits.size = 2;
    sub_080876B4();
    sub_0803B4DC(0x67);
    return;
  }
  else
    if (gpKeySt->unk02 & 0x80)
  {
    if (p->unk58 >= gUnknown_02027F74.unk37)
    {
      return;
    }
    p->unk58++;
    if (gUnknown_03003FC0.unk01 == 2)
    {
      sub_08087B60(p->unk58);
      if ((gUnknown_03005930 < ((g = gUnknown_03005928) - 2)) || (p->unk5c == ((gUnknown_02027F74.unk37 - g) + 1)))
      {
        gUnknown_03005930++;
      }
      else
      {
        p->unk5c++;
        p->unk30 = 1;
      }
      gUnknown_03005900 = p->unk5c;
    }
    else
    {
      if ((gUnknown_03005980 < ((g = gUnknown_03005928) - 2)) || (p->unk5c == ((gUnknown_02027F74.unk37 - g) + 1)))
      {
        gUnknown_03005980++;
      }
      else
      {
        p->unk5c++;
        p->unk30 = 1;
      }
      gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
    }
    if ((p->unk4e != 0) || (p->unk52 != 0))
    {
      sub_08013C54();
      sub_08013AFC();
      gUnknown_03002F18 = sub_08087298() + (p->unk4e * 0x100);
      p->unk4c = 8;
      p->unk52 = 0;
    }
    else
    {
      p->unk4c = 0;
    }
    *((u16 *) (&p->unk4e)) = 1;
    gUnknown_03001FE8.bits.size = 2;
    sub_080876B4();
    sub_0803B4DC(0x67);
    return;
  }
  else
    if (((gpKeySt->held & 1) && (p->unk4e == 0)) && (Proc_Find(gUnknown_084892C4) == 0))
  {
    q = (u8 *) (&gUnknown_02027F74);
    q += 4;
    if (!((u8) sub_0803CA54(q[p->unk58])))
    {
      return;
    }
    if (gUnknown_03003FC0.unk01 == 2)
    {
      gUnknown_03005900 = p->unk5c;
    }
    else
    {
      gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
    }
    q = (u8 *) (&gUnknown_02027F74);
    q += 4;
    sub_0803BCD0(q[p->unk58]);
    sub_0803BD54();
    sub_0803B4DC(0x71);
    sub_08037780();
    Proc_Start(gUnknown_08616CCC, p);
    p->unk4e = 1;
    p->unk4c = 0x1E;
    Proc_Break(p);
    return;
  }
  else
    if (((gpKeySt->held & 2) && (Proc_Find(gUnknown_084892C4) == 0)) && (Proc_Find(gUnknown_08616CCC) == 0))
  {
    sub_0803B4DC(0x66);
    sub_0803BD60();
    sub_08037780();
    Proc_Start(gUnknown_08616CCC, p);
    p->unk4e = 1;
    p->unk4c = 0x1E;
    Proc_Break(p);
    return;
  }
  else
    if (gUnknown_03003FC0.unk01 == 2)
  {
    if (!(gpKeySt->held & 0x100))
    {
      return;
    }
    q = &gUnknown_0200C420.unk0c;
    gUnknown_0200C420.unk0c = 1 - (*q);
    if ((*q) != 0)
    {
      sub_0803B4DC(0x65);
    }
    else
    {
      sub_0803B4DC(0x66);
    }
    sub_08087974(p->unk58, p);
    return;
  }
  else
    if (gpKeySt->held & 0x220)
  {
    gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
    gUnknown_0300596C--;
    if (gUnknown_0300596C <= 1)
    {
      gUnknown_0300596C = 8;
    }
    while (!((u8) sub_08037448(gUnknown_0300596C)))
    {
      gUnknown_0300596C--;
      if (gUnknown_0300596C <= 1)
      {
        gUnknown_0300596C = 8;
      }
    }

    p->unk5c = gUnknown_03005990[gUnknown_0300596C];
    if (gUnknown_03005980 > gUnknown_02027F74.unk37)
    {
      gUnknown_03005980 = gUnknown_02027F74.unk37;
    }
    p->unk58 = p->unk5c + gUnknown_03005980;
    if ((p->unk4e != 0) || (p->unk52 != 0))
    {
      sub_08013C54();
      sub_08013AFC();
      gUnknown_03002B34 = sub_08087248() + (p->unk52 << 8);
      p->unk4c = 8;
      p->unk4e = 0;
    }
    else
    {
      p->unk4c = 0;
    }
    p->unk2c = 0;
    p->unk52 = 0xFFFF;
    gUnknown_03001FE8.bits.size = 1;
    sub_080876B4();
    sub_0803B4DC(0x76);
    return;
  }
  else
    if (gpKeySt->held & 0x110)
  {
    gUnknown_03005990[gUnknown_0300596C] = p->unk5c;
    gUnknown_0300596C++;
    if (gUnknown_0300596C > 8)
    {
      gUnknown_0300596C = 2;
    }
    while (!((u8) sub_08037448(gUnknown_0300596C)))
    {
      gUnknown_0300596C++;
      if (gUnknown_0300596C > 8)
      {
        gUnknown_0300596C = 2;
      }
    }

    p->unk5c = gUnknown_03005990[gUnknown_0300596C];
    if (gUnknown_03005980 > gUnknown_02027F74.unk37)
    {
      gUnknown_03005980 = gUnknown_02027F74.unk37;
    }
    p->unk58 = gUnknown_03005980;
    ;
    p->unk58 = p->unk5c + p->unk58;
    if ((p->unk4e != 0) || (p->unk52 != 0))
    {
      sub_08013C54();
      sub_08013AFC();
      gUnknown_03002B34 = sub_08087248() + (p->unk52 << 8);
      p->unk4c = 8;
      p->unk4e = 0;
    }
    else
    {
      p->unk4c = 0;
    }
    p->unk2c = 0;
    p->unk52 = 1;
    gUnknown_03001FE8.bits.size = 1;
    sub_080876B4();
    sub_0803B4DC(0x76);
  }
}
