#include "global.h"
#include "hardware.h"

/* THIS FUNCTION IS THE AGB SDK'S MultiBootMain, AND THAT IS THE FINDING.
 * struct Unk08062FB8 is MultiBootParam member for member -- +0x14
 * handshake_data, +0x16 handshake_timeout, +0x18 probe_count, +0x19..0x1b
 * client_data[3], +0x1c palette_data, +0x1d response_bit, +0x1e client_bit,
 * +0x28 masterp, +0x48 sendflag, +0x49 probe_target_bit, +0x4a check_wait,
 * +0x4b server_type.
 *
 * W60-F: both loops in case 0 are PEELED IN THE SOURCE, not rotated by the
 * compiler -- worth 44 bytes (-56 -> -12). See NOTES.md. PRESERVE THEM.
 *
 * WAVE 88 (W88-A), configured profile. 996 (-12) -> 1000 (-8), 14.4% -> 22.3%
 * (new best), and the literal pool is now 14/14 in the ROM's exact order.
 * TWO pre-registered hypotheses, both CONFIRMED:
 *
 * 1. THE MISSING POOL WORD IS THE SECOND case-0 LOOP, AND THAT LOOP IS A GOTO
 *    LOOP. The word the candidate lacked was the sixth, the 0x04000120 at
 *    _08063168, and in the ROM it is loaded INSIDE the probe loop's body and
 *    reloaded every iteration:
 *        _08063114: subs r5,#1 / cmp r5,#0 / beq _08063140
 *                   lsls r0,r5,#1 / ldr r1,_08063168 / adds r0,r0,r1 / ldrh
 *    An invariant rebuilt in the body, ONE copy of the decrement-and-test, that
 *    copy at the TOP, and every continue-branch jumping back to it: no
 *    rotation, so loop.c never saw this loop. Written as
 *        probenext: if (--i == 0) goto probedone; ... goto probenext;
 *    the pool becomes 14/14 in the ROM's order. A `while (--i != 0)` is rotated
 *    AND its invariant is hoisted, which merges this constant with the
 *    preceding loop's and costs the word. This is the .rodata force-addr
 *    chapter's mechanism applied to a plain CONSTANT: what re-materialises a
 *    pool constant inside a loop body is that loop.c cannot see the loop.
 *
 * 2. THE SIZE DEFICIT IS THE RETURN BLOCK, AND THE ROM'S SURVIVOR IS A
 *    FALLEN-INTO TRAILING `return 0`. The ROM ends
 *        ... bl sub_08062FB8 / movs r0,#96 / b _080633D4
 *        _080633D2: movs r0,#0
 *        _080633D4: pop {r3,r4,r5} ...
 *    -- the err path branches OVER a `movs r0,#0` that falls into the epilogue.
 *    The draft's source ended with the err block, so its `return 0`s
 *    cross-jumped to an EARLY block (the candidate branched back to +0x26).
 *    Adding `ret0: return 0;` after the err block, with `goto ret0` at the two
 *    sites the ROM branches forward from, is worth EIGHT BYTES.
 *
 * The park's "code one instruction short (-2), pool 13/14, section -12" was two
 * COMPENSATING errors: the probe loop was 4 bytes too LONG (rotated where the
 * ROM is not) while the return blocks were 12 short.
 *
 * WAVE 88 (W88-D): ALL FOUR `return 0` SITES GO TO THE TRAILING BLOCK, not
 * just the two W88-A converted. Read off the ROM directly -- every one of them
 * is a `b _080633D2`, and two of them are reached by the inverted
 * `cmp r0,#0 / beq <next> / b _080633D2` pair that gcc emits when the trailing
 * block is out of a conditional branch's range:
 *     +0x10  bl sub_08063518 / cmp r0,#0 / beq _0806300A / b _080633D2
 *     +0x1a  (unk4a > 0xf)   subs/strb           / b _080633D2
 *     _08063078 bl sub_08063518 / cmp r0,#0 / beq _08063084 / b _080633D2
 *     _08063094 (unk16--)   subs/strh           / b _080633D2
 * All four are now spelled `goto ret0;` (W88-A had converted only two).
 *
 * THAT CHANGE IS BYTE-NEUTRAL -- MEASURED, 1000 bytes / 22.32% / first
 * difference +0x14 both before and after, identical to the digit. Converting
 * two sites or four makes no difference, because CROSS-JUMPING IS POST-RELOAD
 * and merges every `return 0` tail regardless of how the source spells it.
 * What W88-A's +8 actually bought was the trailing BLOCK POSITION (a `ret0:`
 * after the `err` block, so the survivor is the fallen-into one), not the
 * `goto` at any particular site. The four-site spelling is kept only because it
 * matches the ROM's control flow honestly.
 *
 * AND THE "FIRST DIFFERENCE AT +0x14" IS A POSITIONAL ARTEFACT -- W88-A's
 * reading of it ("one of the two early `return 0`s is still laid out
 * differently; settle which one keeps its own block") is REFUTED. +0x14 is the
 * `b _080633D2` of the first early return, and the ONLY thing wrong with it is
 * the branch TARGET: the ROM's is 0x3de and the candidate's 0x3d6, because the
 * candidate is 8 bytes shorter DOWNSTREAM. Every visible difference in the
 * first 60 lines of the diff is either that shift or the wave-59 cosmetic
 * class (`beq.n 16 <_0806300A>` against `beq.n 16 <sub_08062FF4+0x16>` is the
 * same encoding to the same address). The entry block is byte-identical and
 * there is nothing to fix there.
 *
 * WHERE THE -8 ACTUALLY IS: downstream, in the `case 0xd1` and `default:`
 * regions. Two named residuals, neither a return-block fact:
 *   - case 0xd1's do-loop: the ROM HOLDS the SIOMULTI address in a register
 *     across the loop (`ldrh r0,[r2,#0]` ... `subs r2,#2`) while the candidate
 *     spends an extra `ldr r1,[pc,#48]` on it -- the candidate is +2 there, so
 *     the rest of the body is -10.
 *   - `default:`'s prologue is a pure ALLOCNO PERMUTATION, same instruction
 *     count: the ROM builds mp+0x49 into ip and copies to r8
 *     (`mov ip,r2 / mov r8,ip`), the candidate builds it into r8 and copies to
 *     ip. Same for the block around `eors r6,r3`. Both hold ONE address in TWO
 *     registers, so the two source locals are already right; only the creation
 *     order differs. No size in it.
 * The next agent should localise the remaining -10 in the switch body and NOT
 * re-derive the return blocks, the peeled case-0 loops or MultiBootParam.
 */

