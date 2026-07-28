#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080184E0.
 * sub_080184E0 @ 0x080184E0
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080184E0.
 * sub_080184E0 @ 0x080184E0
 */

struct Unk80184D8
{
    /* 0x00 */ u8 filler_00[0x08];
    /* 0x08 */ void (*unk08)(struct Unk80184D8 *);
};
void sub_080184D8(struct Unk80184D8 *s);

void sub_080184E0(struct Unk80184D8 *s)
{
    s->unk08 = sub_080184D8;
}
