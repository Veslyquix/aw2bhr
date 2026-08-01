#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08044B28.
 * sub_08044B28 @ 0x08044B28
 */

#include "proc.h"

/* Sets the army's step index and then runs the two callbacks that step names:
 * one out of gUnknown_085D3DD0[unk1d].unk38[unk1f] and one out of
 * gUnknown_084A0090[unk1d].unk1c[unk1f - 1]. Both are `bl _call_via_r1`, i.e.
 * one-argument indirect calls -- the first gets this function's own ProcPtr,
 * the second a literal 0.
 *
 * The SECOND index comes from gUnknown_030033EC, not from a1, so the two
 * lookups are on different armies and the store between them is why unk1f is
 * re-read rather than reused. */
void sub_08044B28(int a1, int a2, ProcPtr a3)
{
    gUnknown_08499598[a1].unk1f = a2;

    gUnknown_085D3DD0[gUnknown_08499598[a1].unk1d]
        .unk38[gUnknown_08499598[a1].unk1f].unk04(a3);

    gUnknown_084A0090[gUnknown_08499598[gUnknown_030033EC].unk1d]
        .unk1c[gUnknown_08499598[gUnknown_030033EC].unk1f - 1].unk0c(0);
}
