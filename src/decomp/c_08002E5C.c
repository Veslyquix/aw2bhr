#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08002E5C.
 * sub_08002E5C @ 0x08002E5C
 */

void sub_08002E5C(void)
{
    sub_08011E54(gUnknown_0808D8AC, (void *)0x06014D40, 0x460);
    sub_08002EF8();
    sub_08011E54(gUnknown_0808DD0C, (void *)0x06016180, 0x200);
    sub_08011E54(gUnknown_0808DF0C, (void *)0x06016140, 0x20);
    sub_08011E54(gUnknown_0808DF2C, (void *)0x06016160, 0x20);
}
