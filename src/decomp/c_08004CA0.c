#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004CA0.
 * sub_08004CA0 @ 0x08004CA0
 */

/* The seven-entry jump table is the load-bearing detail: agbcc only emits a
 * tablejump while the case nodes are still distinct, and `group_case_nodes`
 * merges adjacent cases sharing one body, so `case 3: ... case 7: break;`
 * collapses below the threshold and comes out as a three-compare tree. Giving
 * each of the five dead cases a body of its own keeps seven nodes alive; `flow`
 * then deletes the dead stores and cross-jumps the arms, which is why table
 * entries 2..6 all point at the epilogue. Same shape as sub_08020680. The
 * values stored are not recoverable -- only the fact that the five cases were
 * written out separately is. */
void sub_08004CA0(void)
{
    int x;

    if (gUnknown_0200B0B0->unk06 != 0)
    {
        sub_08004C5C();
        sub_08024268();
        sub_0801A104(gUnknown_08487C84, 2, 2, 0);
    }

    switch (gUnknown_0200B0B0->unk02)
    {
    case 1:
        sub_080036A4();
        break;
    case 2:
        sub_0800376C();
        break;
    case 3:
        x = 1;
        break;
    case 4:
        x = 2;
        break;
    case 5:
        x = 3;
        break;
    case 6:
        x = 4;
        break;
    case 7:
        x = 5;
        break;
    }
}
