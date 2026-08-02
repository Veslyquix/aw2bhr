#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08072B54.
 * sub_08072B54 @ 0x08072B54
 */

/* Play song `songNum` panned by the screen x `x`: report the song id to
 * sub_0803B4DC, look the song's player up through the two ROM tables and hand
 * the player's MusicPlayerInfo to the start and panpot calls. sub_08072B2C
 * maps 0..0xef onto -0x60..0x5f, which the `lsls #0x18; asrs #0x18` at the
 * call site narrows to s8. */
void sub_08072B54(int songNum, int x)
{
    struct MusicPlayerInfo *mp;

    sub_0803B4DC((s16)songNum);

    mp = gUnknown_08242308[gUnknown_0824238C[songNum].ms].info;

    sub_08070668(mp);
    sub_080714FC(mp, 0xffff, sub_08072B2C(x));
}
