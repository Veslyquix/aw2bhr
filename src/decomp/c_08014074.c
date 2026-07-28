#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014074.
 * sub_08014074 @ 0x08014074
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014074.
 * sub_08014074 @ 0x08014074
 */

struct Unk08014074
{
    /* 0x00 */ u8 filler_00[0x39];
    /* 0x39 */ s8 unk39;
    /* 0x3a */ s8 unk3a;
};

void sub_08014074(struct Unk08014074 *s)
{
    s->unk3a = 0;
    s->unk39 = -2;
}
