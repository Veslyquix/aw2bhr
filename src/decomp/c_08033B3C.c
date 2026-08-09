#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08033B3C.
 * sub_08033B3C @ 0x08033B3C
 */

#include "proc.h"
/* MATCHED byte-for-byte, wave 50 (W50-J).
 *
 * Same proc as the promoted c_08033EC8.c pair (unk30[3] cursor bytes, unk36
 * cursor, unk38[3] x-coords, unk4c timer); this function names three more
 * fields the exemplar left as filler -- unk33[3], unk3e and the int unk40[3].
 *
 * THE RESET LOOP IS A CHAINED ASSIGNMENT, `proc->unk30[i] = proc->unk33[i] =
 * 0;`, and that is the one non-obvious fact here. Written as two statements
 * the addresses interleave with their stores (compute, strb, compute, strb);
 * the ROM computes BOTH addresses and then stores in the reverse order
 * (`adds r1,r5,r6; adds r0,r4,r6; strb [r0]; strb [r1]`), which is exactly
 * expand_assignment evaluating the OUTER lvalue's address before expanding
 * the inner assignment. The two spellings also allocate registers
 * differently -- the ROM's `mov r5, r8` copy of &unk30 only appears for the
 * chain -- so this is not a cosmetic choice.
 *
 * The first Interpolate's result really is DISCARDED: r0 is overwritten by
 * `movs r6,#0` on the next instruction with no intervening store.
 *
 * `t` is clamped with an if, not a `?:`; `movs r3,#0x10` being hoisted above
 * the switch is agbcc scheduling the constant, not a source-order signal.
 *
 * `((const u16 *)gUnknown_0849BC38)[i]` is a cast AT THIS USE, the same model
 * c_08033F1C.c uses -- see that object's note in unknown-globals.h; widening
 * the declaration would regress c_08033FFC.c. PutSpriteExt's third parameter
 * is `u32`, so the `ldrh` needs no `& 0xff` here.
 *
 * `stm r3!, {r2}` for `proc->unk40[i] = 0` is strength_reduce turning the
 * address into an auto-incrementing giv; it must not be authored. */

struct Unk33B3CProc
{
    /* 0x00 */ u8 filler_00[0x30];
    /* 0x30 */ u8 unk30[0x03];
    /* 0x33 */ u8 unk33[0x03];
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 filler_37[0x01];
    /* 0x38 */ u16 unk38[0x03];
    /* 0x3e */ u16 unk3e;
    /* 0x40 */ int unk40[0x03];
    /* 0x4c */ u32 unk4c;
};

void sub_08033B3C(struct Unk33B3CProc *proc)
{
    int i;
    int t;

    t = 0x10;

    switch (proc->unk4c)
    {
    case 4:
        proc->unk40[0] = 0;
        break;
    case 8:
        proc->unk40[1] = 0;
        break;
    case 12:
        proc->unk40[2] = 0;
        break;
    }

    if (proc->unk4c <= 0x10)
        t = proc->unk4c;

    Interpolate(0, -0x40, 0x38, t, 0x10);

    for (i = 0; i < 3; i++)
    {
        proc->unk38[i] = 0xf0;

        if (proc->unk40[i] > 0x10)
        {
            proc->unk38[i] = 0x60;
        }
        else if (proc->unk40[i] != -1)
        {
            proc->unk38[i] = Interpolate(5, 0xf0, 0x60, proc->unk40[i], 0x10);
            proc->unk40[i]++;
        }

        PutSpriteExt(0, proc->unk38[i] & 0x1ff,
                     ((const u16 *)gUnknown_0849BC38)[i],
                     gUnknown_0849BC24[i], (i + 1) << 12);
    }

    proc->unk4c++;

    if (proc->unk4c > 0x1c)
    {
        proc->unk4c = 0;

        for (i = 0; i < 3; i++)
        {
            proc->unk30[i] = proc->unk33[i] = 0;
            proc->unk40[i] = 0;
        }

        proc->unk30[proc->unk36] = 1;
        proc->unk3e = 0x100;
        Proc_Break(proc);
    }
}
