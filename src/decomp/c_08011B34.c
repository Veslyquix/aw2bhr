#include "global.h"

/* The bound is spelled `+ 16` here, but asm/code.s shows the pool word
 * symbolized as `gUnknown_03000040` -- that is the disassembler naming the
 * raw value 0x03000040, which is one past this 16-pointer array and happens
 * to be the next symbol in the linker script. Both spellings relocate to the
 * same address, so the linked bytes are identical; trymatch compares
 * relocations symbolically and reports a false mismatch here. The ROM hash
 * is the oracle that settles it. */
void sub_08011B34(void *a)
{
    void **p;

    for (p = gUnknown_03000000; p < gUnknown_03000000 + 16; p++)
    {
        if (*p == 0)
        {
            *p = a;
            break;
        }
    }
}
