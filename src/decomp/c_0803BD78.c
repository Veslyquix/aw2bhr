#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BD78.
 * sub_0803BD78 @ 0x0803BD78, sub_0803BDBC @ 0x0803BDBC
 */

/* A leaf -- no `push` at all -- that arms gUnknown_03003FC0 for mode 3.
 *
 * The run of `adds r0,#1` / `subs r0,#1` steps on one address register is what
 * consecutive byte fields cost once the displacement leaves `strb`'s 5-bit
 * range; it is addressing, not a member array. unk28 is a whole-word `str` in
 * the middle of that run, which is why it is broken out of filler_0e in
 * include/unknown-globals.h. */
void sub_0803BD78(void)
{
    gUnknown_03003FC0.unk01 = 3;
    gUnknown_03003FC0.unk0d = 1;
    gUnknown_03003FC0.unk07 = 1;
    gUnknown_03003FC0.unk08 = 1;
    gUnknown_03003FC0.unk2d = 1;
    gUnknown_03003FC0.unk2c = 0;
    gUnknown_03003FC0.unk2e = 0;
    gUnknown_03003FC0.unk2f = 0;
    gUnknown_03003FC0.unk30 = 0;
    gUnknown_03003FC0.unk28 = 1000;
    gUnknown_03003FC0.unk31 = 0;
    if (gUnknown_03003FC0.unk32 != 0)
        gUnknown_03003FC0.unk09 = 1;
}

/* Re-arm gUnknown_03003FC0 across a sub_08034848 reset, carrying unk0c over it
 * by hand -- the byte is read into a callee-saved register before the call and
 * written straight back after, which is the whole reason r4 is pushed.
 *
 * The four zeroed bytes at 0x39..0x3c are spelled as unk38[1..4]: the array is
 * already proved by sub_08018C0C's variable index, and a constant index folds
 * to the same displacement a separate scalar field would give, so this does
 * not disturb that model. */
void sub_0803BDBC(void)
{
    u8 saved = gUnknown_03003FC0.unk0c;

    sub_08034848();
    gUnknown_03003FC0.unk0c = saved;
    gUnknown_03003FC0.unk38[1] = 0;
    gUnknown_03003FC0.unk38[2] = 0;
    gUnknown_03003FC0.unk38[3] = 0;
    gUnknown_03003FC0.unk38[4] = 0;
    gUnknown_03003FC0.unk0d = 1;
    gUnknown_03003FC0.unk07 = 1;
    gUnknown_03003FC0.unk08 = 1;
    gUnknown_03003FC0.unk2c = 0;
    gUnknown_03003FC0.unk2d = 1;
    gUnknown_03003FC0.unk00 = 1;
}
