#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080059FC.
 * sub_080059FC @ 0x080059FC, sub_08005AA0 @ 0x08005AA0
 */

/* Six sub_08014A5C calls at string ids 0x9EF..0x9F4 behind one sub_08012BC8
 * window open, the same shape as the promoted sub_0800518C in
 * src/decomp/c_08005154.c. 0x9F0 is `movs r3,#0x9f; lsls r3,#4` and the other
 * five come from the pool; that is the constant's own spelling, not a type
 * difference. */
void sub_080059FC(void)
{
    sub_08012BC8(gUnknown_08499578, 0, 0, 0x1E, 0x14, 0);
    sub_08014A5C(3, 3, gUnknown_08499578, 0x9EF, 0x8000, 0);
    sub_08014A5C(4, 5, gUnknown_08499578, 0x9F0, 0x8000, 0);
    sub_08014A5C(4, 7, gUnknown_08499578, 0x9F1, 0x8000, 0);
    sub_08014A5C(3, 9, gUnknown_08499578, 0x9F2, 0x8000, 0);
    sub_08014A5C(4, 0xB, gUnknown_08499578, 0x9F3, 0x8000, 0);
    sub_08014A5C(4, 0xD, gUnknown_08499578, 0x9F4, 0x8000, 0);
    sub_08013AEC();
}

/* sub_080059FC's tail without the sub_08012BC8 window open, five rows at
 * column 8 and string ids 0x9F5..0x9F9, then the promoted sub_080059E4. */
void sub_08005AA0(void)
{
    sub_08014A5C(8, 4, gUnknown_08499578, 0x9F5, 0x8000, 0);
    sub_08014A5C(8, 6, gUnknown_08499578, 0x9F6, 0x8000, 0);
    sub_08014A5C(8, 8, gUnknown_08499578, 0x9F7, 0x8000, 0);
    sub_08014A5C(8, 0xA, gUnknown_08499578, 0x9F8, 0x8000, 0);
    sub_08014A5C(8, 0xC, gUnknown_08499578, 0x9F9, 0x8000, 0);
    sub_08013AEC();
    sub_080059E4();
}
