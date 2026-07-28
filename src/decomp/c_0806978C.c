#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806978C.
 * sub_0806978C @ 0x0806978C, sub_080697A4 @ 0x080697A4
 */

#include "proc.h"
/* +0x36 is past the strb displacement limit of 31, hence the `adds r0, #0x36`;
 * that is the immediate range, not an address being taken. */
struct Unk6978CProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x36);
    /* 36 */ u8 unk36;
};
/* The clearing twin of this is sub_0806978C, on the same field of the same
 * proc script. */
struct Unk697A4Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x36);
    /* 36 */ u8 unk36;
};

void sub_0806978C(void)
{
    ((struct Unk6978CProc *)Proc_Find(gUnknown_08581420))->unk36 = 0;
}

void sub_080697A4(void)
{
    ((struct Unk697A4Proc *)Proc_Find(gUnknown_08581420))->unk36 = 1;
}
