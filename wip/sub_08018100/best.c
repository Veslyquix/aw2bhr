#include "global.h"

/* NOT MATCHED -- 94 bytes against 88 expected... see below.
 *
 * Remaining diff: ONE extra instruction, `adds r5, r1, #0` at +0x06. The ROM
 * puts the promoted parameter straight into r5 (`lsls r0, r0, #0x10;
 * lsrs r5, r0, #0x10`) and reads r5 at both uses; this candidate lands it in r1
 * and copies it to r5, then reads r1 before the call and r5 after. Everything
 * else -- the pool-word order, the .rodata address constant for
 * gUnknown_0200C528 (which is what the disassembly calls gUnknown_0808E568),
 * the whole if-body and the whole tail -- is instruction-for-instruction right.
 *
 * Ruled out, each by probe (wave 32, W32-A): binding the node pointer to a
 * local; binding the halfword to a local; `u16 a` with `(s16)a` at both uses;
 * an extra unused second parameter; the assignment folded into the call
 * argument; the test inverted with the increment duplicated into both arms;
 * naming the node twice so CSE sees a third reference. All seven produce the
 * identical extra copy.
 *
 * What the copy tracks is the CSE-hoisted base pointer in r4: sub_08018464 --
 * matched, same block, same shape but with only ONE reference to
 * gUnknown_0200C528, so no hoist -- has the copy in the ROM too
 * (`lsrs r1, r0, #0x10; adds r4, r1, #0`), and the pY probe above (base not
 * hoisted) drops it. So the ROM here coalesced a parameter copy that agbcc
 * declines to coalesce for every spelling tried. Register allocation, not
 * structure -- do not rewrite the body. */
bool8 sub_08018100(s16 a)
{
    if (gUnknown_03002514 != 1)
    {
        gUnknown_03002F08.unk02 = gUnknown_0200C528[a].unk04->unk08;
        sub_0801815C(gUnknown_03002F08.unk02);
    }
    gUnknown_0200C528[a].unk04++;
    return FALSE;
}
