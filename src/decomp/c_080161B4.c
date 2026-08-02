#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080161B4.
 * sub_080161B4 @ 0x080161B4, sub_080162A4 @ 0x080162A4, sub_08016370 @ 0x08016370, sub_0801642C @ 0x0801642C, sub_080164E0 @ 0x080164E0
 */

/* The gUnknown_03001470 slot's 0x3c..0x5f tail seen as the FLOAT path-mover
 * state that sub_080161B4..sub_0801642C and sub_080162A4 share. struct
 * Unk03001470 in include/unknown-globals.h describes the same bytes as a
 * function pointer plus halfword flags, which is a different subsystem's view
 * of the same scratch area -- the original almost certainly had a union here.
 *
 * The WRAPPER STRUCT is load-bearing, and for the reason wave 18 recorded on
 * struct Unk08136090: the ROM HOISTS the member offset onto the base
 * (`adds r4,r7,#0; adds r4,#0x3c; adds r4,r6,r4`), which `p[i].m` on a plain
 * pointer cannot produce -- that folds the offset into the load displacement
 * (`ldr r0,[r5,#0x3c]`). `p->arr[i].m` reproduces it instruction for
 * instruction. Probed both ways. */
struct Unk1470Path
{
    /* 0x00 */ u8 filler_00[0x04];
    /* 0x04 */ const void *unk04;
    /* 0x08 */ u8 filler_08[0x30];
    /* 0x38 */ s16 unk38;
    /* 0x3a */ u8 filler_3a[0x02];
    /* 0x3c */ float unk3c;
    /* 0x40 */ float unk40;
    /* 0x44 */ u8 filler_44[0x08];
    /* 0x4c */ float unk4c;
    /* 0x50 */ float unk50;
    /* 0x54 */ float unk54;
    /* 0x58 */ float unk58;
    /* 0x5c */ int unk5c;
};
struct Unk1470Wrap /* not a real object: see above */
{
    /* 0x00 */ struct Unk1470Path unk00[30];
};
#define gPath (((struct Unk1470Wrap *)gUnknown_03001470)->unk00)

/* One command of the gUnknown_03001470[a].unk04 script stream: walk a ROM list
 * of s16 x/y PAIRS, one pair per frame, offsetting the slot's start position by
 * it. The slot's unk38 doubles as the cursor into that list; a leading -1 is the
 * terminator, and retiring the command steps the script cursor 8 bytes on and
 * resets the tick.
 *
 * `r` is bound and THEN advanced, two statements: the ROM dereferences the
 * command word into its own register before it computes unk38 * 2 (`ldr r6,[r2]`
 * ahead of the `ldrsh`/`lsls #2`), where the single-expression spelling emits
 * the deref last and adds into a fresh register. */
bool8 sub_080161B4(u8 a)
{
    s16 x, y;
    const s16 *r;

    if (gPath[a].unk38 == 0) {
        sub_080155E8(a, &x, &y);
        gPath[a].unk3c = x;
        gPath[a].unk40 = y;
    }
    r = *(const s16 **)gPath[a].unk04;
    r += gPath[a].unk38 * 2;
    if (r[0] == -1) {
        gPath[a].unk04 = (const u8 *)gPath[a].unk04 + 8;
        gPath[a].unk38 = 0;
    } else {
        sub_080155C0(a, gPath[a].unk3c + r[0], gPath[a].unk40 + r[1]);
        gPath[a].unk38++;
    }
    return FALSE;
}

/* One frame of the smooth move sub_08016370/sub_0801642C set up: integrate
 * velocity into position and acceleration into velocity, push the truncated
 * position out through sub_080155C0, and count the frame off. When the counter
 * was already 0 the command is retired -- the tick is cleared and the script
 * cursor steps one 8-byte command on.
 *
 * `n = p->unk5c--` rather than `n = p->unk5c; p->unk5c = n - 1;`: the ROM's
 * `adds r2,r0,#0; subs r0,#1` is the post-decrement's copy-then-clobber, where
 * the two-statement spelling emits the three-address `subs r1,r2,#1` and is two
 * bytes short. And `if (p->unk5c-- == 0)` with no local at all is different
 * again -- with the old value dead, agbcc compares the DECREMENTED value
 * against -1. */
