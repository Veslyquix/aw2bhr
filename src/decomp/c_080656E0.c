#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080656E0.
 * sub_080656E0 @ 0x080656E0
 */

/* One of a byte-identical PAIR with sub_0806D820, which lives in a different
 * .s file entirely (code-0806CFC8.s): the streams match instruction for
 * instruction and differ only in the single pool word gUnknown_08580C7C versus
 * gUnknown_08581F40.
 *
 * `subs r1, #0x1f` is not a second constant -- agbcc reuses the 0x1e it just
 * stored to build -1 in one instruction. unk44 was filler until wave 29. */

void sub_080656E0(void)
{
    struct Unk03001470 *p = sub_080152EC(gUnknown_08580C7C, 3);

    p->unk28 = 30;
    p->unk2c = -1;
    p->unk44 = 14;
}
