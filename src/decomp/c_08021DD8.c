#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08021DD8.
 * sub_08021DD8 @ 0x08021DD8
 */

/* Two independent phase machines driven off two free-running counters. The
 * first switch's cases all `return`, because in the ROM they branch to the
 * epilogue while the default falls into the second counter's block -- a
 * `break` would run the second block for every case.
 *
 * The twelve cases of the second switch are written out separately in
 * ascending order even though six of them duplicate an earlier argument.
 * Cross-jumping then folds 22 into 86, 36 into 72 and 37 into 73 but leaves 23
 * and 87 alone, and the surviving block order in the ROM -- 0, 1, 3, 6, 7, 4,
 * 5, 2, 3 -- is exactly what that partial merge leaves behind. Writing the
 * duplicates as shared case labels instead gives a different order. */
void sub_08021DD8(void)
{
    if (sub_08011BD4() <= 0x1000)
    {
        gUnknown_030043F0++;

        switch (gUnknown_030043F0 % 0x70)
        {
        case 0x00:
            sub_08021DA0(0);
            return;
        case 0x0E:
            sub_08021DA0(1);
            return;
        case 0x1C:
            sub_08021DA0(2);
            return;
        case 0x2A:
            sub_08021DA0(3);
            return;
        case 0x38:
            sub_08021DA0(4);
            return;
        case 0x46:
            sub_08021DA0(5);
            return;
        case 0x54:
            sub_08021DA0(6);
            return;
        case 0x62:
            sub_08021DA0(7);
            return;
        }

        gUnknown_03004078++;

        switch (gUnknown_03004078 % 0x64)
        {
        case 0:
            sub_08021D64(0);
            break;
        case 1:
            sub_08021D64(1);
            break;
        case 22:
            sub_08021D64(2);
            break;
        case 23:
            sub_08021D64(3);
            break;
        case 36:
            sub_08021D64(4);
            break;
        case 37:
            sub_08021D64(5);
            break;
        case 50:
            sub_08021D64(6);
            break;
        case 51:
            sub_08021D64(7);
            break;
        case 72:
            sub_08021D64(4);
            break;
        case 73:
            sub_08021D64(5);
            break;
        case 86:
            sub_08021D64(2);
            break;
        case 87:
            sub_08021D64(3);
            break;
        }
    }
}