void sub_08063430(struct Unk08062FB8 *);
int sub_08063528(struct Unk08062FB8 *);

struct Mb62FF4
{
    /* 0x00 */ u8 filler_00[0x14];
    /* 0x14 */ u8 unk14;
    /* 0x15 */ u8 filler_15[0x04];
    /* 0x19 */ u8 unk19[3];
    /* 0x1c */ u8 filler_1c[0x2d];
    /* 0x49 */ u8 unk49;
};

int sub_08062FF4(struct Unk08062FB8 *mp)
{
    int i;
    int j;
    int v;
    int bits;

    if (sub_08063518(mp))
        goto ret0;

    if (mp->unk4a > 0xf)
    {
        mp->unk4a--;
        goto ret0;
    }

top:
    if (mp->unk48)
    {
        mp->unk48 = 0;
        i = REG_SIOCNT & 0xfc;
        if (i != 8)
        {
            sub_08062FB8(mp);
            return i ^ 8;
        }
    }

    if (mp->unk18 > 0xdf)
    {
        i = sub_08063528(mp);
        if (i != 0)
            return i;
        if (mp->unk4b == 1 && mp->unk18 > 0xe1 && sub_08063518(mp) == 0)
            goto again;
        if (sub_08063518(mp))
            goto ret0;
        if (mp->unk16 == 0)
        {
            sub_08062FB8(mp);
            return 0x71;
        }
        mp->unk16--;
        goto ret0;
    }

    switch (mp->unk18)
    {
    case 0:
        j = 0xe;
        i = 3;
        bits = mp->unk1e;
        if (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2) == 0xffff)
        {
            do
            {
                j >>= 1;
                if (--i == 0)
                    break;
            }
            while (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2) == 0xffff);
        }
        j &= 0xe;
        mp->unk1d = j;

        i = 3;
        v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
        if (((bits >> i) & 1) == 0)
            goto probenext;
        if (v != (0x7200 | (1 << i)))
        {
            j = 0;
            goto probedone;
        }
