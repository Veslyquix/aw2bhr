#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037124.
 * sub_08037124 @ 0x08037124, sub_08037150 @ 0x08037150
 */

#include "proc.h"

void sub_08037124(void)
{
    sub_080169E8();
    sub_0801537C(gUnknown_08553820);
    Proc_EndEach(gUnknown_0855379C);
    Proc_EndEach(gUnknown_0849D3BC);
    sub_08036B34();
}

/* The destination is OBJ tile `a & 0x3ff`, i.e. byte offset
 * `(a & 0x3ff) * TILE_SIZE_4BPP` into OBJ_VRAM0. The honest mask spelling
 * `(a & 0x3FF) * 32` does NOT match: on THUMB agbcc loads 0x3ff from the pool
 * and emits `ldr; and; lsl #5`, three instructions and a fourth pool word.
 * The ROM's `lsl #0x16; lsr #0x11` is the truncate-then-scale form, which is
 * what a 16-bit intermediate gives -- `(u16)(a * 0x40) / 2` puts the same
 * bits in the same places in two instructions. Measured with compile_probe,
 * both spellings side by side. */
void sub_08037150(int a)
{
    Decompress(gUnknown_08124478, (u8 *)OBJ_VRAM0 + (u16)(a * 0x40) / 2);
}
