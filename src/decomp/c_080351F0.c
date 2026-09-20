#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080351F0.
 * sub_080351F0 @ 0x080351F0
 */

void sub_080351F0(void)
{
    sub_08035124(gPlaySt.unk2e);

    if (gPlaySt.unk2c != gPlaySt.unk2e)
        sub_080152EC(gUnknown_0849BD38, 0)->unk20 = gPlaySt.unk2e;
}
