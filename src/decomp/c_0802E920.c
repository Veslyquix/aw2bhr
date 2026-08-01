#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802E920.
 * sub_0802E920 @ 0x0802E920, sub_0802E940 @ 0x0802E940
 */

#include "hardware.h"

/* The VBlank handler sub_0802EA24 installs: raise the BIOS IntrCheck flag for
 * VBlank, then drain the queues. Flat -- no guard anywhere in it. */
void sub_0802E920(void)
{
    gUnknown_03007FF8 = 1;
    sub_080128D0();
    sub_08011FF0();
    sub_0803B3F8();
    sub_0803B408();
}

/* Poll for A or RIGHT and then sleep to the next VBlank.
 *
 * `movs r0, #9; bics r0, r1` is `~REG_KEYINPUT & 9` with the constant on the
 * LEFT of the mask -- the same shape hardware.h already records for
 * `~REG_KEYINPUT & 0x3FF`. KEYINPUT is active-low, so the complement is the
 * held set; bits 0 and 3 are A and RIGHT.
 *
 * VBlankIntrWait is the BIOS IntrWait stub (`movs r2,#0; svc #5; bx lr`), not
 * game code. */
void sub_0802E940(void)
{
    if ((~REG_KEYINPUT & 9) != 0)
        sub_08036CB4();

    VBlankIntrWait();
}
