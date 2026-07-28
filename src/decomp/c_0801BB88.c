#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BB88.
 * sub_0801BB88 @ 0x0801BB88
 */

/* Splits the pending OAM copy in two at object `a`: gUnknown_03000278 takes
 * the first `a` objects and gUnknown_03000268 the remaining 0x80 - a. Both
 * descriptors are struct Unk03000278; 0x07000000 is OAM and each object is
 * 8 bytes, hence the shared `a * 8` byte offset that also lands in unk08.
 *
 * The `strh r0, [r2, #0xa]` with no narrowing is what fixes the parameter at
 * 16 bits or wider; `int` and `u16` are byte-identical here.
 */
void sub_0801BB88(int a)
{
    gUnknown_03000278.unk00 = gUnknown_03002520;
    gUnknown_03000278.unk04 = (void *)0x07000000;
    gUnknown_03000278.unk08 = 0;
    gUnknown_03000278.unk0a = a;
    gUnknown_03000268.unk00 = (u8 *)gUnknown_03002520 + a * 8;
    gUnknown_03000268.unk04 = (u8 *)0x07000000 + a * 8;
    gUnknown_03000268.unk08 = a * 8;
    gUnknown_03000268.unk0a = 0x80 - a;
}
