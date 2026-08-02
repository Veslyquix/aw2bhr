#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015878.
 * sub_08015878 @ 0x08015878
 */

/* Sets a gUnknown_0200E438 sprite's tile index and palette in one go: fetch
 * the slot's stashed OBJ attributes into a stack local with sub_0801566C, poke
 * two bitfields, hand the eight bytes back by value to sub_08015608. Same
 * source shape as the promoted sub_080154C4 / sub_08015504 pair, which set one
 * bit each; the 32-bit masks (0x3ff / 0xFFFFFC00 for tileNum, the bare
 * `lsls #4` under a `strb` for paletteNum) are the bitfield-store tell.
 *
 * All three parameters are DECLARED NARROW even though the prologue is
 * copy-then-narrow, for the reason W25-C measured on sub_080154C4: a parameter
 * whose pseudo lives across a call stops fusing assign_parms' incoming copy
 * with the PROMOTE_MODE extension, so declared-narrow produces the
 * `int`-with-a-cast shape by itself.
 *
 * PARAMETER 2 IS s16 AND PARAMETER 3 IS u16, AND THE DIFFERENCE IS TWO BYTES
 * -- which the codegen doc previously said was undecidable at entry. It is,
 * at entry: PROMOTE_MODE zero-extends both, so `b` and `c` open with the same
 * `lsls #0x10; lsrs #0x10`. The signedness shows up at the BITFIELD STORE
 * instead. Storing a SIGNED narrow value into an unsigned bitfield makes gcc
 * keep the mask constant in its own pseudo and copy it:
 *
 *     ldr  r1, =0x000003FF
 *     adds r0, r1, #0        <-- only present for the s16 spelling
 *     ands r4, r0
 *
 * where a `u16` parameter loads the mask straight into r0 and ANDs in place,
 * two bytes short. `o.paletteNum = c` has no such copy, so the two parameters
 * genuinely differ. Found by decomp-permuter after ten hand spellings of the
 * assignment (`& 0x3ff`, `& 0xffff`, temporaries, pointer locals, an extra
 * parameter, `(int)` casts) all folded to the same u16 code -- the axis was
 * never the assignment, it was the declaration.
 */
void sub_08015878(s16 a, s16 b, u16 c)
{
    struct OamData o;

    sub_0801566C(a, (struct UnkVec *)&o);
    o.tileNum = b;
    o.paletteNum = c;
    sub_08015608(a, *(struct UnkVec *)&o);
}
