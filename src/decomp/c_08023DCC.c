#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08023DCC.
 * sub_08023DCC @ 0x08023DCC, sub_08023E14 @ 0x08023E14, sub_08023E5C @ 0x08023E5C, sub_08023EA4 @ 0x08023EA4
 */

/* Family F043 (tools/families.py): four 72-byte wrappers that run two or three
 * redraw passes over the same four arguments. Four `lsls #0x10; lsrs #0x10`
 * pairs into four callee-saved registers is four genuine `u16` parameters --
 * unlike the F041 case, here the narrowing survives BECAUSE each value is used
 * two or three times across calls, and every callee re-reads it unconverted
 * (`adds rN, rM, #0`), which is only free when the declared parameter is
 * u16-compatible.
 *
 * sub_08023DCC and sub_08023E14 are byte-for-byte the same function, as are
 * sub_08023E5C and sub_08023EA4 -- same callees, same global, same
 * relocations. Two duplicated bodies, not four; the ROM really does contain
 * both copies.
 */
void sub_08023DCC(u16 a, u16 b, u16 c, u16 d)
{
    sub_08023A4C(a, b, c, d);
    sub_08023D48(a, b, c, d);

    if (gUnknown_03000559 == 1)
        sub_08023DA4(a, b, c, d);
}

/* Family F043 (tools/families.py): four 72-byte wrappers that run two or three
 * redraw passes over the same four arguments. Four `lsls #0x10; lsrs #0x10`
 * pairs into four callee-saved registers is four genuine `u16` parameters --
 * unlike the F041 case, here the narrowing survives BECAUSE each value is used
 * two or three times across calls, and every callee re-reads it unconverted
 * (`adds rN, rM, #0`), which is only free when the declared parameter is
 * u16-compatible.
 *
 * sub_08023DCC and sub_08023E14 are byte-for-byte the same function, as are
 * sub_08023E5C and sub_08023EA4 -- same callees, same global, same
 * relocations. Two duplicated bodies, not four; the ROM really does contain
 * both copies.
 */
void sub_08023E14(u16 a, u16 b, u16 c, u16 d)
{
    sub_08023A4C(a, b, c, d);
    sub_08023D48(a, b, c, d);

    if (gUnknown_03000559 == 1)
        sub_08023DA4(a, b, c, d);
}

/* Family F043 (tools/families.py): four 72-byte wrappers that run two or three
 * redraw passes over the same four arguments. Four `lsls #0x10; lsrs #0x10`
 * pairs into four callee-saved registers is four genuine `u16` parameters --
 * unlike the F041 case, here the narrowing survives BECAUSE each value is used
 * two or three times across calls, and every callee re-reads it unconverted
 * (`adds rN, rM, #0`), which is only free when the declared parameter is
 * u16-compatible.
 *
 * sub_08023DCC and sub_08023E14 are byte-for-byte the same function, as are
 * sub_08023E5C and sub_08023EA4 -- same callees, same global, same
 * relocations. Two duplicated bodies, not four; the ROM really does contain
 * both copies.
 */
void sub_08023E5C(u16 a, u16 b, u16 c, u16 d)
{
    sub_08023BAC(a, b, c, d);
    sub_08023D14(a, b, c, d);

    if (gUnknown_03000559 == 1)
        sub_08023D7C(a, b, c, d);
}

/* Family F043 (tools/families.py): four 72-byte wrappers that run two or three
 * redraw passes over the same four arguments. Four `lsls #0x10; lsrs #0x10`
 * pairs into four callee-saved registers is four genuine `u16` parameters --
 * unlike the F041 case, here the narrowing survives BECAUSE each value is used
 * two or three times across calls, and every callee re-reads it unconverted
 * (`adds rN, rM, #0`), which is only free when the declared parameter is
 * u16-compatible.
 *
 * sub_08023DCC and sub_08023E14 are byte-for-byte the same function, as are
 * sub_08023E5C and sub_08023EA4 -- same callees, same global, same
 * relocations. Two duplicated bodies, not four; the ROM really does contain
 * both copies.
 */
void sub_08023EA4(u16 a, u16 b, u16 c, u16 d)
{
    sub_08023BAC(a, b, c, d);
    sub_08023D14(a, b, c, d);

    if (gUnknown_03000559 == 1)
        sub_08023D7C(a, b, c, d);
}
