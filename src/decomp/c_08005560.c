#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08005560.
 * sub_08005560 @ 0x08005560
 */

/* One of a byte-identical PAIR with sub_08005598: the two instruction streams
 * are the same instruction for instruction and differ in exactly one pool word,
 * gUnknown_08488444 versus gUnknown_0848846C. The other pool word,
 * gUnknown_0200B0B0, is the SAME symbol in both. */

void sub_08005560(void)
{
    gUnknown_0200B0B0->unk02 = 0;
    sub_080152EC(gUnknown_08488444, 0);
}
