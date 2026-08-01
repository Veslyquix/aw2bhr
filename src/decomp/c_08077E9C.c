#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08077E9C.
 * sub_08077E9C @ 0x08077E9C
 */

#include "proc.h"

/* FOUR arguments to sub_080758BC, and the fourth is invisible: `adds r3, r0, #0`
 * at the top parks this function's own parameter in r3 and nothing ever reads
 * r3 again inside the body, so it is there for the call. That copy is the only
 * evidence the parameter is used at all.
 *
 * The two coordinates are a table entry's position minus the camera origin,
 * biased by -2 and +7. gUnknown_08615194's stride is 48 (`x * 3 << 4`) and all
 * four reads are `ldrsh`, so the table's +6/+8 and the camera's +0/+2 are s16.
 */
void sub_08077E9C(ProcPtr proc)
{
    sub_080758BC(gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk06
                     - gUnknown_0202FDFC.unk00 - 2,
                 gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk08
                     - gUnknown_0202FDFC.unk02 + 7,
                 0x18, proc);
}
