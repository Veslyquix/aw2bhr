#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A4B0.
 * sub_0806A4B0 @ 0x0806A4B0
 */

#include "proc.h"
/* The `lsl #24; lsr #24` on the argument before the `bl` is PROMOTE_MODE on a
 * u8 parameter that has to survive a call, so the parameter is u8 -- a bare
 * `strb` on its own would not have said so. The `adds r0, #0x3d` is only the
 * THUMB strb displacement limit of 31, not an address being taken. */
struct Unk6A4B0Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3d);
    /* 3d */ u8 unk3d;
};

void sub_0806A4B0(u8 a)
{
    ((struct Unk6A4B0Proc *)Proc_Find(gUnknown_08581108))->unk3d = a;
}
