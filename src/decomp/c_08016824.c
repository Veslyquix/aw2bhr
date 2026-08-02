#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08016824.
 * sub_08016824 @ 0x08016824, sub_080168BC @ 0x080168BC
 */

/* The rotate/scale half of the pair with sub_080168BC: grab a free affine
 * matrix slot, record it on the OBJ's gUnknown_0200E438 entry, and switch the
 * sprite into affine mode with that matrix. Same fetch/poke/hand-back template
 * as src/decomp/c_08016944.c.
 *
 * `sub_0801DAB0()` takes NO argument here -- the ROM leaves r0 holding this
 * function's own incoming parameter across the `bl`, which no spelling of
 * `sub_0801DAB0(a)` can produce once `a` is a declared-narrow parameter (the
 * value it would pass is the zero-extended pseudo in r5, and that needs an
 * `adds r0,r5,#0` the ROM does not have). See the note on the prototype in
 * include/unknown-functions.h.
 *
 * `s8 v` is a genuine s8 LOCAL and not an int with casts: the `lsls #0x18;
 * lsrs #0x18` right after the `strh` is PROMOTE_MODE zero-extending the
 * assignment, and the later `lsls #0x18; asrs #0x18` is the one signed use
 * re-extending it -- four instructions for one value, the shape wave 35's brief
 * records. The matrix index is unpacked out of it into three OAM fields: the
 * low 3 bits are matrixNum, bit 3 is hFlip and bit 4 is vFlip. */
void sub_08016824(s16 a)
{
    struct OamData o;
    int m;
    s8 v;

    m = sub_0801DAB0();
    gUnknown_0200E438[gUnknown_03001470[a].unk26].unk3a = m;
    v = m;
    sub_0801566C(a, (struct UnkVec *)&o);
    o.affineEnable = 1;
    o.matrixNum = v & 7;
    o.hFlip = (v & 8) >> 3;
    o.vFlip = (v & 0x10) >> 4;
    sub_08015608(a, *(struct UnkVec *)&o);
}

/* The un-rotate half of sub_08016824: release the affine matrix slot the OBJ
 * was holding (sub_0801DAE8 is sub_0801DAB0's free), mark the slot free with
 * -1, and clear the four OAM fields sub_08016824 set. Same fetch/poke/hand-back
 * template as src/decomp/c_08016944.c.
 *
 * The single `lsls #0x10; asrs #0x10` at entry is the `(s16)a` cast of an int
 * parameter, NOT a declared-narrow one -- sub_08016824 next door opens with the
 * zero-extending `lsrs` instead, which is what an s16 parameter gives.
 * `0xFFFF` rather than `-1`: the ROM materialises the constant from a
 * `.4byte 0x0000FFFF` pool word, which is the u16 spelling; `-1` builds it with
 * `movs #1; rsbs`. */
void sub_080168BC(int a)
{
    struct OamData o;

    sub_0801DAE8(gUnknown_0200E438[gUnknown_03001470[(s16)a].unk26].unk3a);
    gUnknown_0200E438[gUnknown_03001470[(s16)a].unk26].unk3a = 0xFFFF;
    sub_0801566C(a, (struct UnkVec *)&o);
    o.affineEnable = 0;
    o.doubleSize = 0;
    o.matrixNum = 0;
    o.hFlip = 0;
    o.vFlip = 0;
    sub_08015608(a, *(struct UnkVec *)&o);
}
