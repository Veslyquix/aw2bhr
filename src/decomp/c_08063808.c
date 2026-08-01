#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063808.
 * sub_08063808 @ 0x08063808
 */

struct Unk8063808
{
    /* 0x00 */ int unk00;
    /* 0x04 */ int unk04;
    /* 0x08 */ int unk08;
    /* 0x0c */ u8 filler_0c[0x04];
    /* 0x10 */ u16 unk10;
};

/* A leaf initialiser -- no frame at all, so `bx lr` rather than `pop {r0}`. */
void sub_08063808(struct Unk8063808 *p, int a2)
{
    p->unk00 = a2;
    p->unk04 = a2;
    p->unk08 = 0;
    p->unk10 = 0;
}
