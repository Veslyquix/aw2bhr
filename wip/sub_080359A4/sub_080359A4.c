#include "global.h"
#include "proc.h"

/* Draw this proc's sprite if its tile is on screen, visible and occupied.
 *
 * gUnknown_08499590 is the map/camera base, reached through agbcc's own
 * -fforce-addr word (the `ldr rN,=<word>; ldr r0,[rN]; ldr r1,[r0]` chain that
 * src/decomp/c_080358C4.c documents). The camera origin at +0x04 / +0x06 is the
 * same pair that file names unk04 / unk06; this function additionally reaches
 * the row-offset table at +0x417A and the occupancy plane at +0x234A, so the
 * local view carries those too.
 *
 * PARKED, wave 71 (W71-D): target 324 bytes, candidate 320 (-4), 45.1%
 * positional identity.  The semantic body, calls and private
 * gUnknown_08090EA8 slot are settled.  Fixing the first y value in ip restores
 * the ROM's mov-ip / call-site mov-r1-ip pair and improves the prior 308-byte
 * draft by 12 bytes.  The remaining delta is allocation: the ROM holds
 * proc/py/px/private-slot in r6/r4/r8/r9 and creates the py-to-r5 copy on both
 * sides of the optional call; this draft rotates those pointer allocnos and
 * emits one copy instead.
 */

struct Unk359A4Map
{
    /* 0x0000 */ u8 filler_0000[0x04];
    /* 0x0004 */ s16 unk04;
    /* 0x0006 */ s16 unk06;
    /* 0x0008 */ u8 filler_0008[0x2342];
    /* 0x234A */ u8 unk234A[0x1e30];
    /* 0x417A */ u16 unk417A[0x100];
};

struct Unk359A4Proc
{
    /* 0x00 */ PROC_HEADER;
    /* 0x29 */ STRUCT_PAD(0x29, 0x2c);
    /* 0x2c */ struct Unk0801C210 *unk2c;
    /* 0x30 */ struct Unit *unk30;
    /* 0x34 */ u8 filler_34[0x01];
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 filler_36[0x0c];
    /* 0x42 */ s16 unk42;
    /* 0x44 */ s16 unk44;
};

void sub_080359A4(ProcPtr procArg)
{
    struct Unk359A4Proc *proc = procArg;
    s16 *py;
    s16 *px;
    s16 *py2;
    u8 **const *screen;
    register int y asm("r12");

    py = &proc->unk44;
    y = *py;
    screen = &gUnknown_08090EA8;

    if ((u32)(y - ((struct Unk359A4Map *)**screen)->unk06 + 8) > 0xa8)
        return;

    px = &proc->unk42;
    if (*px - ((struct Unk359A4Map *)**screen)->unk04 < -8)
        return;
    if (*px - ((struct Unk359A4Map *)**screen)->unk04 > 0xf0)
        return;

    py2 = py;

    if (proc->unk35 == 2
        && (gPlaySt.savingEnabled == 0 || gUnknown_030032D8 != 0x13))
        sub_080358C4(*px, y);

    if ((gPlayers[gUnknown_030033EC].turnState & 2) == 0)
    {
        if (((struct Unk359A4Map *)**screen)->unk234A[
                ((struct Unk359A4Map *)**screen)->unk417A[(*py2 + 8) / 16]
                + (proc->unk42 + 8) / 16] == 0)
            return;
    }

    if (sub_080255F4(proc->unk30, (proc->unk42 + 8) / 16, (*py2 + 8) / 16) == 0)
        return;

    sub_0801C254(proc->unk2c,
                 *px - ((struct Unk359A4Map *)**screen)->unk04 + 8,
                 *py - ((struct Unk359A4Map *)**screen)->unk06 + 5);
}







