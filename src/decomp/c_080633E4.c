#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080633E4.
 * sub_080633E4 @ 0x080633E4
 */

#include "hardware.h"

/* The link hardware has no shadow, so this pokes SIOCNT directly. The `& 0x8C`
 * result is kept in a local: the not-ready arm returns it XORed with 8, which
 * is why the value survives the sub_08062FB8 call in a callee-saved register. */
int sub_080633E4(struct Unk08062FB8 *p, u16 data)
{
    int t = REG_SIOCNT & 0x8C;

    if (t != 8)
    {
        sub_08062FB8(p);
        return t ^ 8;
    }

    REG_SIOMLT_SEND = data;
    REG_SIOCNT = 0x2083;
    p->unk48 = 1;
    return 0;
}
