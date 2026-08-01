#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08069B6C.
 * sub_08069B6C @ 0x08069B6C
 */

/* sub_080688A8 with one extra call. Diffed against it rather than assumed: the
 * arming line is identical, and the trailing sub_08012358 is the only
 * difference. Its result is discarded and the epilogue is pop {r0}; bx r0, so
 * this is void and not a tail forward. */
struct Unk69B6CProc
{
    /* 00 */ u8 filler_00[0x2c];
    /* 2C */ int unk2c;
};

void sub_08069B6C(struct Unk69B6CProc *proc)
{
    proc->unk2c = sub_080674F4(gUnknown_0202F204++);
    sub_08012358();
}
