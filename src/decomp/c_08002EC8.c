#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002EC8.
 * sub_08002EC8 @ 0x08002EC8, sub_08002EF8 @ 0x08002EF8
 */

/* Bit 5 of the flag word gates a two-way choice on unk07.
 *
 * unk07 is read `movs r0, #7; ldrsb r0, [r2, r0]` -- the reg+reg form agbcc
 * rewrites a plain s8 member load into, and the same tell that settled unk06 in
 * sub_08000664. The pointer is loaded once and held: nothing here writes
 * through it, so there is no aliasing reload.
 *
 * Wave 31 declared this `void (void)` from its call sites in sub_08000DC0
 * before its body had been read; the body agrees -- no argument register is
 * read, and the epilogue is `pop {r0}; bx r0`. */
void sub_08002EC8(void)
{
    sub_08001DAC();

    if ((gUnknown_0200B0B0->unk00 & 0x20) == 0)
    {
        if (gUnknown_0200B0B0->unk07 == 0)
            sub_08002AB0();
        else
            sub_08002C38();
    }
}

/* One call whose second argument is 0xAB or 0xAA depending on unk07, and whose
 * first is always 0xAA.
 *
 * An if/ELSE, not `v = 0xAA;` followed by a guarded overwrite: both spellings
 * preset r1 to 0xAA and conditionally replace it, but the plain assignment puts
 * that `movs r1, #0xaa` ahead of the pool load, where the ROM has it after the
 * field has been read.
 *
 * The two 0xAA are NOT shared: agbcc does not CSE a `movs` of a small constant
 * across a branch -- the same observation as src/decomp/c_0802D168.c's two
 * `movs r0, #1`. */
void sub_08002EF8(void)
{
    int v;

    if (gUnknown_0200B0B0->unk07 == 0)
        v = 0xAB;
    else
        v = 0xAA;

    sub_0801F1EC(0xAA, v);
}
