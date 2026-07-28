#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08041180.
 * sub_08041180 @ 0x08041180
 */

#include "proc.h"
/* The parameter is some other object, not the proc: only its byte at +0x48 is
 * read, and the runtime `adds r4, #0x48` is just the THUMB ldrb displacement
 * limit rather than an address being taken.
 */
struct Unk41180Src
{
    /* 00 */ u8 filler_00[0x48];
    /* 48 */ u8 unk48;
};
struct Unk41180Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x40);
    /* 40 */ u16 unk40;
};

/* The destination address is expanded before the value, which is why the
 * `bl Proc_Find` comes first and the parameter has to survive it in r4.
 */
void sub_08041180(struct Unk41180Src *a)
{
    ((struct Unk41180Proc *)Proc_Find(gUnknown_0849FD44))->unk40 = (a->unk48 - 0x14) * 2;
}
