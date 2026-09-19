#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800FD44.
 * sub_0800FD44 @ 0x0800FD44
 */

/* Wave 56, W56-P produced the read-out below and transcribed through count==2.
 * Wave 66, W66-O completed count==3 and count==4 from the immutable assembly.
 * All logical blocks are now represented, including the four deliberate
 * repeated-call tie-breaks and count==4's <=0 pass before its <=1 pass.
 * Wave 67 first source-CFG breakthrough: spelling count==1's two 0x142 exits
 * as gotos to shared return labels collapsed the long-branch cascade, leaving
 * a 2232/2240-byte fixpoint whose only absent code was the logically
 * unreachable count>4 default.
 *
 * Controlled attempts to retain that dead default (external -1 label,
 * if/else count ladder, reordered labels, and a do/while wrapper) changed the
 * cross-jump CFG and fell back to +64/+72 or undershot by 20/72 bytes. Six
 * compiler-profile probes also failed to reproduce the ROM layout. A fresh
 * residual pass closed it by putting count==4 in a one-case switch, placing
 * ret143, ret142, then `default: return -1` inside that switch, and spelling
 * the count==4 shared tail as gotos plus fall-through into those labels. That
 * keeps the late ret143 copy from being cross-jumped to an early one while the
 * switch retains the otherwise unreachable default. Configured verification
 * is exact: 2240/2240 bytes and matching relocations.
 *
 * ------------------------------------------------------------------ READ-OUT
 *
 * NOTHING HERE NEEDS A NEW DECLARATION. gUnknown_08499590 is the only data ref
 * and it is the map POINTER (`extern u8 *`), reached with TWO loads here
 * (`ldr r0,=gUnknown_08499590; ldr r1,[r0]`) and not the three-load
 * -fforce-addr form -- so there is no pool word to carve for this function,
 * unlike sub_0800B61C. The struct is the one src/decomp uses everywhere:
 * cells (u16) at +0x0A22, terrain at +0x1432, rowOffset (u16) at +0x417A.
 *
 * CALLEE SIGNATURE -- READ THIS BEFORE DECLARING ANYTHING. sub_0800F77C was
 * MATCHED earlier in wave 56 by W56-J and its status in data/functions.json
 * still says `asm` because promotion happens at wave close. Its verified draft
 * is work/sub_0800F77C/sub_0800F77C.c and the signature is
 *     int sub_0800F77C(int x, int y, int dir);
 * Do not re-derive it from the call sites here and do not add a conflicting
 * declaration to include/ -- proto_check compiles nothing and cannot see a
 * work/ draft, so only compiling this caller would catch the break.
 *
 * sub_0800F8D4 is PARKED, not matched -- do not read its draft as a worked
 * example. Only its arity matters here: (int, int), result truth-tested.
 *
 * THE RETURN-CONSTANT MAP. Nine exits, and naming them is what makes the rest
 * legible. agbcc builds three of them with `movs #k; lsls #1`, so read those as
 * the literal, not as a shift in the source:
 *     _080105F0  0x142   (movs #0xa1; lsls #1)   "blocked / no join"
 *     _080105E8  0x143
 *     _08010540  0x161
 *     _08010564  0x141
 *     _08010588  0x160   (movs #0xb0; lsls #1)
 *     _080105AA  0x140   (movs #0xa0; lsls #1)
 *     _080100A4  0x122   (movs #0x91; lsls #1)
 *     _080101E4  0x123
 *     _080105F6  -1      (the count>4 fall-through)
 *
 * THE SHARED TAIL IS ONE CHAIN, AND IT IS THE COUNT==4 DEFAULT PATH. The run
 * _08010524 -> _08010548 -> _0801056C -> _0801058E -> _080105B0 reads as
 *     if (F(0) <= 1 && F(2) <= 1) return 0x161;
 *     if (F(0) <= 1 && F(3) <= 1) return 0x141;
 *     if (F(1) <= 1 && F(2) <= 1) return 0x160;
 *     if (F(1) <= 1 && F(3) <= 1) return 0x140;
 *     if (F(0) <= 1) return 0x142;
 *     if (F(1) <= 1) return 0x142;
 *     if (F(2) <= 1) return 0x143;
 *     if (F(3) <= 1) return 0x143;
 *     return 0x142;
 * where F(d) is sub_0800F77C(x, y, d). EVERY earlier arm cross-jumps into the
 * middle of this chain -- that is why the count==2 arms end in `b _08010540`
 * and friends, and why `_0800FE76` / `_0800FE86` are branched to from six
 * places as though they were subroutines. They are not separate code: they are
 * gcc's cross-jumping merging identical `bl sub_0800F77C; cmp r0,#1; bgt ...`
 * tails. DO NOT try to author those merges -- write the arms out longhand and
 * they will merge by themselves. Mis-reading them as shared source is the one
 * way this function turns into a rewrite.
 *
 * THE FOUR-SHAPE PATTERN. Every arm from count==2 onward is built from one
 * shape instantiated on a (dirA, dirB) pair, with the pair fixing the constant:
 *     (0,2) -> 0x161     (0,3) -> 0x141     (1,2) -> 0x160     (1,3) -> 0x140
 * and the shape is
 *     if (F(a) <= 1 && F(b) <= 1) return PAIR;
 *     if (F(a) <= 1) return 0x142;
 *     if (F(b) <= 1) return 0x143;
 *     return 0x142;
 * Count the DISTINCT shapes, not the bytes: there are four, plus the
 * "both <= 1, compare them" tie-break below, and that is the whole function.
 *
 * THE TIE-BREAK, which appears four times in count==3 and count==4 (_0801000A,
 * _080100AA, _08010148, _080101EC) and is the only place F() is called twice
 * for its VALUE rather than for a predicate:
 *     if (F(a) <= 1 && F(b) <= 1)
 *         return F(a) < F(b) ? PAIR_A : PAIR_B;
 *     if (F(a) <= 1) return PAIR_A;
 *     if (F(b) <= 1) return PAIR_B;
 *     return 0x142;
 * The ROM really does re-call sub_0800F77C for the comparison after having
 * called it for the guard -- four calls on that path. It is not a CSE failure
 * to fix; the source is written that way.
 *
 * COUNT==3 AND COUNT==4 TEST `== 2`, NOT `!= 0`. count==2's arms branch on
 * `s[i] != 0`; count==3 and count==4 open with `cmp r0, #2` on the same bytes
 * and only fall back to `!= 0` further in. sub_0800F564's result is therefore a
 * small enum (0, 1, 2, 3 are all reachable -- see sub_0800F77C's draft, which
 * returns 0, 2 and a count) and 2 is a distinguished value. That is the single
 * fact most likely to be got wrong by someone skimming the two arms.
 *
 * THE COUNT LADDER IS AN if/else-if CHAIN, NOT A switch. Five arms compared in
 * order 0,1,2,3,4 with the bodies in the same order; a 5-case switch balances
 * its decision tree and would open with `cmp #2`. (Measured this wave on
 * sub_0800B61C: a 3-case switch already balances.)
 */

