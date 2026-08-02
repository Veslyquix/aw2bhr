#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BA1C.
 * sub_0803BA1C @ 0x0803BA1C
 */

/* MATCHED byte-for-byte (wave 37, W37-Q2).
 *
 * gUnknown_0200C420.unk38 is a WORD and not part of the old filler_38[0xa8]:
 * `ldr r1,[r0,#0x38]; ands r1,=0xFFF000FF; str r1,[r0,#0x38]` is a whole-word
 * read-modify-write clearing bits 8..19. Spelled as a literal mask rather than
 * a bitfield assignment -- a bitfield clear narrows to a byte-sized
 * `movs #N; rsbs; ands`, and this is a 32-bit pool constant on a `ldr`/`str`
 * pair.
 *
 * The loop counter is a signed int, not the u8 the neighbouring functions in
 * this block use: the exit test is `cmp r4,#0x9f; ble` on a plain `adds r4,#1`
 * with no `lsls`/`lsrs` wraparound pair. */

void sub_0803BA1C(void)
{
    int i;

    sub_080745C0();
    gUnknown_0200C420.unk38 &= 0xFFF000FF;

    for (i = 0x60; i <= 0x9f; i++)
        sub_0803CBA0(i, 0);
}
