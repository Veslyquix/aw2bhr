#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08052F84.
 * sub_08052F84 @ 0x08052F84
 */

#include "hardware.h"
#include "proc.h"

/* Wave 50, W50-F. A debug-menu tick: sub_08057464 draws the readout, this
 * reads the pad and edits the value under the cursor.
 *
 * Every `ldr rN,=gUnknown_0813xxxx; ldr rM,[rN]` pair here is agbcc's own
 * -fforce-addr pool, NOT a pointer variable -- 0x08136118 holds 0x03002EE0,
 * which aw2bhr.lds already binds as gpKeySt, and 0x0813611C / 0x08136120 /
 * 0x08136124 hold gUnknown_03004550 / gUnknown_03004524 / gUnknown_03004514.
 * Naming the targets directly is all the source did; agbcc parks the words
 * itself, and `mov sl, r2` is it keeping one of them alive across the function.
 *
 * gUnknown_03004550 had to be reshaped to [][8] and gUnknown_08551A28 declared
 * -- see the comments on both in include/unknown-globals.h. The two share one
 * index expression, which is why the ROM computes the byte offset once and adds
 * each base to it separately. */
void sub_08052F84(ProcPtr proc)
{
    int i;
    int j;

    sub_08057464();

    if (gpKeySt->held & 4)
        sub_08052F3C();

    if (gpKeySt->unk02 & 0xf0)
        sub_08054BA0();

    if (gpKeySt->held & 0x200)
        gUnknown_030045AC ^= 1;

    if (gpKeySt->held & 0x100)
        gUnknown_03004540 = (gUnknown_03004540 + 1) % 3;

    if (gpKeySt->unk02 & 1)
    {
        gUnknown_03004550[gUnknown_03004514][gUnknown_03004524] +=
            (gpKeySt->unk00 & 0x100) ? 10 : 1;

        if (gUnknown_03004550[gUnknown_03004514][gUnknown_03004524]
            > gUnknown_08551A28[gUnknown_03004514][gUnknown_03004524])
            gUnknown_03004550[gUnknown_03004514][gUnknown_03004524] = 0;
    }

    if (gpKeySt->unk02 & 2)
    {
        gUnknown_03004550[gUnknown_03004514][gUnknown_03004524] -=
            (gpKeySt->unk00 & 0x100) ? 10 : 1;

        if (gUnknown_03004550[gUnknown_03004514][gUnknown_03004524] < 0)
            gUnknown_03004550[gUnknown_03004514][gUnknown_03004524] =
                gUnknown_08551A28[gUnknown_03004514][gUnknown_03004524];
    }

    if (gpKeySt->held & 8)
    {
        for (i = 0; i < 2; i++)
            for (j = 0; j < 8; j++)
                gUnknown_03004580[i][j] = gUnknown_03004550[i][j];

        gUnknown_0300450C = gUnknown_030045AC;
        gUnknown_03004520 = gUnknown_03004540;
        Proc_End(proc);
    }
}
