#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014004.
 * sub_08014004 @ 0x08014004
 */

/* Scans a text-command stream and returns FALSE as soon as it meets token
 * 0x14, TRUE at the terminator. Each token's length is its case: most advance
 * by 2, the 0xc..0xf / 0x15 / 0x80..0x83 group by 1, and 9 / 0xa consume a
 * following operand only when it is in range.
 *
 * The case ORDER below is read off the emitted body order, which agbcc keeps:
 * 0x14, {0x16,0x17}, 0xa, the one-byte group, 9, default. The {0x16,0x17} arm
 * looks redundant (`d` can only be 0 or 1 there) but its `subs r0, #0x16` and
 * the tail it cross-jumps into are both in the ROM, so the original wrote it.
 * `d` is `u8`: the `lsls #0x18; lsrs #0x18` before each compare is the store
 * into it, not a mask. */
bool8 sub_08014004(u8 *p)
{
    u8 d;

    while (*p != 0)
    {
        switch (*p)
        {
        case 0x14:
            return FALSE;
        case 0x16:
        case 0x17:
            d = *p - 0x16;
            if (d <= 1)
                p++;
            break;
        case 0xa:
            p++;
            d = *p + 0x80;
            if (d <= 1)
                p++;
            break;
        case 0xc:
        case 0xd:
        case 0xe:
        case 0xf:
        case 0x15:
        case 0x80:
        case 0x81:
        case 0x82:
        case 0x83:
            p++;
            break;
        case 9:
            p++;
            d = *p + 0x80;
            if (d <= 0x14)
                p++;
            break;
        default:
            p += 2;
            break;
        }
    }

    return TRUE;
}
