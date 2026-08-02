#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800487C.
 * sub_0800487C @ 0x0800487C
 */

void sub_0800487C(void)
{
    struct Unk03001470 * p;

    p = &gUnknown_03001470[gUnknown_03001FBC];

    if (sub_0808B694(&p->unk1e, &gUnknown_0200B0B0->unk9c))
        gUnknown_0200B0B0->unk00 |= 0x1000;

    sub_08023348();
    sub_0803662C();
    sub_08024268();
    sub_08024830();
    sub_08002DEC();
}
