#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803D9FC.
 * sub_0803D9FC @ 0x0803D9FC
 */

#include "hardware.h"
/* MATCHED, wave 55 (W55-E), two attempts. A debug CO/army editor page.
 *
 * PROMOTION REQUIRES THE WHOLE .rodata BLOB PLACED -- 105 words,
 * 0x08091154 through 0x080912F4 inclusive, contiguous. Run
 * `python tools/trymatch.py sub_0803D9FC --diff` and paste the "rodata": [...]
 * list it prints into this function's data/promoted.json entry, then re-run
 * tools/split_rodata.py and tools/gen_lds.py before building. trymatch reports
 * `relocs: name different symbols that resolve to the same address`, which is
 * the match verdict, not a defect.
 *
 * THE ONE THING THAT COST AN ATTEMPT: the switch selector. The ROM does
 * `ldrh r0,[r7,#0x20]; subs r0,#1; lsls r0,#0x10; asrs r0,#0x10` -- an
 * UNSIGNED halfword load followed by a sign-extend of the DIFFERENCE. Plain
 * `switch (proc->unk20 - 1)` on an `s16` field gives `ldrsh` and no shift pair.
 * The `(s16)` cast on the whole subtraction is what produces both halves: the
 * narrowing lets GCC shorten the load to `ldrh` (only the low 16 bits survive)
 * and forces the explicit re-widening afterwards. Note this does NOT contradict
 * the field being `s16` -- the two cursor tests above load the same field both
 * ways in one statement (`ldrh` for the value that is stored back, `ldrsh` for
 * the comparison), which is exactly what an `s16` produces.
 *
 * See NOTES.md beside this file for how every symbol was resolved; the short
 * version:
 *
 *  - NONE of the nine gUnknown_080912xx "globals" are globals. They are STRING
 *    LITERALS, and the four gUnknown_080911xx are tables of them. All verified
 *    against baserom.gba. Nothing here is declared in include/unknown-globals.h
 *    and nothing should be.
 *  - gUnknown_080912E8/EC/F0/F4 ARE -fforce-addr words, holding 0x03003FC0,
 *    0x08499598, 0x03004080 and 0x03002EE0. The honest spelling names the real
 *    object and agbcc rebuilds the extra indirection itself.
 *  - 0x03002EE0 is `gpKeySt`, NOT an unnamed global. include/unknown-globals.h
 *    records that wave 20 invented a `gUnknown_03002EE0` for it and the SPLIT
 *    build caught it. Checked before writing, deliberately.
 *  - sub_0803D990 was already promoted (src/decomp/c_0803D990.c); its prototype
 *    was copied from the definition, not guessed from the call sites.
 *
 * The parameter is modelled as a plain struct rather than a PROC: the two
 * fields live at +0x1e and +0x20, which is INSIDE this tree's PROC_HEADER
 * (0x00..0x28), so it is not a proc in the c_08073E0C sense. Byte-neutral here
 * either way; flagging it because I could not prove it. */

struct Unk3D9FC
{
    /* 0x00 */ u8 filler_00[0x1E];
    /* 0x1E */ s16 unk1E;
    /* 0x20 */ s16 unk20;
};
static const char *const sOnOff[] = { "OFF", "ON" };
static const char *const sColors[] = {
    "NEUT", "RED", "BLUE", "GREEN", "YELLOW", "BLACK"
};
static const char *const sCtrl[] = { "NON", "HUMAN", "COM" };
static const char *const sCoNames[] = {
    "CATH", "RYO", "MAX", "WHIP", "DOMI", "BILY", "KIKU", "ASKA", "EAGL",
    "MOP", "HELL", "KONG", "CAT", "SNAK", "HAWK", "HACH", "EWAN", "HANA",
    "YAMA"
};

