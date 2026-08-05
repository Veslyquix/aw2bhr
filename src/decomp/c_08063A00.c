#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063A00.
 * sub_08063A00 @ 0x08063A00
 */

/* The fifth member of the descending gUnknown_03001470[] scan family
 * (sub_0806377C, sub_080637AC, sub_080637D8, sub_08063814): same walk, and the
 * action is a caller-supplied callback handed the slot itself. `bl
 * _call_via_r6` is agbcc's ordinary indirect-call trampoline, not a veneer. */
void sub_08063A00(const void *a, void (*f)(void *))
{
    int i;

    for (i = 0x1d; i >= 0; i--)
    {
        if (gUnknown_03001470[i].unk00 == (u32)a)
            f(&gUnknown_03001470[i]);
    }
}
