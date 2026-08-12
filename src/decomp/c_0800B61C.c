#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800B61C.
 * sub_0800B61C @ 0x0800B61C
 */

/* Wave 56, W56-P. MATCHED (relocs differ by NAME only and resolve to the same
 * address, which the tool accepts).
 *
 * PROMOTION NEEDS A .rodata POOL WORD PLACED:
 *   "rodata": ["0x0808D85C"]
 * then re-run tools/split_rodata.py and tools/gen_lds.py.
 * 0x0808D85C is NOT a global -- it holds 0x08499590, agbcc's -fforce-addr
 * address constant for the map POINTER. `MAP->width` therefore compiles to
 * THREE loads (pool word -> &gUnknown_08499590 -> the u8* -> ldrh), which is
 * correct and is what the ROM does; do not declare the pool word.
 *
 * Same nine-bit 3x3 neighbourhood mask as sub_08007DD0 (W56-L, this wave) --
 * that function is the exemplar and its `int ny` locals are load-bearing. The
 * only addition here is `& ~0x10`, which drops the CENTRE cell; agbcc builds
 * 0xFFFFFFEF as `movs #0x11; rsbs`, so read the constant as ~0x10 and not -0x11.
 *
 * THREE THINGS COST THE ATTEMPTS, all in the 19-arm switch, and all three are
 * layout facts rather than semantics:
 *
 *  1. gcc lays the case BODIES out in SOURCE order while the dispatch tree
 *     compares in VALUE order. The body order the ROM wants is
 *     0x400, 0x200, 0x800, 0x4a00, 0x4c00, 0x5200, 0x5400, 0x2c00, 0x3400,
 *     0x2a00, 0x3200, 0x4800, 0x5000, 0x2400, 0x2200, 0xc00, 0xa00, 0x1400,
 *     0x1200 -- not ascending, and reading it off the ROM's block addresses is
 *     the whole of step one. Value order was -44 bytes and 27%.
 *
 *  2. THE ELEVEN TWO-WAY `sub_0800B4F0` CASES NEED THE CALL RESULT BOUND TO A
 *     TEMP. `if (guard && call()) r = THEN; else r = ELSE;` puts THEN in the
 *     block before the compare and lets thread_jumps skip the `r > 0` test;
 *     the ROM assigns ELSE there instead and branches to THEN, which only
 *     happens when the assignment sits between the call and the test, i.e.
 *     when the source reads `u = call(); r = ELSE; if (u) r = THEN;`. The
 *     `else r = ELSE;` on the guard is a separate, cross-jumped block -- the
 *     ROM re-materialises the constant there, which is what proves `r` is
 *     never live across a call and pins it to the caller-saved r2.
 *
 *  3. THAT TEMP MUST BE ITS OWN LOCAL, not shared with the `t` the masked
 *     sub_0800B5C0 cases use. One pseudo for both gets r1 everywhere and costs
 *     an `adds r1, r0, #0` in each of the eleven cases (+28 bytes, 40.1%);
 *     splitting it lets the two-way temp coalesce onto r0 and took it to 82%.
 *     A shared temp is a REGISTER-ALLOCATION coupling between unrelated arms,
 *     and nothing in the diff points at the declaration -- worth remembering.
 *
 * Case 0xa00's inner chain reads like a nested `switch` (dispatch 2, 8, 0xa but
 * bodies 2, 0xa, 8) and is NOT one -- a 3-case switch balances its tree and
 * emits `cmp #8` first. It is a plain if/else-if in source order 2, 8, 0xa; the
 * apparent body reordering is cross-jumping, and it only resolves once the
 * function is the right length. Do not "fix" it into a switch.
 */

struct MapScreen
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 4];
    /* 0x0A22 */ u16 cells[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 terrain[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct MapScreen *)gUnknown_08499590)

