#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013C00.
 * sub_08013C00 @ 0x08013C00
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
extern u16 *gUnknown_08499578;
extern struct BgCnt gUnknown_03002B6C;

void sub_08013C00(void)
{
    u16 i;

    for (i = 0; i < 0x400; i++)
        gUnknown_08499578[i] = 0;

    for (i = 0; i < 0x10; i++)
        *(u16 *)(0x06000000 + gUnknown_03002B6C.char_base * 0x4000 + i * 2) = 0;
}
