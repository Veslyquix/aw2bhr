#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800C124.
 * sub_0800C124 @ 0x0800C124
 */

/* Exact configured match. The register-allocation lever is lifetime identity,
 * not declaration order: the map pointer and its derived rows/offset values
 * must be distinct locals in the true arm, the false arm before sub_08007CA0,
 * and the false arm after that call. A single shared p/rows/off set preserves
 * the instruction stream but scores 89.4%; splitting only by branch fixes the
 * true arm but leaves the false-arm pointer in r1. Splitting again at the call
 * gives the ROM's r0-before/r1-after allocation without changing any opcode.
 * The retained 91.67% best.c is not the right base: its q assignment is inside
 * the sub_0800C840 arm and changes the branch target as well as semantics. */
void sub_0800C124(int x, int y)
{
    struct Unk0200B0B0 *q;
    u8 *pThen;
    u8 *rowsThen;
    int t;
    int offThen;
    u8 *pElse;
    u8 *rowsElse;
    int u;
    int idx;
    int offElse;
    u8 *pAfter;
    u8 *rowsAfter;
    int offAfter;

    if (sub_0800164C(x, y))
    {
        if (sub_08008C34(x, y))
            return;
        if (sub_0800C840(x, y))
            sub_0800C608(x, y);
        q = gUnknown_0200B0B0;
        pThen = (u8 *)gMap;
        t = y * 2;
        rowsThen = pThen + 0x417A;
        offThen = (*(u16 *)(rowsThen + t) + x) * 2;
        pThen += 0xA22;
        pThen += offThen;
        q->unk20 = *(u16 *)pThen;
        sub_0800EC20(x, y);
        sub_08001158(x, y, 0x2A);
        sub_080011F4(x, y, 7);
        sub_08007F9C(x, y);
    }
    else
    {
        pElse = (u8 *)gMap;
        u = y * 2;
        rowsElse = pElse + 0x417A;
        idx = *(u16 *)(rowsElse + u) + x;
        pElse += 0x1432;
        pElse += idx;
        switch (*pElse)
        {
        case 7:
            sub_08007CA0(x, y);
            pAfter = (u8 *)gMap;
            rowsAfter = pAfter + 0x417A;
            offAfter = (*(u16 *)(rowsAfter + u) + x) * 2;
            pAfter += 0xA22;
            pAfter += offAfter;
            if (*(u16 *)pAfter != 0x2A)
            {
                sub_08001158(x, y, 0x2A);
                sub_080011F4(x, y, 7);
            }
            break;

        case 0xD:
            break;

        case 0x13:
            break;
        }
    }
    sub_08008BB8(x, y);
}
