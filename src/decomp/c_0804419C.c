#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804419C.
 * sub_0804419C @ 0x0804419C, sub_080441D4 @ 0x080441D4, sub_08044208 @ 0x08044208, sub_0804423C @ 0x0804423C, sub_08044280 @ 0x08044280, sub_080442AC @ 0x080442AC
 */

int GetCoPowerStarCost(int a1)
{
    u16 pct;

    if (sub_08044374(a1) > 9)
        pct = 200;
    else
        pct = sub_08044374(a1) * 20 + 100;
    return Div(pct * 9000, 100);
}

asm(".global sub_0804419C\n.thumb_set sub_0804419C, GetCoPowerStarCost\n");

int GetCoPowerCost(int a1)
{
    return sub_0804419C(a1) * gUnknown_085D3DD0[gPlayers[a1].co].coPowerStars;
}

asm(".global sub_080441D4\n.thumb_set sub_080441D4, GetCoPowerCost\n");

int GetSuperCoPowerCost(int a1)
{
    return sub_0804419C(a1) * gUnknown_085D3DD0[gPlayers[a1].co].superCoPowerStars;
}

asm(".global sub_08044208\n.thumb_set sub_08044208, GetSuperCoPowerCost\n");

u8 sub_0804423C(int a1)
{
    int funds;

    if (sub_0804415C(a1))
        return 0;
    if (sub_080441D4(a1) == 0)
        return sub_08044280(a1);
    funds = sub_08044094(a1);
    if (funds >= sub_080441D4(a1))
        return 1;
    return 0;
}

int sub_08044280(int a1)
{
    int funds;

    if (sub_0804415C(a1))
        return 0;
    funds = sub_08044094(a1);
    if (funds >= sub_08044208(a1))
        return 1;
    return 0;
}

int IsCoPowerAvailable(int a1)
{
    int funds;

    if (sub_0804415C(a1))
        return 0;
    if (sub_080441D4(a1) == 0)
        return 0;
    funds = sub_08044094(a1);
    if (funds >= sub_080441D4(a1))
        return 1;
    return 0;
}

asm(".global sub_080442AC\n.thumb_set sub_080442AC, IsCoPowerAvailable\n");
