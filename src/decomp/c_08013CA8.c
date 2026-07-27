#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013CA8.
 * sub_08013CA8 @ 0x08013CA8
 */

struct BgCnt
{
    u32 priority : 2;
    u32 char_base : 2;
    u32 pad_4 : 2;
    u32 mosaic : 1;
    u32 color_mode : 1;
    u32 screen_base : 5;
    u32 area_overflow : 1;
    u32 screen_size : 2;
};
extern u16 *gUnknown_08499580;
extern struct BgCnt gUnknown_030030B4;

void sub_08013CA8(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gUnknown_08499580[i] = 0x360;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x0600D800 + gUnknown_030030B4.char_base * 0x4000 + i * 2) = 0;
}
