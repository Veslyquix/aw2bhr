#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080111C8.
 * sub_080111C8 @ 0x080111C8
 */

#include "proc.h"
/* gUnknown_03001FDC IS DELIBERATELY DECLARED HERE AND NOT IN
 * include/unknown-globals.h. Wave 32 put it in the shared header and broke the
 * SPLIT=1 ROM: src/proc.c defines it as `s32 IWRAM_DATA gUnknown_03001FDC;`,
 * a tentative definition carrying a section attribute, and src/proc.c includes
 * that header -- so the plain extern was seen FIRST and agbcc dropped the
 * attribute, moving the symbol out of 0x03001FDC. The note in
 * unknown-globals.h concluded "leave the function unpromoted".
 *
 * It does not have to be. A translation-unit-local extern reaches only THIS
 * file; src/proc.c does not include src/decomp/*.c, so its tentative
 * definition still sees no prior declaration and keeps its section. That is
 * the whole of the wave-32 hazard, and it is confined to the shared header.
 * NOT verified by a SPLIT=1 build here (per-function trymatch cannot link
 * proc.o) -- the reasoning is the evidence, so re-check the ROM SHA the first
 * time this file is promoted. */
extern s32 gUnknown_03001FDC;
struct Unk80111C8Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ void *unk2c;
    /* 0x30 */ void *unk30;
    /* 0x34 */ u16 unk34;
    /* 0x36 */ u16 unk36;
    /* 0x38 */ void (*unk38)(void);
};

void sub_080111C8(void *a, void *b, u16 c, u16 d, void (*e)(void))
{
    struct Unk80111C8Proc *proc;

    gUnknown_03001FDC = 0;
    proc = Proc_Start(gUnknown_0848927C, NULL);
    proc->unk2c = a;
    proc->unk30 = b;
    proc->unk34 = c;
    proc->unk36 = d;
    proc->unk38 = e;
    gUnknown_03001FDC = 1;
}
