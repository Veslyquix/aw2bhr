#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080750A4.
 * sub_080750A4 @ 0x080750A4
 */

struct Unk80750A4
{
    /* 0x00 */ u8 filler_00[0x30];
    /* 0x30 */ s32 unk_30;
    /* 0x34 */ u8 filler_34[0x6];
    /* 0x3a */ u16 unk_3a;
    /* 0x3c */ s32 unk_3c[10];
};

/* GCC reverses the fill, so the descending cursor (`p + 0x60`, `subs #4`) with
 * a counter running 9..0 under `bge` is an ordinary ascending
 * `for (i = 0; i < 10; i++)` over unk_3c[]. Do not mirror the assembly.
 */
void sub_080750A4(struct Unk80750A4 * p)
{
    int i;

    for (i = 0; i < 10; i++)
        p->unk_3c[i] = 0;

    p->unk_30 = 0;
    p->unk_3a = 0;
}
