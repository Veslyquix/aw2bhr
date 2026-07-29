#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801153C.
 * sub_0801153C @ 0x0801153C
 */

#include "proc.h"
/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file .text as one
 * contiguous block at 0x0801153C.
 * sub_0801153C @ 0x0801153C
 */

/* Family F062 (data/families.json): `push {r4,lr}; adds r4,r0,#0; bl A;
 * adds r0,r4,#0; bl B; pop {r4}; pop {r0}; bx r0` -- 20 bytes, three members.
 * Both `adds` immediates are absent from `varies`, so only the two callees
 * differ.
 *
 * This is NOT the wave-14 F032 shape: there is no `lsls r0,#0x18; cmp r0,#0;
 * bne`, so the second call is unconditional and the first callee's result is
 * discarded. Whether the FIRST call receives the incoming r0 is decided
 * callee-side and the three members do not agree on it -- see each below.
 * `pop {r4}; pop {r0}` is still the void epilogue.
 */


/* The `bl sub_08011218` with r0 still holding the incoming proc looks exactly
 * like an argument pass and is not one: sub_08011218 is
 * `void sub_08011218(void)` in its promoted definition src/decomp/c_08011218.c
 * (`Proc_EndEach(gUnknown_0848927C)`), so it takes nothing. The
 * `adds r4, r0, #0` is "save it because the call clobbers r0", exactly the
 * wave-14 F032 trap one shape up.
 */

void sub_0801153C(ProcPtr proc)
{
    sub_08011218();
    Proc_Break(proc);
}
