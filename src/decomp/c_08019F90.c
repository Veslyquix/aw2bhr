#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019F90.
 * sub_08019F90 @ 0x08019F90
 */

/* Wave 56, W56-F. The CONSTRUCTOR for the option list that promoted
 * src/decomp/c_08019E68.c only rebuilds: same 0x20-byte entry walk, same
 * unk24[i] / unk31[n++] pair, same `sub_0801A444(unk48, unk4a, maxw + 2,
 * w >> 3)` close -- read that function first, it is the whole shape. What is
 * new here is the head (allocate the slot, park the four parameters, pick the
 * proc callback off a4) and the tail (a SECOND sub_080152EC slot at unk44,
 * sized from a2/a3).
 *
 * `p->unk31[13] = 0` is a +0x3e store that falls inside unk31[0x0f]. The array
 * length is not proved and 13 is very likely one past its real end -- see the
 * note on struct Unk8019A60 in include/unknown-globals.h. Both readings are
 * byte-identical; the shared member is deliberately not reshaped.
 *
 * `(w >> 2) >> 1` IS NOT COSMETIC AND IS NOT A PERMUTER ARTEFACT TO CLEAN UP.
 * Written as the honest `w >> 3` this function is size-exact with 17 bytes
 * differing, and every one of them is a `[sp, #N]` immediate: the eight
 * preheader computations get the right values in the wrong SPILL SLOTS.
 *
 * The mechanism, because it will recur. Everything between `ldrb r0, [r5]` and
 * `cmp r0, #0xff` in the preheader -- the six `p + K` addresses AND the two
 * `+ 1` values -- is inserted there by gcse's PRE, not by the source and not
 * by LICM: they are all used only AFTER the loop, and lazy code motion places
 * them at their earliest anticipatable point, which is the end of the
 * preheader block (PRE inserts before the block's final jump, which is why
 * they land after the guard's load and before its compare). PRE creates one
 * `reaching_reg` pseudo per expression while walking the hash table BUCKET BY
 * BUCKET, so those pseudo numbers -- and therefore the stack slots reload
 * hands out in pseudo order -- are ordered by `hash_expr` value, not by source
 * order. That is why the six addresses come out sorted by OFFSET (0x3e, 0x40,
 * 0x41, 0x42, 0x43, 0x4a) rather than in the order the tail stores them.
 * The table size is `max_cuid / 4`, i.e. a function of the PRE-REGISTER-ALLOC
 * insn count, so `a2 + 1` and `a3 + 1` (hashing on consecutive parameter
 * regnos) either land together below the address group or straddle a wrap and
 * land at both ends of it. `w >> 3` wraps; `(w >> 2) >> 1` is one more insn at
 * gcse time, moves the table size, and unwraps them.
 *
 * The practical rule: a size-exact residual whose ONLY differences are `[sp,
 * #N]` immediates is a spill-ORDER problem, and if the values were placed by
 * PRE there is no source-level spelling of the intent that fixes it -- the
 * lever is the insn count, so hand it to the permuter rather than rewriting
 * the expression that looks wrong. decomp-permuter found this in 30
 * iterations. */

int sub_08019F90(const void *a1, u16 a2, u16 a3, u16 a4, u16 a5)
{
    struct Unk8019A60 *p;
    struct Unk8019A60Item *e;
    struct Unk03001470 *q;
    s16 n;
    u16 w;
    u16 maxw;
    int i;

    n = 0;
    w = 0x10;
    maxw = 0;

    p = (struct Unk8019A60 *)sub_080152EC(gUnknown_0848A42C, 0);
    p->unk4c = a4;

    switch (a4)
    {
    case 0:
        p->unk0c = sub_08019D78;
        break;

    case 1:
        p->unk0c = sub_08019DA8;
        break;
    }

    p->unk20 = (struct Unk8019A60Item *)a1;

    for (i = 0, e = p->unk20; e->unk00 != 0xff; i++, e = &p->unk20[i])
    {
        int r;
        u16 t;

        r = e->unk04();
        p->unk24[i] = r;

        if ((r & 1) == 0)
        {
            p->unk31[n++] = i;

            t = sub_08014D20((const char *)gUnknown_08610A38[e->unk1c]);

            if (maxw < t)
                maxw = t;

            w += 0x10;
        }
    }

    p->unk40 = i;
    p->unk41 = n;
    p->unk43 = a5;
    p->unk42 = a5;
    p->unk31[13] = 0;
    p->unk48 = a2;
    p->unk4a = a3;

    q = sub_080152EC(gUnknown_0848A44C, 0);
    p->unk44 = q;
    q->unk24 = (a2 + 1) * 8;
    q->unk26 = (a3 + 1) * 8;
    q->unk20 = a5;

    sub_08019C40(p);

    sub_0801A444(p->unk48, p->unk4a, (s16)(maxw + 2), (w >> 2) >> 1);

    return (int)p;
}
