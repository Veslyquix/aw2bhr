#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0804A68C.
 * sub_0804A68C @ 0x0804A68C
 */

struct Unk030044E0
{
    u8 filler_00[0x2c];
    u8 unk2c[0x31];
    u8 unk5d;
};
extern struct Unk030044E0 * gUnknown_030044E0;

void sub_0804A68C(void)
{
    gUnknown_030044E0->unk2c[gUnknown_030044E0->unk5d] = 0;
}
