#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015FE4.
 * sub_08015FE4 @ 0x08015FE4, sub_08016010 @ 0x08016010, sub_0801603C @ 0x0801603C, sub_08016068 @ 0x08016068, sub_08016094 @ 0x08016094
 */

/* One command of the gUnknown_03001470[a].unk04 script stream: the halfword at
 * +4 of the current 8-byte command is the argument, and the cursor then steps
 * one command forward. Same shape as sub_08015DA0 next door, which reads the
 * same halfword into .unk10.
 */
bool8 sub_08015FE4(u8 a)
{
    sub_08011550(((const u16 *)gUnknown_03001470[a].unk04)[2]);
    gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    return FALSE;
}

/* One command of the gUnknown_03001470[a].unk04 script stream: the halfword at
 * +4 of the current 8-byte command is the argument, and the cursor then steps
 * one command forward. Same shape as sub_08015DA0 next door, which reads the
 * same halfword into .unk10.
 */
bool8 sub_08016010(u8 a)
{
    sub_0801156C(((const u16 *)gUnknown_03001470[a].unk04)[2]);
    gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    return FALSE;
}

/* One command of the gUnknown_03001470[a].unk04 script stream: the halfword at
 * +4 of the current 8-byte command is the argument, and the cursor then steps
 * one command forward. Same shape as sub_08015DA0 next door, which reads the
 * same halfword into .unk10.
 */
bool8 sub_0801603C(u8 a)
{
    sub_08011588(((const u16 *)gUnknown_03001470[a].unk04)[2]);
    gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    return FALSE;
}

/* One command of the gUnknown_03001470[a].unk04 script stream: the halfword at
 * +4 of the current 8-byte command is the argument, and the cursor then steps
 * one command forward. Same shape as sub_08015DA0 next door, which reads the
 * same halfword into .unk10.
 */
bool8 sub_08016068(u8 a)
{
    sub_080115B4(((const u16 *)gUnknown_03001470[a].unk04)[2]);
    gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    return FALSE;
}

/* The conditional twin of sub_080160DC: gUnknown_03002F1C is a one-shot flag
 * that turns the next command into a JUMP -- when it is set, the flag is
 * cleared and the cursor is replaced by the word the current command points
 * at, instead of stepping the usual 8 bytes forward.
 */
bool8 sub_08016094(u8 a)
{
    if (gUnknown_03002F1C == 0)
    {
        gUnknown_03001470[a].unk04 = (const u32 *)gUnknown_03001470[a].unk04 + 2;
    }
    else
    {
        gUnknown_03002F1C = 0;
        gUnknown_03001470[a].unk04 = *(const void *const *)gUnknown_03001470[a].unk04;
    }

    return TRUE;
}