void sub_0803D9FC(struct Unk3D9FC *proc)
{
    int delta;
    u8 army;

    delta = 0;
    army = proc->unk1E;

    sub_080119A0(8, 0x00, "FORCE   /");
    sub_080119A0(8, 0x08, "PLAY");
    sub_080119A0(8, 0x10, "MONEY");
    sub_080119A0(8, 0x18, "BREAK");
    sub_080119A0(8, 0x20, "SYOGUN");
    sub_080119A0(8, 0x28, "TEAM");
    sub_080119A0(8, 0x30, "SAKU");
    sub_080119A0(8, 0x38, "TURN");
    sub_080119A0(8, 0x40, "COLOR");

    sub_0802BD54(0x50, 0x00, sub_0802490C(gUnknown_03003FC0.unk02));
    sub_0802BD54(0x40, 0x00, proc->unk1E);
    sub_080119A0(0x40, 0x08, sCtrl[gUnknown_08499598[army].unk1b]);
    sub_0802BD54(0x68, 0x10, gUnknown_08499598[army].unk00);
    sub_0802BD54(0x68, 0x18, gUnknown_08499598[army].unk20);
    sub_080119A0(0x40, 0x20, sCoNames[gUnknown_08499598[army].unk1d]);
    sub_0802BD54(0x68, 0x28, gUnknown_08499598[army].unk2a);
    sub_080119A0(0x50, 0x30, sOnOff[gUnknown_03003FC0.unk0d]);
    sub_0802BD54(0x40, 0x38, gUnknown_03004080);
    sub_080119A0(0x40, 0x40, sColors[gUnknown_08499598[army].unk1a]);
    sub_080119A0(0, proc->unk20 * 8, "/");

    if (gpKeySt->held & 0x100)
    {
        do
        {
            proc->unk1E++;

            if (proc->unk1E > 4)
                proc->unk1E = 1;
        } while (gUnknown_08499598[proc->unk1E].unk1b == 0);
    }

    if (gpKeySt->held & 0x200)
    {
        do
        {
            proc->unk1E--;

            if (proc->unk1E <= 0)
                proc->unk1E = 4;
        } while (gUnknown_08499598[proc->unk1E].unk1b == 0);
    }

    if (gpKeySt->unk02 & 0x40)
    {
        if (proc->unk20 > 1)
            proc->unk20--;
    }

    if (gpKeySt->unk02 & 0x80)
    {
        if (proc->unk20 <= 6)
            proc->unk20++;
    }

    if (gpKeySt->unk02 & 0x20)
        delta = 0xFF;

    if (gpKeySt->unk02 & 0x10)
        delta = 1;

    if (gpKeySt->unk02 & 0x30)
    {
        switch ((s16)(proc->unk20 - 1))
        {
        case 0:
            gUnknown_08499598[army].unk1b =
                sub_0803D990(gUnknown_08499598[army].unk1b, (s8)delta, 1, 2, 1);
            break;

        case 1:
            gUnknown_08499598[army].unk00 =
                sub_0803D990(gUnknown_08499598[army].unk00,
                             (s8)delta * 0xC350, 0, 0xF423F, 0);
            break;

        case 2:
            gUnknown_08499598[army].unk20 =
                sub_0803D990(gUnknown_08499598[army].unk20,
                             (s8)delta * 0x2710, 0, sub_08044208(army), 0);
            break;

        case 3:
            gUnknown_08499598[army].unk1d =
                sub_0803D990(gUnknown_08499598[army].unk1d, (s8)delta, 0, 0x12, 1);
            break;

        case 4:
            gUnknown_08499598[army].unk2a =
                sub_0803D990(gUnknown_08499598[army].unk2a, (s8)delta, 0, 3, 0);
            break;

        case 5:
            gUnknown_03003FC0.unk0d =
                sub_0803D990(gUnknown_03003FC0.unk0d, (s8)delta, 0, 1, 1);
            break;

        case 6:
            gUnknown_03004080 =
                sub_0803D990(gUnknown_03004080, (s8)delta, 0, 0x3E7, 1);
            break;
        }
    }

    if (gpKeySt->held & 3)
    {
        sub_08026B28();
        sub_08015C30(gUnknown_03001FBC);
    }
}
