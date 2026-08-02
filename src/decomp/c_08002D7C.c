#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002D7C.
 * sub_08002D7C @ 0x08002D7C, sub_08002DEC @ 0x08002DEC
 */

void sub_08002D7C(void)
{
    sub_0801F114();
    sub_0801F150(1, (void *)0x06010000, 0x31C, 0x14);
    sub_0801F234(0x3E);
    sub_0801F234(0x3F);
    sub_0801F234(0x40);
    sub_0801F234(0x41);
    sub_0801F150(2, (void *)0x06010000, 0x32C, 0x1D);
    sub_0801F234(0x54);
    sub_0801F234(0x90);
    sub_0801F234(0x91);
    sub_0801F234(0x8E);
    sub_0801F234(0x8F);
    sub_0801F234(0xAA);
    sub_08002EF8();
}

void sub_08002DEC(void)
{
    ApplyPaletteExt((u16 *)sub_0802A8AC(3, 0), 0x2E0, 0x20);
    ApplyPaletteExt((u16 *)sub_0802A8AC(0xF, 0), 0x2C0, 0x20);
    ApplyPaletteExt((u16 *)sub_0802A8AC(1, 0), 0x3C0, 0x20);
    ApplyPaletteExt((u16 *)sub_0802A8AC(5, 0), 0x3E0, 0x20);
}
