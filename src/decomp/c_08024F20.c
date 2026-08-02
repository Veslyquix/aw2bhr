#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08024F20.
 * sub_08024F20 @ 0x08024F20
 */

void sub_08024F20(s16 a1, s16 a2, struct Unk802C57C *a3)
{
    u32 saved;
    int dx;
    int dy;
    int d;

    saved = gUnknown_08499594[a1].unk02;
    gUnknown_08499594[a1].unk02 = a3->unk00;
    saved |= gUnknown_08499594[a1].unk03 << 16;
    gUnknown_08499594[a1].unk03 = a3->unk02;

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

    sub_08024ABC((struct Unk08024ABCArg *)gUnknown_030013D0,
                 (struct Unk08024ABCArg *)gUnknown_030013B0, d, 1);
    sub_08024ABC((struct Unk08024ABCArg *)gUnknown_030013B0,
                 (struct Unk08024ABCArg *)gUnknown_030013D0, d, 0);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013D0, 0, 1);
    sub_08024C58((struct Unk030013D0 *)gUnknown_030013B0, 1, 1);

    if ((sub_08043050(((((struct Unk030013D0 *)gUnknown_030013B0)->unk00
                        - gUnknown_08499594) >> 6) + 1) & 4) != 0)
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013B0,
                     (struct Unk030013D0 *)gUnknown_030013D0);
    else
        sub_08024E60((struct Unk030013D0 *)gUnknown_030013D0,
                     (struct Unk030013D0 *)gUnknown_030013B0);

    sub_08024ED8((struct Unk030013D0 *)gUnknown_030013D0,
                 (struct Unk030013D0 *)gUnknown_030013B0);

    gUnknown_08499594[a1].unk02 = saved;
    gUnknown_08499594[a1].unk03 = saved >> 16;
}
