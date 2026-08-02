#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080005FC.
 * sub_080005FC @ 0x080005FC
 */

/* Wave 37 (W37-E). Matched on the second attempt.
 * The two script openers reach ONE `bl sub_080193B0`, with the two `ldr` arms
 * joined by an unconditional `b`. That is a `?:` on the ARGUMENT, not an
 * if/else with two calls: two calls plus cross-jumping leaves both `bl`s in
 * place and costs 4 bytes (measured -- attempt 1). The wave-37 rule that a
 * single `strh` fed by two b-joined arms is NOT a `?:` is about a STORE; for a
 * call argument the `?:` is exactly what produces this shape. */

void sub_080005FC(void)
{
    if (gUnknown_0200B0B0->unk06 != 0)
    {
        gUnknown_0200B0B0->unk06 = 0;
        gUnknown_0200B0B0->unk02 = 0;
        gUnknown_0200B0B0->unk0c = 30;
    }

    if (gUnknown_0200B0B0->unk02 == 0)
    {
        if (--gUnknown_0200B0B0->unk0c == 0)
        {
            gUnknown_0200B0B0->unk02 = 1;
            sub_080193B0(sub_08004E44() == 0 ? gUnknown_084856FC : gUnknown_084857AC);
        }
    }
}
