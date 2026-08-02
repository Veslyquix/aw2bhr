#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08013168.
 * sub_08013168 @ 0x08013168
 */

#include "hardware.h"
#include "proc.h"
/* The gUnknown_0848936C proc's starter body: clears three word fields and then
 * sets up the blend registers. gUnknown_0808E528 in asm/ is NOT an object --
 * the word at 0x0808E528 in baserom.gba holds 0x030030E0, i.e. it is agbcc's
 * own -fforce-addr .rodata address-constant pool slot for gUnknown_030030E0.
 * The honest spelling below reproduces it (the .LC word is emitted into this
 * unit's .rodata); the reference count across the if/else MERGE is what earns
 * the pool word, exactly as the W35-D rule predicts.
 *
 * The two arms really do repeat `effect = 2` and the two zero stores -- agbcc
 * does not tail-duplicate here, and hoisting them above the `if` emits them
 * once, which is two blocks short.
 *
 * Same family as sub_0806717C/sub_08067410: `ldrh` with a pool mask is `.raw`,
 * `ldrb` with a movs/neg mask is `.bits`. The two AND masks (0xffe0 then
 * 0xe0ff) survive side by side in one ldrh/strh because agbcc CSEs the second
 * statement's load against the first statement's stored value.
 */
struct Unk08013168Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x54);
    /* 54 */ u32 unk54;
    /* 58 */ u32 unk58;
    /* 5c */ u32 unk5c;
    /* 60 */ STRUCT_PAD(0x60, 0x64);
    /* 64 */ s16 unk64;
};

void sub_08013168(struct Unk08013168Proc *proc)
{
    proc->unk54 = 0;
    proc->unk58 = 0;
    proc->unk5c = 0;

    if (proc->unk64 == 0)
    {
        gUnknown_030030E0.bits.effect = 2;
        gUnknown_03002020 = 0;
        gUnknown_03002B28 = 0;
        gUnknown_03001FFC = 0x10;
    }
    else
    {
        gUnknown_030030E0.bits.effect = 2;
        gUnknown_03002020 = 0;
        gUnknown_03002B28 = 0;
        gUnknown_03001FFC = 0;
    }

    gUnknown_030030E0.raw = (gUnknown_030030E0.raw & 0xffe0) | 0x1f;
    gUnknown_030030E0.raw = gUnknown_030030E0.raw & 0xe0ff;
    gUnknown_030030E0.bits.target1_enable_bd = 1;
    gUnknown_030030E0.bits.target2_enable_bd = 0;
}
