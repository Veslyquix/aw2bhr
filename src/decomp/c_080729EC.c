#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080729EC.
 * sub_080729EC @ 0x080729EC
 */

/* Row-by-row VRAM upload of a `width` x `height` tile block: each row is
 * width*0x20 bytes of source, and the destination advances a full 32-tile
 * screen row (0x400 bytes) each time. Shape-matches Register2dChrMove in the
 * Fire Emblem decomps.
 *
 * The loop counts UP and `i` is dead in the body, so agbcc's check_dbra_loop
 * reverses it: the entry guard tests the parameter (`cmp r3, #0; ble`) while
 * the counter is a fresh preheader register counting down to a `bne`. Writing
 * the countdown in the source instead (`while (height > 0) ... height--`)
 * guards on the counter and exits with `bgt`. */
void sub_080729EC(const void *src, void *dst, int width, int height)
{
    int size = width * 0x20;
    int i;

    for (i = 0; i < height; i++)
    {
        sub_08012F6C(src, dst, size);

        src = (const u8 *) src + size;
        dst = (u8 *) dst + 0x400;
    }
}
