#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801BCA8.
 * sub_0801BCA8 @ 0x0801BCA8, sub_0801BCE0 @ 0x0801BCE0
 */

/* sub_0801BBC4 without the CpuFastSet -- the notify-and-latch half on its own,
 * for the path where the copy has already happened. The remaining four
 * statements are byte-identical to its tail, which is what makes the pair
 * readable as one source function split at the copy rather than two unrelated
 * ones. */
void sub_0801BCA8(void)
{
    sub_080718E8(gUnknown_03000268.unk00, gUnknown_03000268.unk0a);
    gUnknown_03002F2C = gUnknown_03000268.unk00;
    gUnknown_030030D4 = gUnknown_03002520;
    gUnknown_030024C0 = 0;
}

/* Three sequential calls and nothing else. There is no nesting signal to read
 * here and none to look for: `g(f())` costs no instruction over `f(); g();`
 * because r0 already holds the result, and the only thing that ever appears
 * between two `bl`s is a narrowing. What settles it is that sub_0801BB88's
 * argument is set up with a fresh `movs r0, #0x10`, which overwrites whatever
 * sub_0801BE78 returned. */
void sub_0801BCE0(void)
{
    sub_0801DF94();
    sub_0801BE78();
    sub_0801BB88(0x10);
}
