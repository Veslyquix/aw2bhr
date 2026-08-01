#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08007B54.
 * sub_08007B54 @ 0x08007B54
 */

/* Start a proc and keep the s8 slot id it returns. The `(s32)` cast on the
 * script address is what sub_080152C0's declared first parameter forces, and it
 * is the spelling src/decomp/c_08005838.c and c_080059B4.c already use for the
 * neighbouring blobs.
 *
 * No re-narrowing after the `bl`: sub_080152C0 already returns s8 and unk6b is
 * s8, so the `strb` takes r0 as it stands. `adds r1, #0x6b` rather than a
 * displacement because strb's imm5 stops at 31. */
void sub_08007B54(void)
{
    gUnknown_0200B0B0->unk6b = sub_080152C0((s32)gUnknown_08488890, 0);
}
