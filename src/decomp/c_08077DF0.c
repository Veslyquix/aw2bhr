#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08077DF0.
 * sub_08077DF0 @ 0x08077DF0
 */

#include "proc.h"
/* Wave 35 (W35-B). sub_08077690 without the scroll write -- it reads
 * gUnknown_0300064C rather than setting it, which is the only difference. */
struct Unk77DF0Proc
{
    /* 00 */ u8 filler_00[0x44];
    /* 44 */ int unk44;
};

void sub_08077DF0(struct Unk77DF0Proc *proc)
{
    int x;

    sub_08071918(gUnknown_08499578 + 0x80, 0x1E, 7, 0);
    sub_08071918(gUnknown_08499580 + 0x80, 0x1E, 7, 0);
    sub_08013AEC();
    sub_08013B0C();

    x = gUnknown_086145D8[proc->unk44];
    sub_08071900(gUnknown_08551A00, gUnknown_08499578 + (0x9E - x), x, 7);
    sub_08071900(gUnknown_08551A04, gUnknown_08499580 + (0x9E - x), x, 7);

    sub_08077620(0, 0xA8 - gUnknown_0300064C);

    if (++proc->unk44 == 5)
    {
        proc->unk44 = 0;
        Proc_Break(proc);
    }
}
