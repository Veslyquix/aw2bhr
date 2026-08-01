#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002E3C.
 * sub_08002E3C @ 0x08002E3C
 */

/* A 0x460-byte VRAM push and one call. 0x460 is `movs #0x8c; lsls #3`, agbcc's
 * way of building an even constant above 255 without a pool word. */
void sub_08002E3C(void)
{
    sub_08011E54(gUnknown_0808D8AC, (void *)0x06014D40, 0x460);
    sub_08002EF8();
}
