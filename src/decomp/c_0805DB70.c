#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805DB70.
 * sub_0805DB70 @ 0x0805DB70
 */

/* sub_0805DB70 @ 0x0805DB70, 308 bytes.
 *
 * gUnknown_0816DA4C is not an object: the ROM word at 0x0816DA4C holds
 * 0x030033EC, agbcc's own -fforce-addr address constant for
 * gUnknown_030033EC. Naming the global honestly reproduces the double load.
 *
 * `n` is ONE local assigned twice -- the terrain difference and then Div's
 * quotient. That is what the `adds r3, r0, #0` after the `bl Div` records: a
 * pseudo whose live range already covers the whole address chain, so the chain
 * gets r0-r2 instead of r1-r3. Two separate locals coalesce the copy away and
 * shift every register in the chain by one.
 *
 * gUnknown_085D3DD0[..].unk1c is a function pointer called through
 * `bl _call_via_r1`, and the veneer's register index is what fixes its arity at
 * one argument.
 */
void sub_0805DB70(void)
{
    u8 (*fn)(int);
    int v;
    int n;

    if ((u8)sub_08044280(gUnknown_030033EC))
    {
        fn = gUnknown_085D3DD0[gUnknown_08499598[gUnknown_030033EC].unk1d].unk1c;
        if (fn != 0 && fn(2) == 1)
        {
            if (gUnknown_03003FC0.unk32 != 0)
                sub_08034534(0x10, 0, gUnknown_030033EC, 0);
            sub_0804438C(gUnknown_030033EC, 2);
            return;
        }
    }

    if (sub_0804423C(gUnknown_030033EC))
    {
        v = sub_080441D4(gUnknown_030033EC);
        n = sub_08044208(gUnknown_030033EC) - v;
        n = Div(n * gUnknown_085D3DD0[gUnknown_08499598[gUnknown_030033EC].unk1d].unk17,
                100);
        v += n;
        if (v >= (int)sub_08044094(gUnknown_030033EC)
            && sub_080129E0() % 100
                   < gUnknown_085D3DD0[gUnknown_08499598[gUnknown_030033EC].unk1d].unk18)
        {
            fn = gUnknown_085D3DD0[gUnknown_08499598[gUnknown_030033EC].unk1d].unk1c;
            if (fn != 0 && fn(1) == 1)
            {
                if (gUnknown_03003FC0.unk32 != 0)
                    sub_08034534(0xf, 0, gUnknown_030033EC, 0);
                sub_0804438C(gUnknown_030033EC, 1);
            }
        }
    }
}
