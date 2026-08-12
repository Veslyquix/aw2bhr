#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014400.
 * sub_08014400 @ 0x08014400
 */

#include "hardware.h"
/* Wave 56, W56-F.
 *
 * The third member of the sub_080149C0 / sub_08014A5C family: the same
 * `for (;;) { v = sub_08013D4C(s); switch (sub_08014084(s, v)) ... }` render
 * pump over a `struct Unk08014074 *`, but driven by a frame counter instead of
 * run to completion. src/decomp/c_080149C0.c is the exemplar and its three
 * file-local callee prototypes are repeated here for the same reason it gives:
 * none of sub_08013D4C / sub_08013D64 / sub_08014084 / sub_080143EC is declared
 * in any header, and the two promoted definitions that exist (c_08013D4C.c,
 * c_080143EC.c) use file-local partial views -- `struct Unk8013D4C` and
 * `struct Unk080143EC` -- of this same record, at the same offsets with the
 * same widths.  Declaring them against `struct Unk08014074 *` here is
 * byte-neutral and keeps this file self-consistent; the shared-header
 * unification is the clean self-contained job c_080149C0.c already describes.
 *
 * THE SWITCH HAS FOUR CASES AND `default` SHARES CASE 1'S BODY. The ROM's tree
 * is `cmp #1/beq; cmp #1/bgt; cmp #0/beq; b case1` with the `>1` arm doing
 * `cmp #2/beq; cmp #3/beq; b case1`, i.e. balance_case_nodes over {0,1,2,3}
 * rooted at 1 -- so all four labels exist.  The two unconditional `b`s go to
 * CASE 1's block, not to the end of the switch, which is what forces
 * `case 1: default:` on one body.  Omitting `default:` sends them to the loop
 * test instead.
 *
 * THE TWO `cmp r2, #0` AT THE COUNTER ARE TWO SEPARATE `if`s, not one nested
 * pair.  `if (t >= 0) { if (t < s->unk3a) return; s->unk39 = 0; }` emits the
 * zero test once.  The ROM tests it twice because the source tests it twice;
 * the first `if`'s false exit then reaches the second `if`'s identical test and
 * jump threading collapses it onto the shared continuation, which is why the
 * first branch appears to jump straight past the store.
 *
 * The VRAM destination is spelled exactly as promoted src/decomp/c_0801B780.c
 * spells its own: the char base is cast to `u8 *` so fold cannot re-associate
 * 0x06000000 out of the tile term and onto it. */

u16 *sub_08013D4C(struct Unk08014074 *);
u16 *sub_08013D64(struct Unk08014074 *);
s16 sub_08014084(struct Unk08014074 *, u16 *);
void sub_080143EC(struct Unk08014074 *, u16 *);

void sub_08014400(struct Unk08014074 *s)
{
    s8 a;
    s8 b;
    s8 t;
    int w;

    a = sub_08015BD0((s32)gUnknown_08489518);
    if (a != -1)
        return;

    b = sub_08015BD0((s32)gUnknown_0848A398);
    if (b != a)
        return;

    if ((s8)sub_08015BD0((s32)gUnknown_0848A3C4) != b)
        return;

    if (sub_08014BE8() && (gpKeySt->last & 8) && gUnknown_03002514 == 0)
    {
        gUnknown_03002514 = 1;
        sub_080179D0(sub_08013D64(s));
        s->unk3c();
        sub_08015328(gUnknown_03001FBC);
        return;
    }

    if (s->unk3a > 1 && (gpKeySt->last & 1))
        sub_08014074(s);

    t = ++s->unk39;
    if (t >= 0 && t < s->unk3a)
        return;
    if (t >= 0)
        s->unk39 = 0;

    s->unk3c();

    do
    {
        switch (sub_08014084(s, sub_08013D4C(s)))
        {
        case 0:
            sub_08015328(gUnknown_03001FBC);
            return;

        case 2:
            return;

        case 3:
            break;

        case 1:
        default:
            if (s->unk32 != s->unk30 || s->unk40 != 0)
                sub_08014CA4(s, 1);

            w = sub_0801B738(*s->unk20,
                             (int)((u8 *)(gUnknown_03002B6C.bits.chr_block * 0x4000)
                                 + (s->unk34 * 32 + 0x06000000)),
                             s->unk40, s->unk2e);

            if (s->unk40 <= 1)
                sub_080143EC(s, sub_08013D4C(s));

            if ((u8)sub_08014CA4(s, w))
                sub_080143EC(s, sub_08013D4C(s));

            if (s->unk38 != 0)
                sub_0803B4DC(0x70);

            s->unk20++;
            break;
        }
    } while (s->unk39 < 0);
}
