#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080433F8.
 * sub_080433F8 @ 0x080433F8
 */

struct Unk085D5ABC
{
    /* 0x00 */ u8 filler_00[0x1E];
    /* 0x1E */ u8 unk1E[2][0x1A];
    /* 0x52 */ u8 filler_52[10];
};
extern const struct Unk085D5ABC gUnknown_085D5ABC[];

int sub_080433F8(int a, int b, int c)
{
    return gUnknown_085D5ABC[a].unk1E[c][b];
}
