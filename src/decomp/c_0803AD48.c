#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803AD48.
 * sub_0803AD48 @ 0x0803AD48
 */

#include "hardware.h"
/* MATCHED (wave 50, W50-B). 440/440 bytes; the only reloc note is
 * `different symbols that resolve to the same address` at +0x098, where the
 * ROM spells the pool word gUnknown_08091068 and this unit emits its own
 * .rodata copy. baserom.gba holds 0x03002EE0 there, i.e. &gpKeySt, so the
 * honest `gpKeySt->` spelling is what belongs here.
 *   PROMOTION MUST CARRY:  "rodata": ["0x08091068"]
 *
 * gUnknown_08090FB0 is a REAL 9-element table, not a pool word: it is indexed
 * by a computed subscript BEFORE the dereference (`lsls #2; adds base; ldr`).
 * Contrast sub_0803AFA0, which reaches its own string table through one MORE
 * indirection -- see work/sub_0803AFA0/NOTES.md.
 *
 * The gpKeySt reloads between the guarded blocks are not a spelling choice:
 * each block stores through `p`, which may alias struct KeySt, so agbcc must
 * re-read. The first two tests share one load because nothing stores between
 * them. */

struct Unk0803AD48
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ int unk08;
    /* 0x0c */ u8 filler_0c[0x12];
    /* 0x1e */ u8 unk1e;
    /* 0x1f */ u8 filler_1f[0x01];
    /* 0x20 */ u16 unk20[9];
};

void sub_0803AD48(struct Unk0803AD48 *p)
{
    u8 i;

    sub_080119D4(0xd8, 0x98, 0x188);
    sub_0803ABD8();
    sub_080119A0(0, 0, gUnknown_0809105C);
    for (i = 0; i <= 8; i++) {
        sub_080119A0(0, i * 8 + 8, gUnknown_08090FB0[i]);
        sub_0802BD54(0x68, i * 8 + 8, p->unk20[i]);
    }
    sub_080119A0(0, p->unk1e * 8 + 8, gUnknown_08091064);
    if (gpKeySt->held & 1) {
        p->unk08 = 0;
        return;
    }
    if (gpKeySt->held & 2) {
        gUnknown_03002F1C = 1;
        p->unk08 = 0;
        return;
    }
    if (gpKeySt->unk02 & 0x40) {
        if (p->unk1e != 0)
            p->unk1e--;
    }
    if (gpKeySt->unk02 & 0x80) {
        if (p->unk1e <= 6)
            p->unk1e++;
    }
    if (gpKeySt->held & 0x100) {
        for (i = 0; i <= 8; i++)
            p->unk20[i] = gUnknown_08091038[i];
    }
    if (gpKeySt->held & 0x200) {
        for (i = 0; i <= 8; i++)
            p->unk20[i] = 0;
        sub_0803C670();
        sub_0803BA1C();
    }
    if (gpKeySt->unk02 & 0x10) {
        if (gUnknown_08091038[p->unk1e] - gUnknown_0809104A[p->unk1e] < p->unk20[p->unk1e])
            p->unk20[p->unk1e] = gUnknown_08091038[p->unk1e];
        else
            p->unk20[p->unk1e] += gUnknown_0809104A[p->unk1e];
    }
    if (gpKeySt->unk02 & 0x20) {
        if (gUnknown_0809104A[p->unk1e] > p->unk20[p->unk1e])
            p->unk20[p->unk1e] = 0;
        else
            p->unk20[p->unk1e] -= gUnknown_0809104A[p->unk1e];
    }
}
