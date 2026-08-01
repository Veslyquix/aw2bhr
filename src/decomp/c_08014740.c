#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014740.
 * sub_08014740 @ 0x08014740, sub_080147B4 @ 0x080147B4, sub_08014824 @ 0x08014824
 */

/* The third member of the sub_08014668 / sub_080146D4 family, but NOT their
 * shape: those two fill &gUnknown_0200C020 and then start a script, while this
 * one starts the script FIRST and fills in the slot sub_080152EC returned.
 * r0 is never reloaded between the two `bl`s -- the proc pointer is already
 * there -- and r8 carries it to the epilogue, which is why it is the return
 * value.
 *
 * Arguments 1 and 2 are `s16`, settled wave 32 from the CALLER side and synced
 * here. The prologue's `lsls #0x10; lsrs #0x10` does NOT discriminate: agbcc's
 * PROMOTE_MODE zero-extends every sub-word parameter regardless of signedness,
 * so s16 and u16 are identical at entry. What settles it is the `lsls #0x10;
 * asrs #0x10` in front of the `bl` -- through a `u16` parameter agbcc would
 * narrow with `lsls; lsrs` there instead. Both spellings are byte-exact for
 * THIS function (verified each way), so the header is the only thing that can
 * be wrong, and it now reads s16. The other three narrow arguments stay `u16`;
 * nothing has exercised their sign. */
struct Unk03001470 *sub_08014740(s16 a, s16 b, u16 *c, u16 d, u16 e, u16 f)
{
    struct Unk03001470 *p;

    gUnknown_03002514 = 0;
    p = sub_080152EC(gUnknown_08489530, 0);
    sub_080147B4((struct Unk08014074 *)p, a, b, c, d, e, f);

    return p;
}

/* Fills in the whole tail of the record. `lsls #0x10; lsrs #0xe` on argument 5
 * is the u16 narrowing folded with the *4 scaling of gUnknown_08610A38[], a
 * `u8 *[]`, so +0x20 is a `u8 *`. The two `strb`s of arguments 2 and 3 each
 * happen twice (0x30/0x32 and 0x31/0x33) off one narrowed register. */
void sub_080147B4(struct Unk08014074 *s, s16 a2, s16 a3, u16 *a4, u16 a5, u16 a6, u16 a7)
{
    s->unk20 = gUnknown_08610A38[a5];
    s->unk24 = 0;
    s->unk28 = a4;
    s->unk2c = a6;
    s->unk2e = 0;
    s->unk34 = s->unk36 = a7;
    s->unk38 = 0;
    s->unk30 = a2;
    s->unk31 = a3;
    s->unk32 = a2;
    s->unk33 = a3;
    s->unk39 = -1;
    s->unk3a = 2;
    s->unk3c = sub_08013AEC;
    s->unk40 = 0;
}

/* "Is any of sub_08014878's three scripts still running?" -- counts the three
 * sub_08015BD0 lookups that are not -1 and returns whether the count is
 * positive.
 *
 * The first test is a BRANCHLESS `!= -1`: `mvns r0,r0; rsbs r1,r0,#0;
 * orrs r1,r0; lsrs r4,r1,#0x1f` is do_store_flag initialising the counter,
 * while the second and third are `cmp`/`beq` because they only increment.
 * -1 is materialised once in r5 for both compares. */
int sub_08014824(void)
{
    int n;

    n = sub_08015BD0((s32)gUnknown_08489530) != -1;
    if (sub_08015BD0((s32)gUnknown_08489548) != -1)
        n++;
    if (sub_08015BD0((s32)gUnknown_08489568) != -1)
        n++;

    return n > 0;
}
