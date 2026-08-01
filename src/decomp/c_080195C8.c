#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080195C8.
 * sub_080195C8 @ 0x080195C8
 */

/* The object at +0x18 / +0x30 that sub_08019578 also walks; only the two
 * members this function touches are named. */
struct Unk080195C8
{
    /* 0x00 */ u8 filler_00[0x18];
    /* 0x18 */ void *unk18;
    /* 0x1c */ u8 filler_1c[0x14];
    /* 0x30 */ u16 unk30;
};

void sub_080195C8(ProcPtr proc)
{
    struct Unk080195C8 *p = (struct Unk080195C8 *)proc;

    sub_08014A5C(0, 0, p->unk18, 0xc8b, p->unk30, 0);
    sub_08019578(p);
    sub_0803670C();
}
