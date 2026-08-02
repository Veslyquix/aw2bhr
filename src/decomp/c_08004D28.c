#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004D28.
 * sub_08004D28 @ 0x08004D28
 */

/* MATCHED, wave 36 (W36-I). This is the call site that RETYPED family F059:
 * sub_080055B8 / sub_08005634 / sub_080056B0 were promoted as `(void)` in
 * src/decomp/c_080055B8.c, but every one of the three `bl`s here is preceded
 * by `movs r0,#0; movs r1,#0; movs r2,#0`. All three parameters are unused in
 * the callees, which is exactly why `(void)` was byte-identical there and is
 * NOT evidence against them -- only a call site can prove an argument. The
 * three definitions were widened to `(int, int, int)`, re-verified with
 * try_match (all three still match), and declared in unknown-functions.h.
 *
 * The `(s8)` cast on the u8 member is the `ldrb; lsls #0x18; asrs #0x18` --
 * an s8 member at a constant offset would be `movs rN,#0x10; ldrsb`. */

void sub_08004D28(void)
{
    switch ((s8)gUnknown_0200B0B0->unk10)
    {
    case 0:
        sub_080055B8(0, 0, 0);
        break;
    case 1:
        sub_08005634(0, 0, 0);
        break;
    case 2:
        sub_080056B0(0, 0, 0);
        break;
    }
}