void sub_080162A4(u8 a)
{
    int n;

    gPath[a].unk3c += gPath[a].unk4c;
    gPath[a].unk40 += gPath[a].unk50;
    gPath[a].unk4c += gPath[a].unk54;
    gPath[a].unk50 += gPath[a].unk58;
    sub_080155C0(a, gPath[a].unk3c, gPath[a].unk40);
    n = gPath[a].unk5c--;
    if (n == 0) {
        gPath[a].unk38 = 0;
        gPath[a].unk04 = (const u8 *)gPath[a].unk04 + 8;
    }
}

/* One command of the gUnknown_03001470[a].unk04 script stream: start a smooth
 * move whose five parameters are five floats the command word points at --
 * velocity x/y, acceleration x/y and the frame count. The starting position is
 * the slot's current one, fetched through sub_080155E8's two s16 out-params
 * (both packed into the single `sub sp,#4` word). Only done on the first frame,
 * i.e. while the slot's unk38 tick is still 0; every frame then steps
 * sub_080162A4. */
bool8 sub_08016370(u8 a)
{
    s16 x, y;
    const float *q;

    q = *(const float **)gPath[a].unk04;
    if (gPath[a].unk38 == 0) {
        sub_080155E8(a, &x, &y);
        gPath[a].unk3c = x;
        gPath[a].unk40 = y;
        gPath[a].unk4c = q[0];
        gPath[a].unk50 = q[1];
        gPath[a].unk54 = q[2];
        gPath[a].unk58 = q[3];
        gPath[a].unk5c = q[4];
        gPath[a].unk38++;
    }
    sub_080162A4(a);
    return FALSE;
}

/* One command of the gUnknown_03001470[a].unk04 script stream: a constant-speed
 * move, i.e. sub_08016370's setup with the two accelerations forced to zero.
 * Unlike sub_08016370 the operands are INLINE in the 8-byte command rather than
 * behind its first word -- `ldr r5,[&unk04]` then `ldr [r5]` / `ldrh [r5,#4]` is
 * one deref, not two -- the same shape as src/decomp/c_080167CC.c. The velocity
 * is a whole signed word converted to float; the frame count is the unsigned
 * halfword at +4. */
bool8 sub_0801642C(u8 a)
{
    s16 x, y;

    if (gPath[a].unk38 == 0) {
        sub_080155E8(a, &x, &y);
        gPath[a].unk3c = x;
        gPath[a].unk40 = y;
        gPath[a].unk4c = *(const int *)gPath[a].unk04;
        gPath[a].unk50 = 0;
        gPath[a].unk54 = 0;
        gPath[a].unk58 = 0;
        gPath[a].unk5c = ((const u16 *)gPath[a].unk04)[2];
        gPath[a].unk38++;
    }
    sub_080162A4(a);
    return FALSE;
}

/* sub_0801642C's vertical twin: the same constant-speed move with the inline
 * word driving unk50 (y) instead of unk4c (x), and the other three float
 * members zeroed. One `.4byte 0` pool word serves all three zeros. */
bool8 sub_080164E0(u8 a)
{
    s16 x, y;

    if (gPath[a].unk38 == 0) {
        sub_080155E8(a, &x, &y);
        gPath[a].unk3c = x;
        gPath[a].unk40 = y;
        gPath[a].unk4c = 0;
        gPath[a].unk50 = *(const int *)gPath[a].unk04;
        gPath[a].unk54 = 0;
        gPath[a].unk58 = 0;
        gPath[a].unk5c = ((const u16 *)gPath[a].unk04)[2];
        gPath[a].unk38++;
    }
    sub_080162A4(a);
    return FALSE;
}
