#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063528.
 * sub_08063528 @ 0x08063528
 */

#include "hardware.h"

/* One poll of the link-cable multiplayer handshake. The state byte at +0x18
 * selects three behaviours: 0xE0 restarts the exchange, 0xE7/0xE8 verify the
 * four SIOMULTI slots against the last value sent and advance, and anything
 * else runs the same verification with a different failure action.
 *
 * FOUR THINGS, all measured in wave 46:
 *
 *  - THE TWO LOOPS ARE DIFFERENT KINDS OF LOOP, and that is the whole reason
 *    they compile differently over the same expression. The default arm is a
 *    real `do`/`while`, so loop.c LICM-hoists the constant 1 into r6 and
 *    strength-reduces `SIOMULTI[i]` into a pointer walking DOWN by 2 from
 *    0x04000126. The 0xE7/0xE8 arm is a GOTO loop, carries no
 *    NOTE_INSN_LOOP_BEG, and loop.c never runs on it -- hence `movs r1, #1`
 *    inside the body and the address rebuilt as 0x04000120 + i * 2 every pass.
 *    Do not author the walking pointer; it is strength_reduce's.
 *
 *  - `_080635A4` IS A REAL SOURCE LABEL, not a cross-jump artefact. The tail
 *    re-reads p->unk00 with `ldrh` immediately after storing it, which CSE
 *    would fold away -- and does, into an `lsls #0x10; lsrs #0x10` pair -- if
 *    the load starts a straight-line block. It survives only because the
 *    0xE7/0xE8 arm's `goto send` makes that label a join point, ending the
 *    extended basic block. `_080635A6`, one instruction later, IS cross-jumping:
 *    the 0xE0 arm's `return sub_080633E4(p, 0);` shares the call and the branch
 *    to the epilogue but not the `ldrh`.
 *
 *  - THE TWO OUT-OF-LINE EXITS ARE ORDERED. `goto fail` and `goto done` put the
 *    sub_08062FB8 block and the `movs r0, #0` block after the arm in source
 *    order; writing either as an inline `return` inverts a branch and moves the
 *    block, which is the same bytes in the wrong place.
 *
 *  - THE ZERO-TRIP `do { } while (0)` IS LOAD-BEARING and was found by
 *    decomp-permuter after the hand draft reached 236/236 bytes with r2 and r3
 *    swapped between `p` and `v`. gcc weights allocno priority by LOOP DEPTH, so
 *    the wrapper promotes `v` above `p`; `v` then takes r2 and `p` takes r3, as
 *    the ROM has them. Every other instruction was already exact. See the
 *    zero-trip do/while chapter in docs/agbcc-codegen.md. */
int sub_08063528(struct Unk08062FB8 *p)
{
    int i;
    int bits;
    int t;
    u16 v;

    switch (p->unk18)
    {
    case 0xE7:
    case 0xE8:
        i = 3;
        bits = p->unk1e;
        goto multi;
    case 0xE0:
reset:
        p->unk18 = 0xE1;
        p->unk04 = 0;
        p->unk00 = 0x100000;
        return sub_080633E4(p, 0);
    }

    i = 3;
    bits = p->unk1e;

    do
    {
        do
        {
            v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);

            if ((bits >> i) & 1)
            {
                if (v != p->unk04)
                    goto reset;
            }
        } while (0);
    } while (--i != 0);

    p->unk18++;
    t = p->unk00;
    p->unk04 = (u16)p->unk00;

    if (t == 0)
    {
        t = p->unk28[0xac] | (p->unk28[0xad] << 8);
        p->unk04 = t;
        t <<= 5;
        p->unk00 = t;
    }

    p->unk00 = (u32)p->unk00 >> 5;

send:
    return sub_080633E4(p, (u16)p->unk00);

multi:
    v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);

    if ((bits >> i) & 1)
    {
        if (v != p->unk04)
            goto fail;
    }

    if (--i != 0)
        goto multi;

    p->unk18++;

    if (p->unk18 == 0xE9)
        goto done;

    t = p->unk28[0xae] | (p->unk28[0xaf] << 8);
    p->unk00 = t;
    p->unk04 = t;
    goto send;

fail:
    sub_08062FB8(p);
    return 0x71;

done:
    return 0;
}
