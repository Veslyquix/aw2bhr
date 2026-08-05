#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808603C.
 * sub_0808603C @ 0x0808603C
 */

#include "proc.h"

/* Three calls with the same proc. The FIRST one costs no argument setup because
 * r0 still holds it on entry -- that is a pass-through, not a nullary call, and
 * the two `adds r0, r4, #0` after it are what a saved parameter costs.
 *
 * Wave 44 (W44-C) retyped sub_0808606C's parameter from `ProcPtr` to
 * `struct Unk8606CProc *`; ProcPtr is `void *`, so the argument converts
 * implicitly and this stays byte-for-byte identical. Re-verified. */
void sub_0808603C(ProcPtr proc)
{
    sub_0808606C(proc);
    sub_080860DC(proc);
    sub_08086688(proc);
}
