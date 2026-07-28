#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080678BC.
 * sub_080678BC @ 0x080678BC, sub_080678D4 @ 0x080678D4
 */

#include "proc.h"
/* Same proc script as sub_080678D4, which writes +0x3c of the same object. */
struct Unk678BCProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3c);
    /* 3c */ u32 unk3c;
    /* 40 */ STRUCT_PAD(0x40, 0x60);
    /* 60 */ u32 unk60;
};
/* Same proc script as sub_080678BC, which writes +0x60 of the same object. */
struct Unk678D4Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x3c);
    /* 3c */ u32 unk3c;
    /* 40 */ STRUCT_PAD(0x40, 0x60);
    /* 60 */ u32 unk60;
};

void sub_080678BC(u32 a)
{
    ((struct Unk678BCProc *)Proc_Find(gUnknown_08580FF4))->unk60 = a;
}

void sub_080678D4(u32 a)
{
    ((struct Unk678D4Proc *)Proc_Find(gUnknown_08580FF4))->unk3c = a;
}
