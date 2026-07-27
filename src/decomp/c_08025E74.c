#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08025E74.
 * sub_08025E74 @ 0x08025E74
 */

struct Unk08499594
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 filler_01[0x0b];
};
extern struct Unk08499594 *gUnknown_08499594;
extern u16 gUnknown_030032C0;

void sub_08025E74(void)
{
    int i;

    for (i = 0; i < 256; i++)
        gUnknown_08499594[i].unk00 = 0;
    gUnknown_030032C0 = 0;
}
