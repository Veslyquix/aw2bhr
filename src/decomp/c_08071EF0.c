#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08071EF0.
 * sub_08071EF0 @ 0x08071EF0, sub_08071F0C @ 0x08071F0C, sub_08071F28 @ 0x08071F28, sub_08071F40 @ 0x08071F40, sub_08071F58 @ 0x08071F58, sub_08071F70 @ 0x08071F70
 */

#include "proc.h"
struct Unk8613E64Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};
struct Unk8613E84Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};
struct Unk8613EA4Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};
struct Unk8613EC4Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ u16 unk64;
};

void sub_08071EF0(int a)
{
    ((struct Unk8613E64Proc *)Proc_Start(gUnknown_08613E64, PROC_TREE_3))->unk64 = a;
}

void sub_08071F0C(int a)
{
    ((struct Unk8613E84Proc *)Proc_Start(gUnknown_08613E84, PROC_TREE_3))->unk64 = a;
}

void sub_08071F28(int a, ProcPtr parent)
{
    ((struct Unk8613E64Proc *)Proc_StartBlocking(gUnknown_08613E64, parent))->unk64 = a;
}

void sub_08071F40(int a, ProcPtr parent)
{
    ((struct Unk8613E84Proc *)Proc_StartBlocking(gUnknown_08613E84, parent))->unk64 = a;
}

void sub_08071F58(int a, ProcPtr parent)
{
    ((struct Unk8613EA4Proc *)Proc_StartBlocking(gUnknown_08613EA4, parent))->unk64 = a;
}

void sub_08071F70(int a, ProcPtr parent)
{
    ((struct Unk8613EC4Proc *)Proc_StartBlocking(gUnknown_08613EC4, parent))->unk64 = a;
}
