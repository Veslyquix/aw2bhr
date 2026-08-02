#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080647BC.
 * sub_080647BC @ 0x080647BC, sub_0806486C @ 0x0806486C, sub_08064918 @ 0x08064918
 */

void sub_080647BC(struct Unk08580934_Obj *obj)
{
    u8 digits[3];
    int n = 0;

    sub_08063A58((obj->unk48 + 2) * 5, &digits[0], &digits[1], &digits[2]);

    if (digits[1] == 1)
        n = 1;

    sub_0801F34C(digits[1] + 0x55, (obj->unk28 + n) & 0x1FF,
                 (obj->unk2a + 0xC) & 0xFF, 0, 0);
    sub_0801F34C(digits[2] + 0x55, (obj->unk28 + 8) & 0x1FF,
                 (obj->unk2a + 0xC) & 0xFF, 0, 0);
    sub_0801F34C(0x55, (obj->unk28 + 0x10) & 0x1FF,
                 (obj->unk2a + 0xC) & 0xFF, 0, 0);
    sub_0801F34C(0x55, (obj->unk28 + 0x18) & 0x1FF,
                 (obj->unk2a + 0xC) & 0xFF, 0, 0);
}

void sub_0806486C(struct Unk08580934_Obj *obj)
{
    u8 digits[3];
    int n = 0;

    if (obj->unk48 == 0)
    {
        sub_0801F34C(0xCB, (obj->unk28 + 8) & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
    }
    else
    {
        sub_08063A58(obj->unk48 + 4, &digits[0], &digits[1], &digits[2]);

        if (digits[1] == 1)
            n = 1;

        if (digits[1] != 0xFF)
            sub_0801F34C(digits[1] + 0x55, (obj->unk28 + 8 + n) & 0x1FF,
                         (obj->unk2a + 0xC) & 0xFF, 0, 0);

        sub_0801F34C(digits[2] + 0x55, (obj->unk28 + 0x10) & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
    }
}

void sub_08064918(struct Unk08580934_Obj *obj)
{
    u8 digits[3];
    int n = 0;

    if (obj->unk48 == 0)
    {
        sub_0801F34C(0xCB, (obj->unk28 + 8) & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
    }
    else
    {
        sub_08063A58(obj->unk48 + gUnknown_08580934->unk15 - 1,
                     &digits[0], &digits[1], &digits[2]);

        if (digits[1] == 1)
            n = 1;

        if (digits[1] != 0xFF)
            sub_0801F34C(digits[1] + 0x55, (obj->unk28 + 8 + n) & 0x1FF,
                         (obj->unk2a + 0xC) & 0xFF, 0, 0);

        sub_0801F34C(digits[2] + 0x55, (obj->unk28 + 0x10) & 0x1FF,
                     (obj->unk2a + 0xC) & 0xFF, 0, 0);
    }
}
