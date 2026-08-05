#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807728C.
 * sub_0807728C @ 0x0807728C, sub_080772B8 @ 0x080772B8
 */

struct Unk080772B8
{
    /* 0x00 */ u8 filler_00[0x92];
    /* 0x92 */ u16 unk92[5][3];
};

void sub_0807728C(u16 *dst, int val)
{
    while (1) {
        *dst = val % 10 + 0x32;
        val /= 10;
        if (val == 0)
            break;
        dst--;
    }
}

void sub_080772B8(struct Unk080772B8 *p)
{
    u8 buf[8];
    int i;

    sub_080733C8((s16)gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk00,
                 gUnknown_086145C8, buf);

    for (i = 0; i <= 4; i++)
        sub_0807728C(&p->unk92[i][2], buf[i]);
}
