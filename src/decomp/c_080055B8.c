#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080055B8.
 * sub_080055B8 @ 0x080055B8, sub_08005634 @ 0x08005634, sub_080056B0 @ 0x080056B0
 */

/* Family F059: three copies of one shape, differing only in the slot index --
 * 0, 1 and 2 -- which appears twice, once as sub_0803CCB8's first argument and
 * once as sub_0803CDBC's third. Both arms call sub_0803CEAC and sub_08012BC8
 * with identical arguments and the ROM keeps both copies: cross-jumping cannot
 * merge them because the `0` that goes to [sp, #4] is CSEd with the two `strh`
 * zeroes in the then-arm and so lands in r4 there and r1 in the else-arm. */
void sub_080055B8(void)
{
    if (sub_0803CCB8(0, gUnknown_0200B204) != 1)
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_08013AEC();
    }
    else
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_0803CDBC(0xE, 4, 0);
        gUnknown_03001418 = 0;
        gUnknown_03001FF8 = 0;
    }
}

/* Family F059: three copies of one shape, differing only in the slot index --
 * 0, 1 and 2 -- which appears twice, once as sub_0803CCB8's first argument and
 * once as sub_0803CDBC's third. Both arms call sub_0803CEAC and sub_08012BC8
 * with identical arguments and the ROM keeps both copies: cross-jumping cannot
 * merge them because the `0` that goes to [sp, #4] is CSEd with the two `strh`
 * zeroes in the then-arm and so lands in r4 there and r1 in the else-arm. */
void sub_08005634(void)
{
    if (sub_0803CCB8(1, gUnknown_0200B204) != 1)
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_08013AEC();
    }
    else
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_0803CDBC(0xE, 4, 1);
        gUnknown_03001418 = 0;
        gUnknown_03001FF8 = 0;
    }
}

/* Family F059: three copies of one shape, differing only in the slot index --
 * 0, 1 and 2 -- which appears twice, once as sub_0803CCB8's first argument and
 * once as sub_0803CDBC's third. Both arms call sub_0803CEAC and sub_08012BC8
 * with identical arguments and the ROM keeps both copies: cross-jumping cannot
 * merge them because the `0` that goes to [sp, #4] is CSEd with the two `strh`
 * zeroes in the then-arm and so lands in r4 there and r1 in the else-arm. */
void sub_080056B0(void)
{
    if (sub_0803CCB8(2, gUnknown_0200B204) != 1)
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_08013AEC();
    }
    else
    {
        sub_0803CEAC();
        sub_08012BC8(gUnknown_08499578, 0xE, 4, 0xF, 0xA, 0);
        sub_0803CDBC(0xE, 4, 2);
        gUnknown_03001418 = 0;
        gUnknown_03001FF8 = 0;
    }
}
