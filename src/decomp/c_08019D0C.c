#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019D0C.
 * sub_08019D0C @ 0x08019D0C, sub_08019D48 @ 0x08019D48, sub_08019D78 @ 0x08019D78, sub_08019DA8 @ 0x08019DA8, sub_08019DCC @ 0x08019DCC, sub_08019DEC @ 0x08019DEC
 */

/* The 0x48-byte object the 0x08019A60-0x08019D48 group walks. It is NOT the
 * object sub_08019DCC/sub_08019DEC take: both arrive as a ProcPtr, but this one
 * holds a word pointer at +0x20 where that one holds an `ldrsh` halfword, so
 * they are different objects and keep different tags. */
struct Unk08019B50Cmd /* 0x20 */
{
    /* 0x00 */ u8 filler_00[0x0c];
    /* 0x0c */ void (*unk0c)(u8, u8, u8);
    /* 0x10 */ u8 filler_10[0x10];
};
struct Unk08019B50 /* 0x48 */
{
    /* 0x00 */ u8 filler_00[0x20];
    /* 0x20 */ struct Unk08019B50Cmd *unk20;
    /* 0x24 */ u8 unk24[0x0d];
    /* 0x31 */ u8 unk31[0x10];
    /* 0x41 */ u8 unk41;
    /* 0x42 */ u8 unk42;
    /* 0x43 */ u8 filler_43[0x01];
    /* 0x44 */ struct Unk03001470 *unk44;
};
/* The coordinate object the 0x08019DCC/0x08019DEC pair takes. Distinct from
 * struct Unk08019B50 in the same unit: +0x20 is an `ldrsh` halfword here and a
 * word pointer there. */
struct Unk08019DCC /* 0x28 */
{
    /* 0x00 */ u8 filler_00[0x1e];
    /* 0x1e */ s16 unk1e;
    /* 0x20 */ s16 unk20;
    /* 0x22 */ u8 filler_22[0x02];
    /* 0x24 */ s16 unk24;
    /* 0x26 */ u16 unk26;
};

/* The parameter is typed rather than taken as a ProcPtr and cast to a local:
 * the cast-to-a-local spelling keeps the incoming copy AND the local in
 * separate registers here (r4 and r5, because both are live across the calls)
 * and costs a `push {r5}` the ROM does not have. sub_08019D48 below is the
 * other way round -- there the local coalesces and either spelling matches. */
void sub_08019D0C(struct Unk08019B50 *p)
{
    if (!sub_08019B80(p))
        sub_08019A60(p);

    if (sub_08015BD0((s32)gUnknown_0848A42C) != -1)
        p->unk44->unk20 = p->unk42;
}

void sub_08019D48(ProcPtr proc)
{
    struct Unk08019B50 *p = (struct Unk08019B50 *)proc;

    sub_08022ADC();
    sub_08019C24();
    sub_08011E54(gUnknown_08499578, (void *)0x06007000, 0x800);
    sub_080153B8(p->unk44);
}

/* The parameter is invisible in the body -- r0 is never touched before
 * `bl sub_08019D48` -- and is read off the callee, which dereferences it. */
void sub_08019D78(ProcPtr proc)
{
    sub_08019D48(proc);
    sub_08012BC8(gUnknown_08499580, 0, 0, 0x20, 0x14, 0x360);
    sub_08013AD4(2);
}

void sub_08019DA8(ProcPtr proc)
{
    sub_08019D48(proc);
    sub_0801A538(0, 1, 6, 0xc);
    sub_08022580();
    sub_080227A8();
    sub_08034F8C();
}

/* This call site is the only evidence for sub_08022AD0's parameter widths, and
 * it is what made wave 26 retype the promoted definition from `u16` to `s16`:
 * the first argument is an `ldrsh` member handed over with no conversion at
 * all, and the second is narrowed `lsls #0x10; asrs #0x10`. The `u16` spelling
 * probes as `ldrh` plus a zero-extending `lsrs` and is not what the ROM does. */
void sub_08019DCC(struct Unk08019DCC *p)
{
    sub_08022AD0(p->unk24, p->unk20 * 16 + p->unk26);
}

/* The `u16 t` is load-bearing and is worth two bytes. `/ 2` on a signed
 * expression expands to the rounding triple `lsrs #0x1f; adds; asrs #1`, and
 * the ROM's last shift is a LOGICAL `lsrs #1` instead -- which is the same
 * value once the `strh` throws bit 31 away, so combine is free to rewrite it
 * and does, but only when the quotient lands in a narrow destination. Assigning
 * straight to the member does not do it, whether the member is spelt `s16` or
 * `u16`, and neither does swapping the addends or naming the dividend: all of
 * those keep the `asrs`. Routing the quotient through a `u16` local is what
 * flips it. Same effect as the narrow index local in sub_080196C0.
 *
 * The `(s16)` in the first statement is a real narrowing in the expression and
 * not a parameter conversion -- the value feeds an `adds`, not a `bl`. */
void sub_08019DEC(struct Unk08019DCC *p)
{
    u16 t;

    t = ((s16)(p->unk26 + 0x10 + p->unk20 * 32) + p->unk1e) / 2;
    p->unk1e = t;
    sub_0802323C(p->unk24, p->unk20 * 16 + p->unk26, 3);
}
