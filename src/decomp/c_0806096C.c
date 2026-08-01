#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806096C.
 * sub_0806096C @ 0x0806096C, sub_080609B8 @ 0x080609B8, sub_08060A20 @ 0x08060A20
 */

/* An AI candidate filter: if action 4 is available, work out what percentage of
 * the running total sub_08057FA8(0x14) represents and select action 0x14 when
 * that is below the difficulty table's threshold.
 *
 * The zero guard is not a division-by-zero check bolted on -- 100 is the
 * answer when the denominator is zero, which is the "nothing yet, so all of it"
 * reading. Both arms leave the percentage in the same register, so the source
 * assigns one variable rather than returning early.
 *
 * gUnknown_030046D4 is re-read inside the else arm (`ldr r1, [r1]`) after the
 * `cmp` already loaded it, which is the volatile behaviour c_08060384.c
 * measures. */
void sub_0806096C(void)
{
    int v;
    int r;

    if (sub_08060ED4(4))
    {
        v = sub_08057FA8(0x14);

        if (gUnknown_030046D4 == 0)
            r = 100;
        else
            r = v * 100 / gUnknown_030046D4;

        if (r < gUnknown_085766E0->unk04[0])
            gUnknown_030046C0.unk06 = 0x14;
    }
}

/* sub_0806096C's sibling for action 7, with the threshold chosen by bit 0 of
 * gUnknown_030046B8 -- two different difficulty entries for the same test.
 * Both arms of that choice are separate `ldr`/`ldr`/`ldrb` runs off their own
 * pool word, so the ROM did not CSE the table pointer across the branch and
 * neither should the source bind it. */
void sub_080609B8(void)
{
    int v;
    int r;
    int lim;

    if (sub_08060ED4(2))
    {
        v = sub_08057FA8(7);

        if (gUnknown_030046D4 == 0)
            r = 100;
        else
            r = v * 100 / gUnknown_030046D4;

        if (gUnknown_030046B8 & 1)
            lim = gUnknown_085766E0->unk04[1];
        else
            lim = gUnknown_085766E0->unk04[2];

        if (r < lim)
            gUnknown_030046C0.unk06 = 7;
    }
}

/* sub_0806096C's sibling for action 0x17, with TWO gates: the raw count from
 * sub_08057F54(7) has to clear the difficulty table's +0x22 floor before the
 * percentage is compared at all, and the percentage threshold is halved.
 *
 * The denominator here is the second call's result rather than
 * gUnknown_030046D4, which is why this one keeps both counts in callee-saved
 * registers across the divide. `>> 1` on a u8 is `lsrs`, i.e. unsigned, so the
 * threshold is not sign-extended on the way in. */
void sub_08060A20(void)
{
    int a;
    int b;
    int r;

    if (sub_08060ED4(6))
    {
        a = sub_08057FA8(0x17);
        b = sub_08057F54(7);

        if (b == 0)
            r = 100;
        else
            r = a * 100 / b;

        if (b > gUnknown_085766E0->unk22
            && r < gUnknown_085766E0->unk04[3] >> 1)
            gUnknown_030046C0.unk06 = 0x17;
    }
}
