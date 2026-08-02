#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005D74.
 * sub_08005D74 @ 0x08005D74, sub_08005E30 @ 0x08005E30
 */

/* A three-state easing machine on unk6c (0 -> 0xA -> 0x14 -> 0) driving unk6e,
 * pushed to sub_0801BD00 every frame. sub_08005E30 is its twin on unk70.
 *
 * ONE local spans the whole body: the eased position in the switch arms and the
 * shifted copy handed to sub_0801BD00 are the same `v`. That is what earns it a
 * callee-saved register and costs the function its `push {r4, r5, r6}`; split
 * into two locals the instruction stream is identical and correctly ordered but
 * only {r4, r5} are pushed and 61 of 188 bytes differ. See
 * docs/agbcc-codegen.md.
 *
 * unk6e is read two ways in one body and both are right: the arms use the s16
 * member directly (`movs r1,#0; ldrsh`) while the tail's `>> 4` wants the
 * sign-extension spelled out (`ldrh; lsls #16; asrs #20`).
 *
 * unk6d goes through an `s8` lvalue and that is MEASURED, not decoration: the
 * ROM decrements it `subs r2, r1, #1`, while `gUnknown_0200B0B0->unk6d--` on
 * the u8 member the header declares emits `adds r2, r1, #0; adds r2, #255` --
 * the modulo-256 wraparound -- for +2 bytes. The `--` is a discriminating use
 * where the load form is not; see the note in include/unknown-globals.h. */
void sub_08005D74(void)
{
    int v;

    switch (gUnknown_0200B0B0->unk6c)
    {
    case 0:
        v = gUnknown_0200B0B0->unk6e;
        v += (0xB0 - v) >> 3;
        if (v <= 0xD0)
        {
            v = 0xD0;
            gUnknown_0200B0B0->unk6c = 0xA;
        }
        gUnknown_0200B0B0->unk6e = v;
        break;
    case 0xA:
        v = gUnknown_0200B0B0->unk6e;
        v += (0x120 - v) >> 3;
        if (v > 0xFF)
        {
            v = 0x100;
            gUnknown_0200B0B0->unk6c = 0x14;
            *(s8 *)&gUnknown_0200B0B0->unk6d = 0x1E;
        }
        gUnknown_0200B0B0->unk6e = v;
        break;
    case 0x14:
        if ((*(s8 *)&gUnknown_0200B0B0->unk6d)-- <= 0)
            gUnknown_0200B0B0->unk6c = 0;
        break;
    }
    v = (s16)gUnknown_0200B0B0->unk6e >> 4;
    sub_0801BD00(0x2078, v | 0x400, (void *)gUnknown_08488664, 0xD000);
}

/* sub_08005D74's twin on unk70: the same unk6c state machine and the same
 * single-`v`-across-the-body shape; see that draft for both. The only spelling
 * difference is the operand order of the `| 0x400` -- `0x400 | v` here against
 * `v | 0x400` there. That decides which of the two values is already sitting in
 * the argument register when the `orrs` runs, and so whether a copy is needed;
 * worth 2 bytes. */
void sub_08005E30(void)
{
    int v;

    switch (gUnknown_0200B0B0->unk6c)
    {
    case 0:
        v = gUnknown_0200B0B0->unk70;
        v += (0x850 - v) >> 3;
        if (v > 0x82F)
        {
            v = 0x830;
            gUnknown_0200B0B0->unk6c = 0xA;
        }
        gUnknown_0200B0B0->unk70 = v;
        break;
    case 0xA:
        v = gUnknown_0200B0B0->unk70;
        v += (0x7E0 - v) >> 3;
        if (v <= 0x800)
        {
            v = 0x800;
            gUnknown_0200B0B0->unk6c = 0x14;
            *(s8 *)&gUnknown_0200B0B0->unk6d = 0x1E;
        }
        gUnknown_0200B0B0->unk70 = v;
        break;
    case 0x14:
        if ((*(s8 *)&gUnknown_0200B0B0->unk6d)-- <= 0)
            gUnknown_0200B0B0->unk6c = 0;
        break;
    }
    v = (s16)gUnknown_0200B0B0->unk70 >> 4;
    sub_0801BD00(0x78, 0x400 | v, (void *)gUnknown_08488664, 0xD000);
}