s16 sub_0800B61C(int x, int y)
{
    int mask = 0;
    int t;
    int u;
    int r;

    if (y > 0)
    {
        int ny = y - 1;
        if (x > 0)
            mask |= sub_080015E4(x - 1, ny) << 8;
        mask |= sub_080015E4(x, ny) << 7;
        if (x < MAP->width - 1)
            mask |= sub_080015E4(x + 1, ny) << 6;
    }
    if (x > 0)
        mask |= sub_080015E4(x - 1, y) << 5;
    mask |= sub_080015E4(x, y) << 4;
    if (x < MAP->width - 1)
        mask |= sub_080015E4(x + 1, y) << 3;
    if (y < MAP->height - 1)
    {
        int ny = y + 1;
        if (x > 0)
            mask |= sub_080015E4(x - 1, ny) << 2;
        mask |= sub_080015E4(x, ny) << 1;
        if (x < MAP->width - 1)
            mask |= sub_080015E4(x + 1, ny);
    }

    r = gUnknown_084861C4[mask & ~0x10];
    if (r < 0)
        return r;

    switch (r & 0x7e00)
    {
    case 0x400:
        if (x > 0)
        {
            u = sub_0800B4F0(x - 1, y);
            r = 0xb6;
            if (u)
                r = 0xf3;
        }
        else
            r = 0xb6;
        break;
    case 0x200:
        if (x < MAP->width - 1)
        {
            u = sub_0800B4F0(x + 1, y);
            r = 0xb7;
            if (u)
                r = 0xf2;
        }
        else
            r = 0xb7;
        break;
    case 0x800:
        if (x > 0)
        {
            u = sub_0800B4F0(x, y - 1);
            r = 0xb6;
            if (u)
                r = 0xd2;
        }
        else
            r = 0xb6;
        break;
    case 0x4a00:
        if (x < MAP->width - 1)
        {
            u = sub_0800B4F0(x + 1, y);
            r = 0x8f;
            if (u)
                r = 0x6d;
        }
        else
            r = 0x8f;
        break;
    case 0x4c00:
        if (x > 0)
        {
            u = sub_0800B4F0(x - 1, y);
            r = 0x8f;
            if (u)
                r = 0x6e;
        }
        else
            r = 0x8f;
        break;
    case 0x5200:
        if (x < MAP->width - 1)
        {
            u = sub_0800B4F0(x + 1, y);
            r = 0xef;
            if (u)
                r = 0xcd;
        }
        else
            r = 0xef;
        break;
    case 0x5400:
        if (x > 0)
        {
            u = sub_0800B4F0(x - 1, y);
            r = 0xef;
            if (u)
                r = 0xce;
        }
        else
            r = 0xef;
        break;
    case 0x2c00:
        if (y > 0)
        {
            u = sub_0800B4F0(x, y - 1);
            r = 0x92;
            if (u)
                r = 0xcf;
        }
        else
            r = 0x92;
        break;
    case 0x3400:
        if (y < MAP->height - 1)
        {
            u = sub_0800B4F0(x, y + 1);
            r = 0x92;
            if (u)
                r = 0xaf;
        }
        else
            r = 0x92;
        break;
    case 0x2a00:
        if (y > 0)
        {
            u = sub_0800B4F0(x, y - 1);
            r = 0x93;
            if (u)
                r = 0xd0;
        }
        else
            r = 0x93;
        break;
    case 0x3200:
        if (y < MAP->height - 1)
        {
            u = sub_0800B4F0(x, y + 1);
            r = 0x93;
            if (u)
                r = 0xb0;
        }
        else
            r = 0x93;
        break;
    case 0x4800:
        t = sub_0800B5C0(x, y) & 7;
        if (t == 6)
            r = 0x10;
        else if (t == 4)
            r = 0x6e;
        else if (t == 2)
            r = 0x6d;
        else
            r = 0x8f;
        break;
    case 0x5000:
        t = sub_0800B5C0(x, y) & 0xe;
        if (t == 6)
            r = 0x50;
        else if (t == 2)
            r = 0xcd;
        else if (t == 4)
            r = 0xce;
        else
            r = 0xef;
        break;
    case 0x2400:
        t = sub_0800B5C0(x, y) & 9;
        if (t == 9)
            r = 0x2e;
        else if (t == 8)
            r = 0xcf;
        else if (t == 1)
            r = 0xaf;
        else
            r = 0x92;
        break;
    case 0x2200:
        t = sub_0800B5C0(x, y) & 9;
        if (t == 9)
            r = 0x32;
        else if (t == 8)
            r = 0xd0;
        else if (t == 1)
            r = 0xb0;
        else
            r = 0x93;
        break;
    case 0xc00:
        t = sub_0800B5C0(x, y);
        if (t == 4)
            r = 0xf3;
        else if (t == 8)
            r = 0xd2;
        else if (t == 0xc)
            r = 0x2f;
        else
            r = 0xb6;
        break;
    case 0xa00:
        t = sub_0800B5C0(x, y);
        if (t == 2)
            r = 0xf2;
        else if (t == 8)
        {
            if (x > 0 && y > 0 && sub_080015E4(x - 1, y - 1))
                r = 0xd3;
            else
                r = 0xb7;
        }
        else if (t == 0xa)
        {
            if (x > 0 && y > 0 && sub_080015E4(x - 1, y - 1))
                r = 0x31;
            else
                r = 0xf2;
        }
        else
            r = 0xb7;
        break;
    case 0x1400:
        t = sub_0800B5C0(x, y);
        if (t == 4)
            r = 0x113;
        else if (t == 1)
            r = 0xb2;
        else if (t == 5)
            r = 0x4f;
        else
            r = 0xd6;
        break;
    case 0x1200:
        t = sub_0800B5C0(x, y);
        if (t == 2)
            r = 0x112;
        else if (t == 1)
            r = 0xb3;
        else if (t == 3)
            r = 0x51;
        else
            r = 0xd7;
        break;
    }

    if (r > 0)
        r &= 0x1ff;

    return r;
}
