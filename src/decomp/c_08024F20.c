#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08024F20.
 * CalcBattleDamage @ 0x08024F20
 */

void CalcBattleDamage(s16 a1, s16 a2, struct Unk802C57C *a3)
{
    u32 saved;
    int dx;
    int dy;
    int d;

    saved = gUnits[a1].unk02;
    gUnits[a1].unk02 = a3->unk00;
    saved |= gUnits[a1].unk03 << 16;
    gUnits[a1].unk03 = a3->unk02;

    sub_08024A2C((struct Unk030013D0 *)gUnknown_030013D0, a1);
    sub_08024A2C((struct Unk030013D0 *)gUnknown_030013B0, a2);

    dx = ((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk02
       - ((struct Unk030013D0 *)gUnknown_030013B0)->unk00->unk02;
    if (dx < 0)
        dx = -dx;

    dy = ((struct Unk030013D0 *)gUnknown_030013D0)->unk00->unk03
       - ((struct Unk030013D0 *)gUnknown_030013B0)->unk00->unk03;
    if (dy < 0)
        dy = -dy;

    d = dx + dy;

    CalcDamage((struct Unk08024ABCArg *)gUnknown_030013D0,
                 (struct Unk08024ABCArg *)gUnknown_030013B0, d, 1);
    CalcDamage((struct Unk08024ABCArg *)gUnknown_030013B0,
                 (struct Unk08024ABCArg *)gUnknown_030013D0, d, 0);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013D0, 0, 1);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013B0, 1, 1);

    if ((GetPlayerSpecialAbilities(((((struct Unk030013D0 *)gUnknown_030013B0)->unk00
                        - gUnits) >> 6) + 1) & 4) != 0)
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013B0,
                     (struct Unk030013D0 *)gUnknown_030013D0);
    else
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013D0,
                     (struct Unk030013D0 *)gUnknown_030013B0);

    sub_08024ED8((struct Unk030013D0 *)gUnknown_030013D0,
                 (struct Unk030013D0 *)gUnknown_030013B0);

    gUnits[a1].unk02 = saved;
    gUnits[a1].unk03 = saved >> 16;
}

asm(".global sub_08024F20\n.thumb_set sub_08024F20, CalcBattleDamage\n");
