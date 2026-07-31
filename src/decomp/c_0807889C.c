#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807889C.
 * sub_0807889C @ 0x0807889C, sub_080788A0 @ 0x080788A0, sub_080788D8 @ 0x080788D8, sub_08078918 @ 0x08078918
 */

#include "proc.h"

/* `movs r0, #1; bx lr` -- a constant-true predicate with no callers, i.e. the
 * always-ready slot of a proc script. Nothing narrows the result anywhere, so
 * the return is word-wide. */

s32 sub_0807889C(void)
{
    return 1;
}

/* "Are all three of these flags clear?" -- the sum of three masked bytes
 * compared against zero, which is what `cmn r2, r1` is doing (it sets flags for
 * r2 + r1, and all three terms are non-negative).
 *
 * The `lsls #0x18; lsrs #0x18` after each `ands` is a u8 truncation of each
 * TERM, and it is what fixes this as three narrow values summed rather than one
 * wide expression -- a plain `(g[i] & 2)` sum emits no shifts at all.
 *
 * The arms are ordered `!= 0 -> return 0` with `return 1` on the fallthrough.
 * Writing it as `== 0 -> return 1` inverts the branch (`beq` to the 1 instead
 * of `bne` to the 0) and puts the two constants in the other blocks; the
 * source condition's sense decides which arm falls through, and the ROM's is
 * the negated one. */

s32 sub_080788A0(void)
{
    if ((gUnknown_0202FDFC.unk12[8] & 2)
      + (gUnknown_0202FDFC.unk12[9] & 2)
      + (gUnknown_0202FDFC.unk12[10] & 2) != 0)
        return 0;

    return 1;
}

/* sub_080788A0's twin at unk12[0x18..0x1a]. Identical source shape; the only
 * codegen difference is that these three offsets (0x2a, 0x2b, 0x2c from the
 * struct base) exceed `ldrb`'s 31-byte immediate reach, so the base parks in
 * `ip` and each access pays an `adds`. That also removes the need for a
 * callee-saved register, which is why this one has no prologue at all and ends
 * in a bare `bx lr` while sub_080788A0 pushes {r4, lr}. 56 vs 64 bytes, one
 * source. */

s32 sub_080788D8(void)
{
    if ((gUnknown_0202FDFC.unk12[0x18] & 2)
      + (gUnknown_0202FDFC.unk12[0x19] & 2)
      + (gUnknown_0202FDFC.unk12[0x1a] & 2) != 0)
        return 0;

    return 1;
}

/* The third of the triple, at unk12[0x10..0x12]. The three index runs are
 * 8..10, 0x10..0x12 and 0x18..0x1a -- and the first two are exactly the id
 * lists gUnknown_08615984 ({8, 9, 0xa, 0xff}) and gUnknown_08615988
 * ({0x10, 0x11, 0x12, 0xff}) hold, which independently corroborates that
 * unk12 is indexed by the same id space those lists enumerate. */

s32 sub_08078918(void)
{
    if ((gUnknown_0202FDFC.unk12[0x10] & 2)
      + (gUnknown_0202FDFC.unk12[0x11] & 2)
      + (gUnknown_0202FDFC.unk12[0x12] & 2) != 0)
        return 0;

    return 1;
}
