#include "global.h"

/* PARKED at 444 of 472 bytes (wave 15, C). Every statement is identified and
 * the bitfield model is the one struct Unit already documents; the
 * candidate is 28 bytes SHORT and all of it is redundancy the ROM has and
 * agbcc removes here.
 *
 * The largest single item, 12 bytes: the `unk04_7` clamp. The ROM emits BOTH
 * arms of `if (sum > cap) q->unk04_7 = cap; else q->unk04_7 = sum;` in full,
 * with two copies of the `ands; orrs; strh` tail and two `.word 0xFFFFF87F`
 * pool words, because its `cap` arm RE-LOADS `ldrb r0, [r0, #0xb]` instead of
 * reusing the value the compare just loaded. That reload is what puts the two
 * arms in different registers and so defeats cross-jumping. Writing the field
 * read inline rather than through a local does not reproduce it -- agbcc CSEs
 * it either way -- and neither does binding the record pointer.
 *
 * 4 more bytes: `gUnknown_08091368` is const-propagated at both its uses here
 * and held in `sb` in the ROM, so this draft never pushes a second high
 * register. See the note on that boundary in docs/agbcc-codegen.md -- two uses
 * of a `pp = &<pool word>` local is not enough to keep it live; four is.
 *
 * Also unreproduced, and worth 0 bytes but visible in the diff: the ROM's
 * `ldr r4, =gUnknown_08499594` is the FIRST instruction of the body, ahead of
 * gUnknown_08499590's, which means its index expression is one statement rather
 * than the four locals used here. Ruled out: old_agbcc (identical size).  *
 * WAVE 79 (W79-F). Re-measured: the DRAFT is 444 bytes (-28) at 13.6%, first
 * difference at +0x2.
 *
 * THE "pp2 IS CONST-PROPAGATED" DIAGNOSIS ABOVE IS WRONG. Counted directly:
 * work/sub_08042998/target.s names gUnknown_08091364 ONCE and gUnknown_08091368
 * ONCE, and THE CANDIDATE DOES TOO (one .word each). There is no double
 * emission and no const-propagation to defeat. What actually differs is
 * register pressure: the ROM parks &gUnknown_08091364 in r8 AND
 * &gUnknown_08091368 in sb (`mov r8,r1` at the first **pp, `mov sb,r2` at the
 * first (*pp2)[...]) and therefore pushes TWO high registers; this draft holds
 * pp2 in r8 and pp in r7 and pushes ONE. That is the +0x2 push-mask difference,
 * and it is the LAST symptom, not the cause. The "two uses is under the
 * threshold, four is enough" rule cited above counts SURVIVING EMISSION POINTS,
 * and this function has never had more than one of either.
 *
 * Improvement kept (13.6% -> 14.2%, size unchanged): the
 * `(anchor = &gUnknown_08499594, gUnknown_08499590)` comma on the first
 * statement. The ROM's very first body instruction is
 * `ldr r4, =gUnknown_08499594`, ahead of gUnknown_08499590's; of two address
 * constants the pseudo created FIRST wins, so the anchor creates it first and
 * the literal pool now orders 08499594, 08499590, 03003100, 0x417a, 0x051a
 * exactly as the ROM does. `anchor` is never read.
 *
 * Also ruled out this wave: moving `pp2 = &gUnknown_08091368;` down from the top
 * to just before the first clamp (9.1%, size unchanged) -- it does not buy the
 * second high register.
 *
 * THE 28 SHORT BYTES ARE NOT POOL WORDS AND NOT ALLOCATION -- they are 14
 * instructions of work the ROM does and agbcc here does not, and 12 bytes of it
 * is still the un-cross-jumped unk04_7 clamp described above. The two arms end
 * with the same three instructions in SWAPPED registers
 * (`ldr r1,=0xFFFFF87F; ands r1,r6; orrs r1,r0; strh r1,[r5,#4]` against
 * `ldr r0,=0xFFFFF87F; ands r0,r6; orrs r0,r1; strh r0,[r5,#4]`), which is why
 * cross-jumping cannot merge them, and the register swap is forced by the cap
 * arm's RELOAD `ldrb r0,[r0,#0xb]`. Do not spend a budget on allocation levers
 * here until the instruction COUNT is right.
*/

void sub_08042998(void)
{
    struct Unit **const *pp;
    struct Unit **anchor;
    const struct UnitType *const *pp2;
    struct Unit **w;
    struct Unit *u;
    struct Unit *q;
    u8 *p;
    u8 *rows;
    int off;
    int t;
    int a;
    int d;
    int t2;
    u8 n;
    u16 m;
    int sum;

    p = (anchor = &gUnknown_08499594, gUnknown_08499590);
    t = gUnknown_03003100.pos.unk02 * 2;
    rows = p + 0x417A;
    off = *(u16 *)(rows + t) + gUnknown_03003100.pos.unk00;
    p += 0x51A;
    u = &gUnknown_08499594[p[off]];
    if (u->hp != 0)
        a = Div(u->hp - 1, 10) + 1;
    else
        a = 0;

    pp = &gUnknown_08091364;
    pp2 = &gUnknown_08091368;
    if ((**pp)->hp != 0)
    {
        d = Div((**pp)->hp - 1, 10);
        t2 = a + 1;
        n = t2 + d;
    }
    else
        n = a;

    if (n > 10)
    {
        m = gUnknown_030033EC;
        sub_08025B58(m, sub_08042C9C(m, (**pp)->type) * (n - 10));
        n = 10;
    }

    w = *pp;
    (*w)->hp = n * 10;
    (*w)->unk05_3 = u->unk05_3;
    if ((*w)->unk06_7 < u->unk06_7)
        (*w)->unk06_7 = u->unk06_7;

    q = *w;
    sum = q->ammo + u->ammo;
    if (sum > (*pp2)[q->type].maxAmmo)
        q->ammo = (*pp2)[q->type].maxAmmo;
    else
        q->ammo = sum;

    if (gPlaySt.savingEnabled == 0 && gPlaySt.fog == 0)
    {
        sub_08025B80(**pp, gUnknown_03004074);
        gUnknown_03004074 = 0;
    }

    q = **pp;
    sum = q->fuel + u->fuel;
    if (sum > (*pp2)[q->type].maxFuel)
        q->fuel = (*pp2)[q->type].maxFuel;
    else
        q->fuel = sum;
    u->type = 0;
    sub_080424E4();
}
