#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800492C.
 * sub_0800492C @ 0x0800492C
 */

/* `adds rN, #0xae` before the `strb` is THUMB's byte-store immediate stopping
 * at 31, the same addressing-mode artefact unk6a and unk6b already carry -- not
 * a second object. */
void sub_0800492C(void)
{
    sub_0803B524(0xd8);
    sub_0800056C(1);
    gUnknown_0200B0B0->unkae = 0;
}
