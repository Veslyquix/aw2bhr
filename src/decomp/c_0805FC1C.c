#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0805FC1C.
 * sub_0805FC1C @ 0x0805FC1C
 */

#include "map.h"
struct Unk5FC1CTbl
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01[0x19];
    /* 0x1a */ u8 unk1a[0x20];
};

/*
 * sub_0805FC1C -- AI: find a transport in this army that the active unit can board.
 *
 * Walks the 64 unit slots of the current army. gUnknown_03003F2C is the
 * first slot and gUnknown_030040D8 is the active unit. A unit is a candidate
 * when all of these are true:
 *   - its slot is in use and flag bit 3 is clear;
 *   - its tile is reachable this turn (gUnknown_03003340 is not negative);
 *   - its class's transport table has a nonzero entry for the active unit's
 *     type (at +1) and for the terrain under the candidate (at +0x1a).
 * Types 7 and 0x14 are accepted when bits 6..7 of byte 9 are 0 and byte 7 is 0.
 * Type 0x17 also needs bits 3..5 of the active unit's byte 9 to be 3, and is
 * accepted when bits 6..7 of its own byte 9 are not 2 and byte 8 is 0. The
 * first accepted unit's x and y are written to *a2 and the function returns.
 * A candidate that is not accepted gets bits 6..7 of byte 9 set to 1 (types 7
 * and 0x14) or 2 (type 0x17). The meaning of these bits is unknown. a1 is not
 * used.
 *
 * Why the C looks odd:
 *   - Both "found" cases jump to one label after the loop. If each case
 *     returns on its own, the compiler keeps extra values alive and the
 *     whole function comes out different.
 *   - The transport table is read through a small struct (`->unk01[]`,
 *     `->unk1a[]`), not as `tbl + 0x1a`. The pointer form puts two values
 *     in swapped registers.
 */
void sub_0805FC1C(int a1, void *a2)
{
    int i;
    int t;
    struct Unit *rec;
    struct Unk030040D8 *p;
    u8 *tbl;

    for (i = gUnknown_03003F2C; i < gUnknown_03003F2C + 0x40; i++)
    {
        rec = &gUnknown_08499594[i];
        if (rec->type == 0)
            continue;
        if (rec->flags & 8)
            continue;
        if ((s8)gUnknown_03003340[rec->y][rec->x] < 0)
            continue;
        tbl = gUnknown_085D5ABC[rec->type].transportTable;
        p = gUnknown_030040D8;
        if (((struct Unk5FC1CTbl *)tbl)->unk01[p->unk00] == 0)
            continue;
        t = ((struct Map *)gUnknown_08499590)->terrain[
                ((struct Map *)gUnknown_08499590)->rowOffset[rec->y]
                + rec->x] & 0x1f;
        if (((struct Unk5FC1CTbl *)tbl)->unk1a[t] == 0)
            continue;

        switch (rec->type)
        {
        case 7:
        case 0x14:
            if ((rec->unk09 & 0xc0) == 0 && rec->unk07 == 0)
                goto found;
            rec->unk09 = (rec->unk09 & 0x3f) | 0x40;
            break;
        case 0x17:
            if ((p->unk07[2] & 0x38) != 0x18)
                continue;
            if ((rec->unk09 & 0xc0) != 0x80 && rec->unk08 == 0)
                goto found;
            rec->unk09 = (rec->unk09 & 0x3f) | 0x80;
            break;
        }
    }
    return;
found:
    ((union Unk802C57CBuf *)a2)->pos.unk00 = rec->x;
    ((union Unk802C57CBuf *)a2)->pos.unk02 = rec->y;
}
