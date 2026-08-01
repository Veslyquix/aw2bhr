#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BBC4.
 * sub_0801BBC4 @ 0x0801BBC4, sub_0801BC08 @ 0x0801BC08
 */

/* Flushes the second pending-copy descriptor unconditionally, then latches
 * where it came from. The `* 2` is the halfword count turned into bytes for
 * CpuFastSet, exactly as the note on struct Unk03000278 already records for
 * sub_0801BC08.
 *
 * sub_0801BC08 forty bytes below is the same body over gUnknown_03000278 and
 * guarded on unk0a; sub_0801BCA8 is this body with the CpuFastSet removed. All
 * three keep gUnknown_03000268's address in r4 across their calls, which is
 * what makes the descriptor a single object rather than five loose globals. */
void sub_0801BBC4(void)
{
    CpuFastSet(gUnknown_03000268.unk00, gUnknown_03000268.unk04,
               gUnknown_03000268.unk0a * 2);
    sub_080718E8(gUnknown_03000268.unk00, gUnknown_03000268.unk0a);
    gUnknown_03002F2C = gUnknown_03000268.unk00;
    gUnknown_030030D4 = gUnknown_03002520;
    gUnknown_030024C0 = 0;
}

/* sub_0801BBC4's body over the OTHER descriptor, guarded on a non-zero count
 * and latching into a different global. The guard is the whole difference
 * between the two, and it is why this one is 52 bytes to its neighbour's 68
 * despite doing the same work. */
void sub_0801BC08(void)
{
    if (gUnknown_03000278.unk0a != 0)
    {
        CpuFastSet(gUnknown_03000278.unk00, gUnknown_03000278.unk04,
                   gUnknown_03000278.unk0a * 2);
        sub_080718E8(gUnknown_03000278.unk00, gUnknown_03000278.unk0a);
        gUnknown_0300141C = gUnknown_03000278.unk00;
    }
}
