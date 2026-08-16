#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E2C.
 * sub_08042E2C @ 0x08042E2C, sub_08042E64 @ 0x08042E64, sub_08042E84 @ 0x08042E84, sub_08042EBC @ 0x08042EBC, sub_08042EDC @ 0x08042EDC, sub_08042F14 @ 0x08042F14, sub_08042F34 @ 0x08042F34, sub_08042F5C @ 0x08042F5C, sub_08042F7C @ 0x08042F7C, sub_08042FA4 @ 0x08042FA4, sub_08042FC4 @ 0x08042FC4, sub_08042FFC @ 0x08042FFC, sub_0804301C @ 0x0804301C, sub_08043050 @ 0x08043050
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F34.
 * sub_08042F34 @ 0x08042F34
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F7C.
 * sub_08042F7C @ 0x08042F7C
 */


/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E2C.
 * sub_08042E2C @ 0x08042E2C
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Luck Total of CO". The
 * old sub_08042E2C symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged. */
int GetCoLuckBonus(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 10;

    return gUnknown_085D3DD0[a].unk38[b].unk0e;
}

asm(".global sub_08042E2C\n.thumb_set sub_08042E2C, GetCoLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E64.
 * sub_08042E64 @ 0x08042E64
 */

/* Player-level wrapper for GetCoLuckBonus. The old sub_08042E64 symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged. */
int GetPlayerCoLuckBonus(int a1)
{
    return GetCoLuckBonus(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

asm(".global sub_08042E64\n.thumb_set sub_08042E64, GetPlayerCoLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E84.
 * sub_08042E84 @ 0x08042E84
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Negative Luck Total of
 * CO". The old sub_08042E84 symbol is kept as a linker alias below so every
 * other unit keeps resolving it unchanged. */
int GetCoNegativeLuckBonus(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk10;
}

asm(".global sub_08042E84\n.thumb_set sub_08042E84, GetCoNegativeLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042EBC.
 * sub_08042EBC @ 0x08042EBC
 */

/* Player-level wrapper for GetCoNegativeLuckBonus. The old sub_08042EBC
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoNegativeLuckBonus(int a1)
{
    return GetCoNegativeLuckBonus(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

asm(".global sub_08042EBC\n.thumb_set sub_08042EBC, GetPlayerCoNegativeLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042EDC.
 * sub_08042EDC @ 0x08042EDC
 */

int sub_08042EDC(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 100;

    return gUnknown_085D3DD0[a].unk38[b].unk16 + 100;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F14.
 * sub_08042F14 @ 0x08042F14
 */

int sub_08042F14(int a1)
{
    return sub_08042EDC(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gUnknown_08499598[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F34(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk08;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F5C.
 * sub_08042F5C @ 0x08042F5C
 */

int sub_08042F5C(int a1)
{
    return sub_08042F34(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gUnknown_08499598[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F7C(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk06;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FA4.
 * sub_08042FA4 @ 0x08042FA4
 */

int sub_08042FA4(int a1)
{
    return sub_08042F7C(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FC4.
 * sub_08042FC4 @ 0x08042FC4
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Counterattack Bonus
 * Total of CO". The old sub_08042FC4 symbol is kept as a linker alias below
 * so every other unit keeps resolving it unchanged. */
int GetCoCounterattackBonus(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk12;
}

asm(".global sub_08042FC4\n.thumb_set sub_08042FC4, GetCoCounterattackBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FFC.
 * sub_08042FFC @ 0x08042FFC
 */

/* Player-level wrapper for GetCoCounterattackBonus. The old sub_08042FFC
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoCounterattackBonus(int a1)
{
    return GetCoCounterattackBonus(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}

asm(".global sub_08042FFC\n.thumb_set sub_08042FFC, GetPlayerCoCounterattackBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804301C.
 * sub_0804301C @ 0x0804301C
 */

u32 sub_0804301C(int a, int b)
{
    if (gUnknown_03003FC0.unk08 == 0)
        return 0;

    return gUnknown_085D3DD0[a].unk38[b].unk08;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043050.
 * sub_08043050 @ 0x08043050
 */

u32 sub_08043050(int a1)
{
    return sub_0804301C(gUnknown_08499598[a1].unk1d, gUnknown_08499598[a1].unk1e);
}
