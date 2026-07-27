#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080308B4.
 * sub_080308B4 @ 0x080308B4
 */

struct Unk08090CD8Entry
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u16 unk02;
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u8 unk06[20];
    /* 0x1A */ u8 filler_1A[0x88 - 0x1A];
};
struct Unk08090CD8Buf
{
    /* 0x0000 */ u8 filler_00[6];
    /* 0x0006 */ u8 unk06;
    /* 0x0007 */ u8 filler_07[0x20 - 0x07];
    /* 0x0020 */ volatile u16 unk20;
    /* 0x0022 */ u8 filler_22[0x12C - 0x22];
    /* 0x012C */ struct Unk08090CD8Entry unk12C[48];
    /* 0x1AAC */ u8 filler_1AAC[1];
    /* 0x1AAD */ volatile u8 unk1AAD;
};
struct Unk08090CD8
{
    /* 0x00 */ struct Unk08090CD8Buf *unk00;
};
extern struct Unk08090CD8 *const gUnknown_08090CD8;

void sub_080308B4(u8 *src)
{
    struct Unk08090CD8 *const *pp;
    struct Unk08090CD8 *ctrl;
    struct Unk08090CD8Buf *buf;
    struct Unk08090CD8Entry *entry;
    u8 i;

    entry = &gUnknown_08090CD8->unk00->unk12C[gUnknown_08090CD8->unk00->unk1AAD];
    pp = &gUnknown_08090CD8;
    entry->unk00 = 0xAF;
    entry->unk01 = gUnknown_08090CD8->unk00->unk06;
    buf = gUnknown_08090CD8->unk00;
    entry->unk02 = buf->unk20;
    entry->unk04 = 20;
    buf->unk20++;

    for (i = 0; i < 20; i++)
        entry->unk06[i] = src[i];

    ctrl = *pp;
    ctrl->unk00->unk1AAD++;
    ctrl->unk00->unk1AAD &= 0x1F;
}
