#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063BE0.
 * sub_08063BE0 @ 0x08063BE0
 */

#include "hardware.h"
/* Third member of the sub_08066470 affine cluster, and the control for the
 * separation test in docs/agbcc-codegen.md: same callee set and the same
 * J = 1.000, but its data_refs are NOT a subset of the exemplar's -- two of its
 * four globals were undeclared and its parameter is a different struct. It also
 * fell on the first draft, which is the finding: the subset relation correctly
 * predicted "no new declarations" for its sibling, and declaration work turns
 * out not to be a cost.
 *
 * The affine tail is the c_080831FC.c / c_08032E88.c idiom for the fourth time,
 * with the vertical scale `p->unk44 * 32` written INLINE at both Div calls and
 * not bound to a local: the ROM re-loads +0x44 for each one because `bl Div`
 * clobbers memory in between, and a local would be computed once and held.
 * `p->unk28 + 0x58 - p->unk44` is the wave-20 constant-inversion rule -- writing
 * the constant next to unk28 puts it on unk44, which is where the ROM has it
 * (`subs r2, #0x58` then `subs r1, r1, r2`). */

struct Unk8063BE0
{
    /* 00 */ STRUCT_PAD(0x00, 0x1c);
    /* 1c */ u16 unk1c;
    /* 1e */ STRUCT_PAD(0x1e, 0x24);
    /* 24 */ int unk24;
    /* 28 */ int unk28;
    /* 2c */ STRUCT_PAD(0x2c, 0x44);
    /* 44 */ s16 unk44;
};

void sub_08063BE0(struct Unk8063BE0 *p)
{
    if (gUnknown_0202F0E8[2] != 0)
    {
        sub_08015C30(gUnknown_03001FBC);
    }
    else
    {
        p->unk44--;

        SetObjAffine(0,
                     Div(COS_Q12(0) * 16, 0x100),
                     Div(-SIN_Q12(0) * 16,
                         p->unk44 * 32 != 0 ? p->unk44 * 32 : 2),
                     Div(SIN_Q12(0) * 16, 0x100),
                     Div(COS_Q12(0) * 16,
                         p->unk44 * 32 != 0 ? p->unk44 * 32 : 2));

        sub_0801BD00(p->unk24 + 0x78, p->unk28 + 0x58 - p->unk44,
                     gUnknown_085806F2, p->unk1c * 4);

        if (p->unk44 <= 1)
            sub_08015C30(gUnknown_03001FBC);
    }
}
