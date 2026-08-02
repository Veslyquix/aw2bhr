#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019910.
 * sub_08019910 @ 0x08019910
 */

/* Scan gUnknown_03003110 until a terminator and report which one stopped it:
 * 10 is TRUE, -1 and 4 are FALSE, everything else keeps walking. A leaf --
 * no push/pop at all.
 *
 * It is a SWITCH, not a chain of `if`s: the ROM tests the middle case first
 * (`cmp #4; beq`), branches to the right subtree on `bgt` and only then tests
 * -1, which is gcc's balanced case tree over the sorted list {-1, 4, 10}. The
 * `movs r2,#1; rsbs r2,r2,#0` in the preheader is that tree's -1 comparand,
 * hoisted out of the loop; -1 and not 0xFF is provable from the instruction
 * count, since 0xFF fits `cmp rN,#imm8` in one instruction and would never
 * need a register. The byte is loaded `ldrb`, so the case can never fire at
 * runtime, but expand_case takes the case list at face value against the
 * PROMOTED `int` index and keeps it.
 *
 * `case 10` is written FIRST and that is worth 4 bytes. The balanced tree that
 * dispatches is sorted whatever the source order, but the case BODIES are
 * emitted in source order, and only with the TRUE body first does the
 * `cmp #0xa; bne <loop>` fall straight into it. Writing the FALSE arm first
 * costs a `beq` plus a `b` to reach a body that now sits behind it. */
bool8 sub_08019910(void)
{
    u8 *p;

    p = gUnknown_03003110;
    for (;;)
    {
        switch (*p++)
        {
        case 10:
            return TRUE;
        case -1:
        case 4:
            return FALSE;
        }
    }
}
