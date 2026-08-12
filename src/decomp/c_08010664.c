#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08010664.
 * sub_08010664 @ 0x08010664
 */

/* Wave 56 (W56-J).
 *
 * Three 4-direction sweeps with two "centre cell" checks between them. Sweeps
 * 1 and 2 are IDENTICAL source; the ROM emits both in full because they are
 * two separate loops and nothing merges them. Sweep 3 is the same block with
 * sub_08010B34 in place of sub_0800FD44 (and no third argument).
 *
 * THE LOAD-BEARING SPELLING: the inner call's result goes through a TEMP and
 * the two calls are two statements. Written nested --
 * `sub_08001158(A, B, sub_0800FD44(A, B, 0))` -- agbcc evaluates A and B once
 * for the outer call and keeps them live across the `bl`, which is four
 * instructions short at each of the six sites (-44 bytes overall). As two
 * statements the intervening call kills the CSE on the ROM tables and both
 * operands are recomputed, which is what the ROM does.
 *
 * The `y * 2` giv of the first centre check is spilled to [sp] and reloaded by
 * the second one, across the whole of sweep 2 -- that is CSE, and it happens
 * only because both checks spell the identical expression.
 *
 * sub_0800F564(x, y, i) is called up to three times with the same arguments; a
 * call is not CSE-able, so this is literally what the source says.
 *
 * THE `(v = ...)` IN SWEEP 2'S GUARD IS A PERMUTER ARTEFACT, NOT THE ORIGINAL
 * SOURCE, and it is flagged here so nobody reads it as evidence. The store is
 * dead -- v is written in the centre check above and rewritten in the one
 * below, and nothing reads it in between -- but it is what puts `y` in r7 and
 * `&gUnknown_0848896C[i]` in r6 instead of the other way round. Hand-written,
 * this draft is size-exact at 95.8% with a pure r6<->r7 / r8<->sl permutation
 * as the entire residual; decomp-permuter found the lever in ~1,960
 * iterations. Whatever the original wrote here made one more value live across
 * sweep 2, and this reproduces the effect without recovering the cause. */

struct Unk3F44Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_0004[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 plane[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 cell[0x417A - 0x1432];
    /* 0x417A */ u16 rowOffset[1];
};
#define MAP ((struct Unk3F44Map *)gUnknown_08499590)

void sub_08010664(int x, int y)
{
    int i;
    int t;
    u16 v;

    for (i = 0; i < 4; i++)
    {
        if (x + gUnknown_0848896C[i] >= 0
         && x + gUnknown_0848896C[i] < MAP->width
         && y + gUnknown_08488974[i] >= 0
         && y + gUnknown_08488974[i] < MAP->height)
        {
            if (sub_0800F564(x, y, i) != 0
             && (sub_0800F564(x, y, i) == 2 || sub_0800F564(x, y, i) == 3))
            {
                t = sub_0800FD44(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], 0);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
            else if (MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x162
                  || MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x163)
            {
                t = sub_0800FD44(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], 0);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
        }
    }

    v = MAP->plane[MAP->rowOffset[y] + x];
    if (v == 0x142 || v == 0x143 || v == 0x140 || v == 0x141
     || v == 0x160 || v == 0x161 || v == 0x162 || v == 0x163
     || v == 0x122 || v == 0x123 || v == 0x121 || v == 0x120
     || v == 0x103 || v == 0x102)
    {
        t = sub_0800FD44(x, y, 0);
        sub_08001158(x, y, t);
    }

    for (i = 0; i < 4; i++)
    {
        if (x + gUnknown_0848896C[i] >= 0
         && x + gUnknown_0848896C[i] < MAP->width
         && (v = y + gUnknown_08488974[i] >= 0)
         && y + gUnknown_08488974[i] < MAP->height)
        {
            if (sub_0800F564(x, y, i) != 0
             && (sub_0800F564(x, y, i) == 2 || sub_0800F564(x, y, i) == 3))
            {
                t = sub_0800FD44(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], 0);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
            else if (MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x162
                  || MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x163)
            {
                t = sub_0800FD44(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], 0);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
        }
    }

    v = MAP->plane[MAP->rowOffset[y] + x];
    if (v == 0x142 || v == 0x143 || v == 0x140 || v == 0x141
     || v == 0x160 || v == 0x161 || v == 0x162 || v == 0x163
     || v == 0x122 || v == 0x123 || v == 0x121 || v == 0x120
     || v == 0x103 || v == 0x102)
    {
        t = sub_08010B34(x, y);
        sub_08001158(x, y, t);
    }

    for (i = 0; i < 4; i++)
    {
        if (x + gUnknown_0848896C[i] >= 0
         && x + gUnknown_0848896C[i] < MAP->width
         && y + gUnknown_08488974[i] >= 0
         && y + gUnknown_08488974[i] < MAP->height)
        {
            if (sub_0800F564(x, y, i) != 0
             && (sub_0800F564(x, y, i) == 2 || sub_0800F564(x, y, i) == 3))
            {
                t = sub_08010B34(x + gUnknown_0848896C[i], y + gUnknown_08488974[i]);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
            else if (MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x162
                  || MAP->plane[MAP->rowOffset[y + gUnknown_08488974[i]] + (x + gUnknown_0848896C[i])] == 0x163)
            {
                t = sub_08010B34(x + gUnknown_0848896C[i], y + gUnknown_08488974[i]);
                sub_08001158(x + gUnknown_0848896C[i], y + gUnknown_08488974[i], t);
            }
        }
    }

}
