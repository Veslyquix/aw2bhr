#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807C588.
 * sub_0807C588 @ 0x0807C588
 */

#include "proc.h"
struct Unk807C588
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ int unk58;
    /* 0x5c */ int unk5c;
};

void sub_0807C588(struct Unk807C588 *proc)
{
    int i;

    sub_08026BAC();

    for (i = 0; i < sub_0802490C(gPlaySt.mapID); i++)
    {
        if (gUnknown_085C77A0[gPlaySt.mapID].unk3c[i] == 0xff)
            gUnknown_08499598[i + 1].aiControlled = 1;
        else
            gUnknown_08499598[i + 1].aiControlled = 2;
    }

    proc->unk58 = 0;
    proc->unk5c = 0;

    for (i = 0; i < 5; i++)
        gUnknown_03005910[i] = 0;
}
