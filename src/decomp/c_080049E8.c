#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080049E8.
 * sub_080049E8 @ 0x080049E8
 */

/* The two `strh`s share one `ldr r1, [r0]` because they are consecutive
 * statements with no call between them; `adds r2, r1, #0; adds r2, #0x46` then
 * `adds r1, #0x48` is the halfword-store immediate limit of 62, not two
 * separate loads. */
void sub_080049E8(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0800056C(6);
    sub_080152EC(gUnknown_084872B4, 0);
    gUnknown_0200B0B0->unk46 = 0x57;
    gUnknown_0200B0B0->unk48 = 0x10;
}
