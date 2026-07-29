#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08024ABC.
 * sub_08024ABC @ 0x08024ABC
 */

/* One army's worth of unit records.  The size, and nothing else, is what the
 * function needs: agbcc's EXACT_DIV for a pointer difference is
 * `multiply by inverse(d >> post_shift)` then `asr post_shift`, so the
 * `* 0xAAAAAAAB` written out as `-(x * 0x55555555)` plus `asr #8` reads back
 * as inverse(3) with post_shift 8, i.e. a stride of 3 << 8 == 0x300 == 64
 * records of struct Unk08499594.  (gcc 2.x shifts AFTER the multiply; later
 * gccs shift before, which is why this does not look like a division.) */
struct Unk08024ABCBlk
{
    struct Unk08499594 unk00[64];
};
struct Unk08024ABCArg
{
    /* 0x00 */ struct Unk08499594 *unk00;
    /* 0x04 */ u8 filler_04[0x06];
    /* 0x0a */ u16 unk0a;
    /* 0x0c */ u8 filler_0c[0x04];
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u8 filler_12[0x06];
    /* 0x18 */ u16 unk18;
};

/* Two things in here are not guessable and cost the whole difference.
 *
 * `a->unk00` is spelled INLINE rather than bound to a local, and that is what
 * puts `ldr r0, =gUnknown_08499594` ahead of `ldr r3, [r6]`.  With
 * `u = a->unk00;` as its own statement the two come out in source order and
 * the function is 4 bytes wrong at +0x16 and nowhere else.  Every later use
 * is CSE'd back to that one load, because no call sits between them on either
 * path.
 *
 * `v2` is s16 and not u16, even though the value is compared for equality
 * against 0 and never negative.  agbcc's PROMOTE_MODE truncates a `short`
 * local with `lsl #16; lsr #16` exactly as it does a `u16` one, so the two
 * spellings differ only in which register survives the truncation -- and only
 * the signed one leaves `r0` holding the pre-shift value for the `cmp r0, #0`
 * that follows.  A byte-neutral-looking type that is not.
 *
 * `v1` and `v3` really are unsigned: `cmp r7, r0; bhi` is an unsigned compare,
 * which two `u16` locals could not produce (they promote to `int`). */
void sub_08024ABC(struct Unk08024ABCArg *a, struct Unk08024ABCArg *b, s16 c, u8 d)
{
    const struct Unk085D5ABC *t;
    u16 army;
    u32 v1;
    s16 v2;
    u32 v3;

    army = ((struct Unk08024ABCBlk *)a->unk00
            - (struct Unk08024ABCBlk *)gUnknown_08499594) + 1;
    v3 = 0;
    v1 = 0;
    v2 = 0;
    t = &gUnknown_085D5ABC[a->unk00->unk00];

    if (c == 1)
    {
        v2 = sub_080433F8(a->unk00->unk00, b->unk00->unk00, 1);
        if (v2 != 0)
            v1 = sub_08043070(gUnknown_08499598[army].unk1d,
                              gUnknown_08499598[army].unk1e,
                              a->unk00->unk00, b->unk00->unk00, c);
        if (t->unk0e == 1 && a->unk00->unk04_7 != 0)
        {
            if ((b->unk00->unk01 & 0x20) != 0)
                v3 = sub_08043070(gUnknown_08499598[army].unk1d,
                                  gUnknown_08499598[army].unk1e,
                                  a->unk00->unk00, 0x19, v3);
            else
                v3 = sub_08043070(gUnknown_08499598[army].unk1d,
                                  gUnknown_08499598[army].unk1e,
                                  a->unk00->unk00, b->unk00->unk00, v3);
        }
    }
    else if (t->unk0e <= c && c <= sub_08042D50(army, a->unk00->unk00)
             && a->unk00->unk04_7 != 0 && d == 1)
    {
        if ((b->unk00->unk01 & 0x20) != 0)
            v3 = sub_08043070(gUnknown_08499598[army].unk1d,
                              gUnknown_08499598[army].unk1e,
                              a->unk00->unk00, 0x19, v3);
        else
            v3 = sub_08043070(gUnknown_08499598[army].unk1d,
                              gUnknown_08499598[army].unk1e,
                              a->unk00->unk00, b->unk00->unk00, v3);
    }

    if (v3 <= v1)
    {
        if (v2 != 0)
        {
            a->unk18 = 5;
            a->unk10 = v1;
        }
    }
    else
    {
        a->unk18 = 1;
        a->unk10 = v3;
        a->unk0a--;
    }
}
