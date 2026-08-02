#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08039064.
 * sub_08039064 @ 0x08039064, sub_080390CC @ 0x080390CC
 */

/* A four-way comparison of two parallel s8 tables at gUnknown_0849D5F8, run on
 * the pair (n - 1, n): the unk20 table decides first and the unk2c table only
 * breaks its tie, so this reads a direction/ordering between adjacent slots.
 *
 * IT FALLS OFF THE END DELIBERATELY. When both pairs compare equal no `movs r0`
 * executes and r0 still holds the raw parameter -- the ROM has no default arm
 * and agbcc emits none. Adding `return 0;` would cost a `movs r0,#0`.
 *
 * The `ldrb` + `lsls #24; asrs #24` on an `s8` member is not a cast in the
 * source: the index is a register, so the address is materialised first and
 * the signed byte load loses its register-offset `ldrsb` form. */
int sub_08039064(u8 n)
{
    struct Unk0849D5F8 *p;

    if (n == 0)
        return 0;

    p = gUnknown_0849D5F8;

    if (p->unk20[n - 1] < p->unk20[n])
        return 3;
    if (p->unk20[n - 1] > p->unk20[n])
        return 1;
    if (p->unk2c[n - 1] < p->unk2c[n])
        return 4;
    if (p->unk2c[n - 1] > p->unk2c[n])
        return 2;
}

/* sub_08039064's ascending twin: the same two parallel s8 tables compared on
 * the pair (n, n + 1) instead of (n - 1, n), with the four results permuted
 * (1/3/2/4 against 3/1/4/2). The guard is the table's own extent at unk45
 * rather than a zero test, which is what makes this the top-of-range case.
 *
 * The base lands in ip because the guard's compare needs the pointer live
 * across it while r0..r3 are all busy; it is register pressure, not a loop.
 * Falls off the end on the all-equal path exactly as the twin does. */
int sub_080390CC(u8 n)
{
    struct Unk0849D5F8 *p;

    p = gUnknown_0849D5F8;

    if (n == p->unk45)
        return 0;

    if (p->unk20[n] < p->unk20[n + 1])
        return 1;
    if (p->unk20[n] > p->unk20[n + 1])
        return 3;
    if (p->unk2c[n] < p->unk2c[n + 1])
        return 2;
    if (p->unk2c[n] > p->unk2c[n + 1])
        return 4;
}
