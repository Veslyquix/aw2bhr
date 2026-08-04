#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08023D14.
 * sub_08023D14 @ 0x08023D14, sub_08023D48 @ 0x08023D48, sub_08023D7C @ 0x08023D7C, sub_08023DA4 @ 0x08023DA4
 */

void sub_08023D14(u16 a1, u16 a2, u16 a3, u16 a4)
{
    u16 i;

    for (i = 0; i < 16; i++)
    {
        sub_08022428(a3 + i, a4);
        sub_08022618(a3 + i, a4);
    }
}

void sub_08023D48(u16 a1, u16 a2, u16 a3, u16 a4)
{
    u16 i;

    for (i = 0; i < 11; i++)
    {
        sub_08022428(a3, a4 + i);
        sub_08022618(a3, a4 + i);
    }
}

void sub_08023D7C(u16 a1, u16 a2, u16 a3, u16 a4)
{
    u16 i;

    for (i = 0; i < 16; i++)
        sub_080227F4(a3 + i, a4);
}

void sub_08023DA4(u16 a1, u16 a2, u16 a3, u16 a4)
{
    u16 i;

    for (i = 0; i < 11; i++)
        sub_080227F4(a3, a4 + i);
}
