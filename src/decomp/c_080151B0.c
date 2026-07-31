#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080151B0.
 * sub_080151B0 @ 0x080151B0, sub_08015224 @ 0x08015224, sub_0801527C @ 0x0801527C, sub_080152C0 @ 0x080152C0, sub_080152EC @ 0x080152EC
 */

/* The slot initialiser. Sixteen stores through the flat `g[i].m` spelling.
 *
 * The four `-1`s are ONE CHAINED ASSIGNMENT, not four statements. Written
 * separately, agbcc computes one address, stores, and reuses the register --
 * two callee-saved registers total. The ROM computes all FOUR addresses first
 * (into r6, r2, r1 and r3, in ascending member order), materialises `-1` once
 * and then stores it right-to-left, which is exactly a chain's evaluation
 * order and is what spends the third callee-saved register in the prologue.
 */
void sub_080151B0(const void *a, u8 b, u8 c)
{
    gUnknown_03001470[b].unk00 = (u32)a;
    gUnknown_03001470[b].unk04 = a;
    gUnknown_03001470[b].unk10 = 0;
    gUnknown_03001470[b].unk0c = 0;
    gUnknown_03001470[b].unk38 = 0;
    gUnknown_03001470[b].unk14 = c;
    gUnknown_03001470[b].unk18 = 0;
    gUnknown_03001470[b].unk08 = 0;

    gUnknown_03001470[b].unk28 = gUnknown_03001470[b].unk2c =
        gUnknown_03001470[b].unk30 = gUnknown_03001470[b].unk34 = -1;

    gUnknown_03001470[b].unk24 = 0;
    gUnknown_03001470[b].unk22 = 0;
    gUnknown_03001470[b].unk20 = 0;
    gUnknown_03001470[b].unk1e = 0;
}

/* sub_0801527C's twin: same save/restore of gUnknown_03001FBC around
 * sub_080151B0 and sub_08015A30, but it stores 0 to the slot's .unk12 where
 * sub_0801527C stores 4.
 *
 * The slot index is `s16` here and `u8` there, and all three shift pairs it
 * costs are readable. Entry is `lsls #0x10; lsrs #0x10` -- ZERO-extending,
 * because PROMOTE_MODE zero-extends every sub-word parameter whatever its
 * signedness, so this pair does not distinguish s16 from u16. The signedness
 * shows up at the array subscript, which re-reads the value `lsls #0x10;
 * asrs #0x10`; a `u16` parameter would index straight off the entry value with
 * no second pair at all. The other two pairs both hang off one shared
 * `lsls r5, r4, #0x18`: `lsrs` for the `u8` argument sub_080151B0 and
 * sub_08015A30 take, `asrs` for the `s8` this function returns.
 */
s8 sub_08015224(const void *a, s16 b, u8 c)
{
    s16 saved = gUnknown_03001FBC;

    gUnknown_03001FBC = b;
    sub_080151B0(a, b, c);
    gUnknown_03001470[b].unk12 = 0;
    sub_08015A30(b);
    gUnknown_03001FBC = saved;

    return b;
}

/* Installs a script blob into gUnknown_03001470 slot `b` and runs it once.
 * sub_08015224 is the same function storing 0 rather than 4 to .unk12 and
 * narrowing its slot index u16 rather than u8.
 *
 * gUnknown_03001FBC is the "current slot" global: it is saved, set to this
 * slot for the duration of sub_080151B0 and sub_08015A30, and restored. The
 * save/restore is a plain `ldrh`/`strh` pair rather than `ldrsh` because the
 * value is never widened -- an s16 read whose only use is an s16 store is a
 * pure HImode move.
 */
s8 sub_0801527C(const void *a, u8 b, u8 c)
{
    s16 saved = gUnknown_03001FBC;

    gUnknown_03001FBC = b;
    sub_080151B0(a, b, c);
    gUnknown_03001470[b].unk12 = 4;
    sub_08015A30(b);
    gUnknown_03001FBC = saved;

    return b;
}

/* PARKED, and NOT because the decompilation is unknown.
 *
 * The body below is byte-for-byte identical to the ROM. Verified in wave 25
 * with compile_probe under the alias `probe_152C0`: all 44 bytes, in order,
 * with no residual -- prologue, the `movs r0,#0; bl sub_08015BD0`, the
 * `lsls #0x18; asrs #0x18`, the `movs r0,#1; rsbs r0,r0,#0; cmp; beq`, the
 * three-argument call and the `adds r0,r4,#0` tail. It cannot be run through
 * try_match as it stands because include/unknown-functions.h:276 declares
 *
 *     void sub_080152C0(s32, u8);
 *
 * and this definition disagrees with it in the RETURN TYPE. The function ends
 * `adds r0, r4, #0; pop {r4, r5, r6}; pop {r1}; bx r1`. `pop {r1}` is the
 * returns-a-value epilogue and r4 is sub_08015BD0's slot index carried through
 * an `asrs #0x18`, so the return is `s8`; a `void` declaration cannot emit the
 * `adds r0, r4, #0` at all. That is the entire remaining diff -- one
 * instruction, two bytes, and nothing inside this unit can write around it.
 *
 * WHAT THIS PARK IS *NOT* WAITING ON. The declaration is wrong in its FIRST
 * PARAMETER too -- it is `const void *`, not `s32` -- and that half is the one
 * that must not be touched: src/proc.c:1079 reaches the argument as
 * `(s32)p->proc_scrUnk->dataPtr`, and src/proc.c is upstream's own matching
 * source that this project never edits and that per-function trymatch cannot
 * gate. This draft therefore KEEPS `s32` and casts at the call site, exactly
 * as the six wrapper call sites already do (see include/unknown-globals.h
 * around the wave-12 script-blob list). The cast is byte-neutral.
 *
 * TO CLOSE IT, one header line changes and no .c file does:
 *
 *     -void sub_080152C0(s32, u8);
 *     +s8   sub_080152C0(s32, u8);
 *
 * The return half is byte-neutral for every caller in the tree: proc.c and all
 * six wrappers discard the result, and a discarded return emits no narrowing
 * -- the same readout wave 12 verified when it retyped sub_0801537C. The
 * header's own note directly above line 276 already records this and reaches
 * the same conclusion independently. It still wants a `make SPLIT=1 compare`
 * rather than a per-function trymatch, because proc.c is a multi-function
 * file, which is why wave 25 left the edit for the lead to scope rather than
 * applying it mid-wave.
 */
s8 sub_080152C0(s32 a, u8 b)
{
    s8 i = sub_08015BD0(0);

    if (i != -1)
        sub_08015224((const void *)a, i, b);

    return i;
}

/* Allocate a gUnknown_03001470 slot, install `a` into it and return it.
 *
 * THE ARM ORDER IS LOAD-BEARING AND SIZE-NEUTRAL. `if (i == -1) return NULL;`
 * followed by the body compiles to the same instructions with the two blocks
 * SWAPPED -- agbcc moves a leading early-return guard to the end of the
 * function and branches to it, which also drags the literal pool into the
 * middle. Writing the non-guard arm as the `if` keeps the `movs r0,#0` in the
 * fall-through and the pool after the epilogue, which is what the ROM has.
 * An `if/else` assigning a single result local is byte-identical to this.
 */
struct Unk03001470 *sub_080152EC(const void *a, u8 b)
{
    s8 i;

    i = sub_08015BD0(0);

    if (i != -1)
    {
        sub_0801527C(a, i, b);
        return &gUnknown_03001470[i];
    }

    return NULL;
}
