#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080193B0.
 * sub_080193B0 @ 0x080193B0
 */

/* MATCHED in wave 86 (W86-C). The residual four waves called unreachable was
 * TWO SOURCE VARIABLES, not one variable with an exotic width.
 *
 * The ROM keeps two extensions of sub_08019290's result off ONE `lsls`:
 *     lsls r0, r0, #16
 *     lsrs r2, r0, #16      <- zero-extended home  = the u16 local `idx`
 *     asrs r0, r0, #16      <- sign-extended home  = the s16 local `r`
 * and re-derives the subscript by SIGN-extending the zero-extended copy
 * (`lsls r0, r2, #16; asrs r0, r0, #16`) = `(s16)idx`.
 *
 * `r` is what the `== -1` test reads; `idx` is what every subscript reads.
 * Because both narrowings are applied to the SAME SImode call result, cse
 * shares the single `x << 16` between them -- which is why there is one
 * `lsls` and two extensions rather than two `lsls` pairs. Writing
 * `idx = r` (u16 from s16) is enough: combine folds
 * zero_extend(truncate(sign_extend(x))) back to zero_extend(truncate(x)),
 * so the second `lsls` disappears and both extensions hang off the first.
 *
 * WHY THE WAVE-32 AXES ALL FAILED, and this is the rule worth keeping: every
 * one of them was a search for a SPELLING OF ONE VARIABLE (`s16 i`; `u16 i`
 * with `(s16)i` at both uses; retyping the callee's return). With one
 * variable there is exactly one home, so no spelling of it can produce two,
 * and combine correctly deletes whichever extension is redundant. Two homes
 * in the ROM meant two locals in the source.
 *
 * The wave-86 pre-registered hypothesis for this function -- that the u16
 * home survives because it is a MULTI-SET pseudo, so `nonzero_bits` is not
 * tracked (wave 57) -- is REFUTED: `idx` here is single-set and the home
 * survives anyway. `nonzero_bits` never had to be defeated, because the two
 * values are genuinely different (one sign-extended, one zero-extended) and
 * neither is redundant.
 *
 * The gUnknown_0200C528 list installer: it runs the three openers, asks
 * sub_08019290 for a free slot, and seeds that slot's script pointer into
 * both .unk00 and .unk04 with an empty callback and counter, returning the
 * slot -- or NULL when the scan reports -1. */
struct Unk0200C528 *sub_080193B0(const u8 *script)
{
    s16 r;
    u16 idx;

    sub_08013D40();
    sub_08017E74();
    sub_080198AC();

    r = sub_08019290(NULL);
    idx = r;

    if (r == -1)
        return NULL;

    gUnknown_0200C528[(s16)idx].unk00 = (struct Unk0200C528Node *)script;
    gUnknown_0200C528[(s16)idx].unk08 = NULL;
    gUnknown_0200C528[(s16)idx].unk04 = (struct Unk0200C528Node *)script;
    gUnknown_0200C528[(s16)idx].unk0c = 0;

    return &gUnknown_0200C528[(s16)idx];
}
