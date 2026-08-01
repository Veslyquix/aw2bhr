#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806E9CC.
 * sub_0806E9CC @ 0x0806E9CC
 */

#include "hardware.h"
#include "proc.h"
struct Unk6E9CCProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ u32 unk58;
};

/* The raw-view spelling MUST be the `*(u16 *)&` cast, not `.raw`, and this is a
 * third confirmation of the rule src/decomp/c_0808A8C0.c states: the
 * `gUnknown_03002020 = 0` / `gUnknown_03001FFC = 0` stores leave a CSE-able
 * zero in flight, and with `.raw` agbcc finds a use for it and emits a stray
 * `orrs r1, r3` -- one extra instruction, and the ONLY difference in 92 bytes.
 * The cast is byte-exact. No `do { } while (0)` barrier is needed here; adding
 * one swaps which register holds the global and which holds the 0x800.
 *
 * The two groups are the BLDCNT target1 and target2 masks: bits 0-4 := 2 and
 * bits 8-12 := 8. `ldrh` with a POOL mask is what makes both of them the raw
 * view rather than `.bits` -- a 5-bit field at bit 0 lives inside byte 0, so
 * get_best_mode would have picked QImode and emitted `ldrb`. */
void sub_0806E9CC(struct Unk6E9CCProc *proc)
{
    gUnknown_030030E0.bits.effect = 1;

    gUnknown_03002020 = 0;
    gUnknown_03002B28 = 0x10;
    gUnknown_03001FFC = 0;

    *(u16 *)&gUnknown_030030E0 = (*(u16 *)&gUnknown_030030E0 & 0xFFE0) | 2;
    *(u16 *)&gUnknown_030030E0 = (*(u16 *)&gUnknown_030030E0 & 0xE0FF) | 0x800;

    proc->unk58 = 0;
}
