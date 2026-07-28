#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044DD0.
 * sub_08044DD0 @ 0x08044DD0
 */

#include "proc.h"
/* A proc callback: gUnknown_084A08EC -- the script sub_08044D70 hands to
 * Proc_StartBlocking -- holds 0x08044DD1 as a CALL target, and +0x2c is the
 * first of the five payload bytes that same starter writes into the new proc.
 * +0x2c is past PROC_HEADER's 0x29 bytes, so this is the proc's own state.
 * The `adds r0, #0x2c` ahead of the `ldrb` is just the THUMB displacement
 * limit (0-31 for ldrb), not an address being taken.
 * `pop {r0}; bx r0` -- void.
 */
struct Unk44DD0Proc
{
    /* 0x00 */ PROC_HEADER;
    /* 0x29 */ STRUCT_PAD(0x29, 0x2c);
    /* 0x2c */ u8 unk2c;
};

void sub_08044DD0(struct Unk44DD0Proc *proc)
{
    sub_08044AB8(proc->unk2c);
}
