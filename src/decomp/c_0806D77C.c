#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806D77C.
 * sub_0806D77C @ 0x0806D77C
 */

struct Unk6D77CProc
{
    /* 00 */ u8 filler_00[0x34];
    /* 34 */ int unk34;
    /* 38 */ int unk38;
};

/* MATCHED. Byte-for-byte the same function as sub_08065668 -- identical
 * instruction stream and identical pool words. One C body, two
 * addresses; read that one for the derivation. */
void sub_0806D77C(struct Unk6D77CProc *proc)
{
    if (gUnknown_08580934->unk30 == 0)
    {
        proc->unk34 = 0;
        proc->unk38 = -2;
    }
    else
    {
        proc->unk34 = 0;
        proc->unk38 = 2;
    }
}
