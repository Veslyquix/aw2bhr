#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E2C.
 * GetCoLuckBonus @ 0x08042E2C, GetPlayerCoLuckBonus @ 0x08042E64, GetCoNegativeLuckBonus @ 0x08042E84, GetPlayerCoNegativeLuckBonus @ 0x08042EBC, GetCoCaptureRate @ 0x08042EDC, sub_08042F14 @ 0x08042F14, sub_08042F34 @ 0x08042F34, sub_08042F5C @ 0x08042F5C, sub_08042F7C @ 0x08042F7C, sub_08042FA4 @ 0x08042FA4, GetCoCounterattackBonus @ 0x08042FC4, GetPlayerCoCounterattackBonus @ 0x08042FFC, sub_0804301C @ 0x0804301C, GetPlayerSpecialAbilities @ 0x08043050
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
 * GetCoLuckBonus @ 0x08042E2C
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Luck Total of CO". The
 * old GetCoLuckBonus symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged. */
int GetCoLuckBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 10;

    return gUnknown_085D3DD0[a].power[b].luckPositive;
}

asm(".global sub_08042E2C\n.thumb_set sub_08042E2C, GetCoLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E64.
 * GetPlayerCoLuckBonus @ 0x08042E64
 */

/* Player-level wrapper for GetCoLuckBonus. The old GetPlayerCoLuckBonus symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged. */
int GetPlayerCoLuckBonus(int a1)
{
    return GetCoLuckBonus(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08042E64\n.thumb_set sub_08042E64, GetPlayerCoLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042E84.
 * GetCoNegativeLuckBonus @ 0x08042E84
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Negative Luck Total of
 * CO". The old GetCoNegativeLuckBonus symbol is kept as a linker alias below so every
 * other unit keeps resolving it unchanged. */
int GetCoNegativeLuckBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].luckNegative;
}

asm(".global sub_08042E84\n.thumb_set sub_08042E84, GetCoNegativeLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042EBC.
 * GetPlayerCoNegativeLuckBonus @ 0x08042EBC
 */

/* Player-level wrapper for GetCoNegativeLuckBonus. The old GetPlayerCoNegativeLuckBonus
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoNegativeLuckBonus(int a1)
{
    return GetCoNegativeLuckBonus(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08042EBC\n.thumb_set sub_08042EBC, GetPlayerCoNegativeLuckBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042EDC.
 * GetCoCaptureRate @ 0x08042EDC
 */

int GetCoCaptureRate(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 100;

    return gUnknown_085D3DD0[a].power[b].captureRateModifier + 100;
}

asm(".global sub_08042EDC\n.thumb_set sub_08042EDC, GetCoCaptureRate\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F14.
 * sub_08042F14 @ 0x08042F14
 */

int sub_08042F14(int a1)
{
    return GetCoCaptureRate(gPlayers[a1].co, gPlayers[a1].coMode);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gPlayers[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F34(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].rainBringerPercent;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042F5C.
 * sub_08042F5C @ 0x08042F5C
 */

int sub_08042F5C(int a1)
{
    return sub_08042F34(gPlayers[a1].co, gPlayers[a1].coMode);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gPlayers[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F7C(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].snowBringerPercent;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FA4.
 * sub_08042FA4 @ 0x08042FA4
 */

int sub_08042FA4(int a1)
{
    return sub_08042F7C(gPlayers[a1].co, gPlayers[a1].coMode);
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FC4.
 * GetCoCounterattackBonus @ 0x08042FC4
 */

/* Named per Xenesis's AW2 Subroutine List: "Gathers Counterattack Bonus
 * Total of CO". The old GetCoCounterattackBonus symbol is kept as a linker alias below
 * so every other unit keeps resolving it unchanged. */
int GetCoCounterattackBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].counterMultiplier;
}

asm(".global sub_08042FC4\n.thumb_set sub_08042FC4, GetCoCounterattackBonus\n");

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08042FFC.
 * GetPlayerCoCounterattackBonus @ 0x08042FFC
 */

/* Player-level wrapper for GetCoCounterattackBonus. The old GetPlayerCoCounterattackBonus
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoCounterattackBonus(int a1)
{
    return GetCoCounterattackBonus(gPlayers[a1].co, gPlayers[a1].coMode);
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
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].specialAbilities;
}

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08043050.
 * GetPlayerSpecialAbilities @ 0x08043050
 */

u32 GetPlayerSpecialAbilities(int a1)
{
    return sub_0804301C(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08043050\n.thumb_set sub_08043050, GetPlayerSpecialAbilities\n");
