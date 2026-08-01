#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803AA78.
 * sub_0803AA78 @ 0x0803AA78
 */

/* sub_0803A9C8's teardown twin. The parameter's copy-then-narrow at entry is
 * the declared-`u8` shape again, and here it is forced: the value has to live
 * across the sub_08015BD0 call. The `(s32)` cast on sub_08015BD0's argument is
 * the house convention (src/decomp/c_08017C4C.c, c_08019D0C.c) -- it scans the
 * gUnknown_03001470 slots for the one whose unk00 word equals this address. */
void sub_0803AA78(u8 a)
{
    sub_08015BD0((s32)gUnknown_0849E280);
    sub_08025BE0(&gUnknown_03004100, a);
    gUnknown_0849D89C->unk04 = &gUnknown_03004100;
    sub_0803A190(gUnknown_0849D89C->unk00, &gUnknown_03004100);
    sub_0803A2BC(gUnknown_0849D89C->unk00, gUnknown_0849D89C->unk04);
    sub_08013AD4(0);
}
