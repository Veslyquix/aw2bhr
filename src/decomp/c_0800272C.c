#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800272C.
 * sub_0800272C @ 0x0800272C
 */

/* Loads one of eleven OBJ graphics sets into OBJ VRAM and then hands the
 * resulting sprite to sub_0801BD00.
 *
 * a4 is a kind code. Its low five bits select the loader family; the value 8
 * there means "one of the five sized variants", which the switch turns into
 * sub_0803F6BC's second argument, and anything else is passed through with
 * variant 1 and shifts the sprite down eight pixels. */
void sub_0800272C(int a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
    void *dest;

    dest = (void *)(0x06010000 + ((gUnknown_08485C9C[a1] & 0x3FF) << 5));

    if ((a4 & 0x1F) == 8)
    {
        switch (a4)
        {
        case 0x08:
        case 0x28:
            sub_0803F6BC(8, 1, dest, a7);
            break;
        case 0x48:
            sub_0803F6BC(8, 2, dest, a7);
            break;
        case 0x68:
            sub_0803F6BC(8, 3, dest, a7);
            break;
        case 0x88:
            sub_0803F6BC(8, 4, dest, a7);
            break;
        }
    }
    else
    {
        sub_0803F6BC(a4 & 0x1F, 1, dest, a7);
        a3 += 8;
    }

    if (a5)
    {
        int attr1;

        attr1 = a2 & 0x1FF;
        if (a6)
            attr1 |= 0x1000;
        a3 = (a3 & 0xFF) | 0x500;
        sub_0801BD00(attr1, a3, gUnknown_08485CC8[a1], sub_08001D04(a4) << 12);
    }
    else
    {
        int attr1;

        attr1 = a2 & 0x1FF;
        if (a6)
            attr1 |= 0x1000;
        a3 = (a3 & 0xFF) | 0x400;
        sub_0801BD00(attr1, a3, gUnknown_08485CC8[a1], sub_08001D04(a4) << 12);
    }
}
