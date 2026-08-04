#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080323D4.
 * sub_080323D4 @ 0x080323D4
 */

#include "proc.h"
/* Scans the four army slots downwards and parks the cursor on the LAST live one
 * (3..0, so the lowest-numbered live slot wins), then clears the proc's counter.
 *
 * `i` is a plain int: the s8 conversion `lsls #0x18; asrs #0x18` in front of
 * sub_0802F460 is that callee's declared s8 parameter, not a cast in the source
 * (same reading as sub_0802F504/sub_0802F534's own loops), and the
 * gUnknown_0300449C index needs no shift at all. */

struct Unk080323D4Proc /* >= 0x5c */
{
    /* 0x00 */ u8 filler_00[0x58];
    /* 0x58 */ u32 unk58;
};

void sub_080323D4(struct Unk080323D4Proc *proc)
{
    int i;

    gUnknown_0849B060->unk0a = 0;

    for (i = 3; i >= 0; i--)
    {
        if (sub_0802F460(i) && gUnknown_0300449C[i] != 0)
        {
            gUnknown_0849B060->unk06 = i;
            gUnknown_0849B060->unk04 = i;
        }
    }

    proc->unk58 = 0;
}
