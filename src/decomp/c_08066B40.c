#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08066B40.
 * sub_08066B40 @ 0x08066B40, sub_08066B6C @ 0x08066B6C
 */

/* sub_0806630C's twin on the same selector, with the two handlers swapped
 * relative to the case labels. */
void sub_08066B40(void)
{
    switch (gUnknown_08580934->unk26)
    {
    case 0:
        sub_08066A20();
        break;
    case 1:
        sub_08066874();
        break;
    }
}

/* unk24 is read with a BARE `ldrb` here -- no sign extension, unlike the unk26
 * both callees dispatch on two bytes along. */
void sub_08066B6C(void)
{
    if (gUnknown_08580934->unk24 == 0)
        sub_0806630C();
    else
        sub_08066B40();
}
