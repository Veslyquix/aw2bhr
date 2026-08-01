#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BBA8.
 * sub_0803BBA8 @ 0x0803BBA8
 */

/* Dispatch through gUnknown_0849EACC[gUnknown_030033FC]: publish the entry's
 * second word as gUnknown_0200C420.unk0d, then call the first through
 * `_call_via_r3`.
 *
 * The handler is loaded into a LOCAL before the store, and that ordering is
 * load-bearing: writing the call last as one expression makes agbcc emit the
 * `ldr` after the `strb` and pick `_call_via_r0` instead. The r3 in the
 * trampoline name is not an argument count here -- it is simply the register
 * the pointer was parked in while r0-r2 computed the byte store. */
void sub_0803BBA8(void)
{
    void (*handler)(void) = gUnknown_0849EACC[gUnknown_030033FC].unk00;

    gUnknown_0200C420.unk0d = gUnknown_0849EACC[gUnknown_030033FC].unk04;
    handler();
}
