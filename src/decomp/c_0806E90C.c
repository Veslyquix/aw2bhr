#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806E90C.
 * sub_0806E90C @ 0x0806E90C
 */

#include "hardware.h"
#include "proc.h"
struct Unk6E90CProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ u32 unk58;
};

/* sub_0806E9CC's twin; only the two coefficient constants differ. Same
 * `*(u16 *)&` requirement -- see the note in the sibling for why `.raw` costs
 * one stray `orrs` here. */
void sub_0806E90C(struct Unk6E90CProc *proc)
{
    gUnknown_030030E0.bits.effect = 1;

    gUnknown_03002020 = 8;
    gUnknown_03002B28 = 8;
    gUnknown_03001FFC = 0;

    *(u16 *)&gUnknown_030030E0 = (*(u16 *)&gUnknown_030030E0 & 0xFFE0) | 2;
    *(u16 *)&gUnknown_030030E0 = (*(u16 *)&gUnknown_030030E0 & 0xE0FF) | 0x800;

    proc->unk58 = 0;
}
