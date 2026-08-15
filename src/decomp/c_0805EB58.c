#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805EB58.
 * sub_0805EB58 @ 0x0805EB58
 */

/* Wave 63, W63-C: MATCHED. Splitting the packed store into `xp = x << 16`,
 * `yp = y << 16`, then `(xp >> 16) | yp` produces the ROM's interleaving.
 * The Wave-55 measurements and relocation proof are preserved below.
 *
 * Wave 55, W55-C, independently reproduced and extended by W55-F. NOT MATCHED:
 * 97.9%, SIZE EXACT, 8 of 384 bytes differ, and SIX of those eight are one
 * three-instruction reordering. Read the diff, not the score.
 *
 * THE TWO RELOC LINES ARE NOT DEFECTS -- do not "fix" them, and do NOT declare
 * a global for either address.
 *   44/4c: original gUnknown_0816DA98 / gUnknown_0816DA9C, candidate .rodata+0
 *          and .rodata+4, AT THE SAME OFFSETS. Those are agbcc's own
 *          -fforce-addr address-constant words. The honest spelling (naming
 *          gUnknown_08499590 and gUnknown_030040D8 directly) is what produces
 *          them and is CORRECT; promotion carries
 *          "rodata": ["0x0816DA98", "0x0816DA9C"].
 *   164:   original gUnknown_085D5AD0 addend 0, candidate gUnknown_085D5ABC
 *          addend 0x14. 0x085D5ABC + 0x14 == 0x085D5AD0 -- the SAME address
 *          spelled against the disassembler's invented row symbol. The
 *          instructions around it are byte-identical.
 * Those account for 2 of the 8 bytes and both vanish at link time. W55-F
 * confirmed the class on sub_0805F914 in this same batch, which trymatch
 * accepts outright: "relocs: name different symbols that resolve to the same
 * address ... MATCH -- links to identical bytes."
 *
 * THE ONLY REAL RESIDUAL is the packed store `v.raw = (u16)x | (y << 16)`:
 *   ROM        lsls r0,r4,#16 ; mov r2,r8 ; lsls r1,r2,#16 ; lsrs r0,r0,#16
 *   candidate  lsls r0,r4,#16 ; lsrs r0,r0,#16 ; mov r2,r8 ; lsls r1,r2,#16
 * then `orrs r0,r1 ; str r0,[sp]` identically. Same four instructions, same
 * registers. In the ROM the two halves of the (u16) truncation are two separate
 * RTL insns with y's shift created between them; here they are one merged
 * zero_extend that nothing splits.
 *
 * OPERAND ORDER IS ALREADY RIGHT and is worth recording: `(y << 16) | (u16)x`
 * scores 97.1% with y evaluated first, `orrs r1,r0` and a knock-on `mov r1,r9`
 * two blocks later; `(u16)x | (y << 16)` -- this draft -- fixes all of that and
 * is 97.9%. Six spellings were measured with compile_probe and ALL emit the
 * truncation pair ADJACENT:
 *     (u16)x | (y << 16)                 <- this draft
 *     ((u32)x << 16 >> 16) | (y << 16)
 *     (x & 0xffff) | (y << 16)           -- becomes `ldr =0xffff; ands`
 *     (u16)x + (y << 16)                 -- becomes `adds`; agbcc has no
 *                                           PLUS->IOR conversion even though
 *                                           the operands are provably disjoint
 *     t = (u32)x << 16; (t >> 16) | (y << 16)
 *     (y << 16) | (u16)x                 -- y first, strictly worse (11 B)
 *
 * RULED OUT BY W55-F, with the measurement:
 *  - decomp-permuter, 17,450 iterations / 300 s from this exact draft: "no
 *    candidate scored better than the starting point". Source permutation does
 *    not reach it.
 *  - The wave-48 comma/embedded-assignment lever ("Where a HOISTED INVARIANT
 *    lands in the preheader is set by pseudo-creation order"), applied as
 *      ((u32)x << 16) >> ((hi = y << 16), 16) | hi
 *    moves y's shift to the FRONT of all three rather than into the middle:
 *      lsl r1,r1,#16 ; lsl r0,r0,#16 ; lsr r0,r0,#16 ; orr r0,r0,r1
 *    agbcc expands a shift COUNT's side effect BEFORE the shifted operand, so
 *    the comma reaches ahead of op0 but can never land between op0's own two
 *    insns. New fact; written up in docs/agbcc-codegen.md.
 * The next thing to try is not another spelling of this statement -- it is
 * whatever makes the truncation two insns instead of one merged zero_extend.
 */
#include "global.h"
struct Unk5EB58Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_04[0x1432 - 4];
    /* 0x1432 */ u8 terrain[0x417a - 0x1432];
    /* 0x417a */ u16 rows[1];
};
union Unk5EB58Sel
{
    u32 raw;
    struct
    {
        u32 unk00 : 16;
        u32 unk02 : 16;
    } f;
};

void sub_0805EB58(void)
{
    union Unk5EB58Sel v;
    s16 best;
    int x;
    int y;
    int idx;
    int t;
    u8 *q;
    u8 *tbl;
    u32 xp;
    u32 yp;

    best = 0x7fff;
    sub_0801F92C(gUnknown_08499590 + 0x2852);
    sub_080202A4(gUnknown_030040D8);
    v.f.unk00 = 0x270f;

    for (y = 0; y < ((struct Unk5EB58Map *)gUnknown_08499590)->height; y++)
    {
        for (x = 0; x < ((struct Unk5EB58Map *)gUnknown_08499590)->width; x++)
        {
            if ((s8)gUnknown_03003340[y][x] < 0)
                continue;
            idx = ((struct Unk5EB58Map *)gUnknown_08499590)->rows[y] + x;
            q = gUnknown_08499590 + 0x12;
            if (q[idx] != 0)
                continue;
            if (sub_08026FD0(gUnknown_03003F38,
                    ((struct Unk5EB58Map *)gUnknown_08499590)->terrain[idx]) == 1)
                continue;
            tbl = gUnknown_085D5ABC[gUnknown_030040D8->unk00].unk14;
            t = ((struct Unk5EB58Map *)gUnknown_08499590)->terrain[
                    ((struct Unk5EB58Map *)gUnknown_08499590)->rows[y] + x] & 0x1f;
            tbl += 0x1a;
            if (tbl[t] == 0)
                continue;
            if (((s8 *)gUnknown_03003340[y])[x] > best)
                continue;
            xp = (u32)x << 16;
            yp = (u32)y << 16;
            v.raw = (xp >> 16) | yp;
            best = (s8)gUnknown_03003340[y][x];
        }
    }

    if (v.f.unk00 != 0x270f)
        sub_080591E4(&v);
    else
        sub_0805F7B8();
}