probenext:
        if (--i == 0)
            goto probedone;
        v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
        if (((bits >> i) & 1) == 0)
            goto probenext;
        if (v == (0x7200 | (1 << i)))
            goto probenext;
        j = 0;
probedone:
        mp->unk1e = j & bits;
        if (j == 0)
            mp->unk4a = 0xf;
        if (mp->unk4a != 0)
        {
            mp->unk4a--;
            goto send;
        }
        if (mp->unk1d == mp->unk1e)
            goto send;
        sub_08063430(mp);
        goto handshake;

send:
        return sub_080633E4(mp, 0x6200 | mp->unk1e);

    case 1:
handshake:
        ((struct Mb62FF4 *)mp)->unk49 = 0;
        i = 3;
        do
        {
            v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
            if (v >> 8 == 0x72)
            {
                gUnknown_030005EC[i - 1] = v;
                v &= 0xff;
                if (v == (1 << i))
                    ((struct Mb62FF4 *)mp)->unk49 |= v;
            }
        } while (--i != 0);
        if (mp->unk1d != ((struct Mb62FF4 *)mp)->unk49)
            goto send;
        mp->unk18 = 2;
        return sub_080633E4(mp, 0x6100 | ((struct Mb62FF4 *)mp)->unk49);

    case 2:
        i = 3;
        do
        {
            if ((((struct Mb62FF4 *)mp)->unk49 >> i) & 1)
            {
                if (*(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2)
                        != gUnknown_030005EC[i - 1])
                    ((struct Mb62FF4 *)mp)->unk49 ^= 1 << i;
            }
        } while (--i != 0);
        goto advance;

    case 0xd0:
        j = 1;
        i = 3;
        do
        {
            v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
            ((struct Mb62FF4 *)mp)->unk19[i - 1] = v;
            if ((((struct Mb62FF4 *)mp)->unk49 >> i) & 1)
            {
                if (v >> 8 != 0x72 && v >> 8 != 0x73)
                    goto err;
                if (v == gUnknown_030005EC[i - 1])
                    j = 0;
            }
        } while (--i != 0);
        if (j == 0)
            return sub_080633E4(mp, 0x6300 | mp->unk1c);
        mp->unk18 = 0xd1;
        j = 0x11;
        i = 3;
        do
            j += ((struct Mb62FF4 *)mp)->unk19[i - 1];
        while (--i != 0);
        ((struct Mb62FF4 *)mp)->unk14 = j;
        j &= 0xff;
        return sub_080633E4(mp, 0x6400 | j);

    case 0xd1:
        i = 3;
        bits = ((struct Mb62FF4 *)mp)->unk49;
        do
        {
            v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
            if ((bits >> i) & 1)
            {
                if (v >> 8 != 0x73)
                    goto err;
            }
        } while (--i != 0);
        i = MultiBoot(mp);
        if (i == 0)
        {
            mp->unk18 = 0xe0;
            mp->unk16 = 0x190;
            goto ret0;
        }
        sub_08062FB8(mp);
        mp->unk4a = 0x1e;
        return 0x70;

    default:
        i = 3;
        do
        {
            if ((((struct Mb62FF4 *)mp)->unk49 >> i) & 1)
            {
                v = *(vu16 *)(REG_BASE + REG_OFFSET_SIOMULTI0 + i * 2);
                if (v >> 8 != 0x62 - (mp->unk18 >> 1) || (v & 0xff) != (1 << i))
                    ((struct Mb62FF4 *)mp)->unk49 ^= 1 << i;
            }
        } while (--i != 0);
        if (mp->unk18 == 0xc4)
        {
            mp->unk1e = ((struct Mb62FF4 *)mp)->unk49 & 0xe;
            mp->unk18 = 0;
            goto send;
        }
    }

advance:
    if (((struct Mb62FF4 *)mp)->unk49 == 0)
    {
        sub_08062FB8(mp);
        return 0x50;
    }
    mp->unk18 += 2;
    if (mp->unk18 == 0xc4)
        goto send;
    i = sub_080633E4(mp, (mp->unk28[mp->unk18 - 3] << 8) | mp->unk28[mp->unk18 - 4]);
    if (i != 0)
        return i;
    if (mp->unk4b != 1)
        goto ret0;
again:
    sub_0806362C();
    goto top;
err:
    sub_08062FB8(mp);
    return 0x60;
ret0:
    return 0;
}
