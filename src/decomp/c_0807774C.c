#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807774C.
 * sub_0807774C @ 0x0807774C
 */

/* An eight-argument text call followed by the scroll update sub_08077C70 also
 * makes. Four of the arguments go on the stack, which is what `sub sp, #0x10`
 * pays for, and 0xFFFF needs a pool word of its own.
 *
 * Only one of the eight is not a literal -- proc->unk30, a `ldrh` -- so this
 * call site constrains sub_08077214's parameter widths not at all. */
struct Unk7774CProc
{
    /* 00 */ u8 filler_00[0x30];
    /* 30 */ u16 unk30;
};

void sub_0807774C(struct Unk7774CProc *proc)
{
    sub_08077214(gUnknown_08499578, 8, 6, 0x16, 4, 0xFFFF, proc->unk30, 1);
    sub_08077620(0, 0xA8 - gUnknown_0300064C);
}
