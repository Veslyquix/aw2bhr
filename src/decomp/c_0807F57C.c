#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807F57C.
 * sub_0807F57C @ 0x0807F57C
 */

/* This translation unit saw sub_0803CAB8 returning `int`: the ROM tests its
 * result with a bare `cmp r0, #0` after the `bl`. Everywhere else it is `u8`
 * (include/unknown-functions.h), and a `u8` return makes agbcc re-narrow
 * with `lsls r0, r0, #24`. The assembler-label alias gives this file the int
 * view of the same symbol with a direct call; a function-pointer cast would
 * compile to an indirect call instead. */
extern int sub_0803CAB8_int(u32) asm("sub_0803CAB8");

/* Rebuilds the list of available entries from gUnknown_086166F0, a run
 * of 0xFF-terminated groups, each followed by one tag byte and ending at a
 * second 0xFF. Entries sub_0803CAB8 accepts are appended to
 * gUnknown_030058E0. Each non-empty group records its tag and accepted
 * count at index gUnknown_03005944 of gUnknown_03005958 / gUnknown_03005948. */
void sub_0807F57C(void)
{
    int offset = 0;
    int output = 0;
    int count;

    gUnknown_03005944 = 0;
    sub_08078758();
    while (gUnknown_086166F0[offset] != 0xff)
    {
        count = 0;
        while (gUnknown_086166F0[offset] != 0xff)
        {
            if (sub_0803CAB8_int(gUnknown_086166F0[offset]))
            {
                count++;
                gUnknown_030058E0[output++] = gUnknown_086166F0[offset];
            }
            offset++;
        }
        offset++;
        if (count)
        {
            gUnknown_03005958[gUnknown_03005944] = gUnknown_086166F0[offset];
            gUnknown_03005948[gUnknown_03005944] = count;
            gUnknown_03005944++;
        }
        offset++;
    }
}
