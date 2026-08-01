#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08077F30.
 * sub_08077F30 @ 0x08077F30
 */

/* A mode entry that shares its four-call tail with sub_08078018
 * (src/decomp/c_08078018.c), where those four `void (void)` callees are already
 * settled as bare statements. What is new here is the record lookup ahead of
 * them.
 *
 * The two arms of the selection are a TERNARY, not an if/else over two separate
 * stores, and the assembly says so: each arm computes only `index * 0x30` and a
 * base biased by 0x24 or 0x28, then both fall into a SHARED `adds r1,r1,r0;
 * ldr r0,[r1]; str r0,[r6]`. That shared tail is why the differing constant
 * gets folded into the base pointer instead of staying an `ldr [.., #0x24]`
 * immediate -- the docs/agbcc-codegen.md `p[X + C]` rule, arrived at from the
 * other direction.
 *
 * The index is re-read from gUnknown_0202FDFC.unk0c after the `bl` because
 * sub_0803866C may write it; the three pool bases live in r4/r5/r6 across the
 * call because they are callee-saved. */
void sub_08077F30(void)
{
    sub_080638D0(0);

    gUnknown_03003FC0.unk02 = gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk00;

    gUnknown_030046B4 = sub_0803866C()
        ? gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk28
        : gUnknown_08615194[gUnknown_0202FDFC.unk0c].unk24;

    sub_08074744();
    sub_08074F1C();
    sub_08075304();
    sub_080755E0();
}
