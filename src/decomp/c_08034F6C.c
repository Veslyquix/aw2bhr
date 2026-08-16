#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08034F6C.
 * sub_08034F6C @ 0x08034F6C, sub_08034F7C @ 0x08034F7C
 *
 * Not a Xenesis-documented name -- inferred from the read/increment/
 * decrement-if-nonzero shape of this trio (see sub_08034F8C for the third).
 * gUnknown_030030F0.unk00 behaves like a re-entrancy depth counter around CO
 * Power sequences; named conservatively pending stronger confirmation. The
 * old sub_XXXXXXXX symbols are kept as linker aliases below so every other
 * unit keeps resolving them unchanged.
 */

/* `int` and not `s8`: byte-identical here either way (the `lsls #0x18;
 * asrs #0x18` is the s8 member read), but sub_080345C8 tests the result with a
 * bare `cmp r0, #0` and an s8 return would have narrowed it there first.
 * Retyped in wave 13 (A2); re-verified byte-for-byte. */
int GetCoPowerDepth(void)
{
    return gUnknown_030030F0.unk00;
}

void IncrementCoPowerDepth(void)
{
    gUnknown_030030F0.unk00++;
}

asm(".global sub_08034F6C\n.thumb_set sub_08034F6C, GetCoPowerDepth\n"
    ".global sub_08034F7C\n.thumb_set sub_08034F7C, IncrementCoPowerDepth\n");