#define MAP gMap
/* Declared HERE and deliberately not in include/unknown-functions.h. The
 * signature is copied verbatim from the verified draft
 * work/sub_0800F77C/sub_0800F77C.c (W56-J matched it earlier in wave 56); its
 * status still reads `asm` only because promotion happens at wave close, and
 * W56-J owns the include/ entry. A file-local prototype cannot conflict with
 * whatever that promotion adds, and it keeps this draft compiling in the
 * meantime. */
int sub_0800F77C(int, int, int);

int sub_0800FD44(int x, int y, int a3)
{
    u8 s[4];
    int i;
    int n;

    n = 0;

    if (a3 == 0
     && (u16)(MAP->tile[MAP->rowOffset[y] + x] - 0x162) <= 1)
        return sub_08010604(x, y);

    if (sub_0800F8D4(x, y))
        return MAP->tile[MAP->rowOffset[y] + x];

    for (i = 0; i < 4; i++)
    {
        s[i] = sub_0800F564(x, y, i);
        if (s[i])
            n++;
    }

    if (n == 0)
        return 0x142;

    if (n == 1)
    {
        if (s[0])
            goto ret142;
        if (s[1])
            goto ret142;
        goto ret143;
    }

    if (n == 2)
    {
        if (s[0] && s[1])
            return 0x142;
        if (s[2] && s[3])
            return 0x143;

        if (s[0] && s[2])
        {
            if (sub_0800F77C(x, y, 0) <= 1 && sub_0800F77C(x, y, 2) <= 1)
                return 0x161;
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x143;
            return 0x142;
        }
        if (s[0] && s[3])
        {
            if (sub_0800F77C(x, y, 0) <= 1 && sub_0800F77C(x, y, 3) <= 1)
                return 0x141;
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x143;
            return 0x142;
        }
        if (s[1] && s[2])
        {
            if (sub_0800F77C(x, y, 1) <= 1 && sub_0800F77C(x, y, 2) <= 1)
                return 0x160;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x143;
            return 0x142;
        }
        if (s[1] && s[3])
        {
            if (sub_0800F77C(x, y, 1) <= 1 && sub_0800F77C(x, y, 3) <= 1)
                return 0x140;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x143;
            return 0x142;
        }
        return 0x122;
    }

    if (n == 3)
    {
        if (s[0] == 2 && s[1] == 2)
            return 0x142;
        if (s[2] == 2 && s[3] == 2)
            return 0x143;
        if (s[0] == 2 && s[2] == 2)
            return 0x161;
        if (s[0] == 2 && s[3] == 2)
            return 0x141;
        if (s[1] == 2 && s[2] == 2)
            return 0x160;
        if (s[1] == 2 && s[3] == 2)
            return 0x140;

        if (s[0] == 2)
        {
            if (s[1])
            {
                if (sub_0800F77C(x, y, 1) <= 1)
                    return 0x142;
                if (s[2])
                {
                    if (sub_0800F77C(x, y, 2) <= 1)
                        return 0x161;
                    return 0x142;
                }
                if (s[3])
                {
                    if (sub_0800F77C(x, y, 3) <= 1)
                        return 0x141;
                    return 0x142;
                }
                return 0x122;
            }
            if (sub_0800F77C(x, y, 2) <= 1
             && sub_0800F77C(x, y, 3) <= 1)
            {
                if (sub_0800F77C(x, y, 2) < sub_0800F77C(x, y, 3))
                    return 0x161;
                return 0x141;
            }
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x161;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x141;
            return 0x142;
        }

        if (s[1] == 2)
        {
            if (s[0])
            {
                if (sub_0800F77C(x, y, 0) <= 1)
                    return 0x142;
                if (s[2])
                {
                    if (sub_0800F77C(x, y, 2) <= 1)
                        return 0x160;
                    return 0x142;
                }
                if (s[3])
                {
                    if (sub_0800F77C(x, y, 3) <= 1)
                        return 0x140;
                    return 0x142;
                }
                return 0x122;
            }
            if (sub_0800F77C(x, y, 2) <= 1
             && sub_0800F77C(x, y, 3) <= 1)
            {
                if (sub_0800F77C(x, y, 2) < sub_0800F77C(x, y, 3))
                    return 0x160;
                return 0x140;
            }
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x160;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x140;
            return 0x142;
        }

        if (s[2] == 2)
        {
            if (s[3])
            {
                if (sub_0800F77C(x, y, 3) <= 1)
                    return 0x143;
                if (s[0])
                {
                    if (sub_0800F77C(x, y, 0) <= 1)
                        return 0x161;
                    return 0x143;
                }
                if (s[1])
                {
                    if (sub_0800F77C(x, y, 1) <= 1)
                        return 0x160;
                    return 0x143;
                }
                return 0x123;
            }
            if (sub_0800F77C(x, y, 0) <= 1
             && sub_0800F77C(x, y, 1) <= 1)
            {
                if (sub_0800F77C(x, y, 0) < sub_0800F77C(x, y, 1))
                    return 0x161;
                return 0x160;
            }
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x161;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x160;
            return 0x143;
        }

        if (s[3] == 2)
        {
            if (s[2])
            {
                if (sub_0800F77C(x, y, 2) <= 1)
                    return 0x143;
                if (s[0])
                {
                    if (sub_0800F77C(x, y, 0) <= 1)
                        return 0x141;
                    return 0x143;
                }
                if (s[1])
                {
                    if (sub_0800F77C(x, y, 1) <= 1)
                        return 0x140;
                    return 0x143;
                }
                return 0x123;
            }
            if (sub_0800F77C(x, y, 0) <= 1
             && sub_0800F77C(x, y, 1) <= 1)
            {
                if (sub_0800F77C(x, y, 0) < sub_0800F77C(x, y, 1))
                    return 0x141;
                return 0x140;
            }
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x141;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x140;
            return 0x143;
        }

        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 1) <= 1)
            return 0x142;
        if (sub_0800F77C(x, y, 2) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            return 0x143;
        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 2) <= 1)
            return 0x161;
        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            return 0x141;
        if (sub_0800F77C(x, y, 1) <= 1
         && sub_0800F77C(x, y, 2) <= 1)
            return 0x160;
        if (sub_0800F77C(x, y, 1) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            return 0x140;
        if (sub_0800F77C(x, y, 0) <= 1)
            return 0x142;
        if (sub_0800F77C(x, y, 1) <= 1)
            return 0x142;
        if (sub_0800F77C(x, y, 2) <= 1)
            return 0x143;
        if (sub_0800F77C(x, y, 3) <= 1)
            return 0x143;
        return 0x142;
    }

    switch (n)
    {
    case 4:
    {
        if (s[0] == 2 && s[1] == 2)
            return 0x142;
        if (s[2] == 2 && s[3] == 2)
            return 0x143;
        if (s[0] == 2 && s[2] == 2)
            return 0x161;
        if (s[0] == 2 && s[3] == 2)
            return 0x141;
        if (s[1] == 2 && s[2] == 2)
            return 0x160;
        if (s[1] == 2 && s[3] == 2)
            return 0x140;

        if (s[0] == 2)
        {
            if (sub_0800F77C(x, y, 1) <= 0)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 0)
                return 0x161;
            if (sub_0800F77C(x, y, 3) <= 0)
                return 0x141;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x161;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x141;
            return 0x142;
        }

        if (s[1] == 2)
        {
            if (sub_0800F77C(x, y, 0) <= 0)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 0)
                return 0x160;
            if (sub_0800F77C(x, y, 3) <= 0)
                return 0x140;
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x142;
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x160;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x140;
            return 0x142;
        }

        if (s[2] == 2)
        {
            if (sub_0800F77C(x, y, 3) <= 0)
                return 0x143;
            if (sub_0800F77C(x, y, 0) <= 0)
                return 0x161;
            if (sub_0800F77C(x, y, 1) <= 0)
                return 0x160;
            if (sub_0800F77C(x, y, 3) <= 1)
                return 0x143;
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x161;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x160;
            return 0x143;
        }

        if (s[3] == 2)
        {
            if (sub_0800F77C(x, y, 2) <= 0)
                return 0x143;
            if (sub_0800F77C(x, y, 0) <= 0)
                return 0x141;
            if (sub_0800F77C(x, y, 1) <= 0)
                return 0x140;
            if (sub_0800F77C(x, y, 2) <= 1)
                return 0x143;
            if (sub_0800F77C(x, y, 0) <= 1)
                return 0x141;
            if (sub_0800F77C(x, y, 1) <= 1)
                return 0x140;
            return 0x143;
        }

        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 1) <= 1)
            goto ret142;
        if (sub_0800F77C(x, y, 2) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            goto ret143;
        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 2) <= 1)
            return 0x161;
        if (sub_0800F77C(x, y, 0) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            return 0x141;
        if (sub_0800F77C(x, y, 1) <= 1
         && sub_0800F77C(x, y, 2) <= 1)
            return 0x160;
        if (sub_0800F77C(x, y, 1) <= 1
         && sub_0800F77C(x, y, 3) <= 1)
            return 0x140;
        if (sub_0800F77C(x, y, 0) <= 1)
            goto ret142;
        if (sub_0800F77C(x, y, 1) <= 1)
            goto ret142;
        if (sub_0800F77C(x, y, 2) <= 1)
            goto ret143;
        if (sub_0800F77C(x, y, 3) > 1)
            goto ret142;
    }
ret143:
        return 0x143;
ret142:
        return 0x142;
    default:
        return -1;
    }
}
