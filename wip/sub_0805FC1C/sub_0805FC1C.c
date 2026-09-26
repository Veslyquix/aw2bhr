/* WAVE 86 (W86-F): NO CHANGE, NO PROBE. Details in
 * work/sub_0805FC1C/W86-notes.md. Twin sub_0805A008 (in the multi-function unit
 * src/decomp/c_08059F24.c, matched) is a SAME-VOCABULARY NEIGHBOUR: it shares
 * gUnknown_08499594, gUnknown_08499590 with its +0x417a row plane,
 * gUnknown_03003340 and gUnknown_03003F2C, but it is a nested x/y scan writing
 * an output list, not a single scan with a switch, and it NEVER REFERENCES
 * gUnknown_085D5ABC OR gUnknown_085D5AD0 -- which is this park's entire
 * residual. Nothing to transplant.
 *
 * One corroboration it does give: the twin binds `q = gUnknown_08499590` INSIDE
 * its loop body and derives both planes from it, and it matches that way -- so
 * its ROM does not hoist that base either. That supports rule 3 below (the
 * W50-L bind is folded away by cse). Independently replicated a third time this
 * wave on sub_080790D0, where binding a loop-invariant address to its own
 * outer-loop variable was byte-identical. The bind lever is dead on this axis. */
/* Wave 55, W55-C, re-verified and re-diagnosed by W55-F. NOT MATCHED:
 * candidate is +8 bytes. The score is POSITIONAL and worthless here; every
 * expression form below is confirmed against the ROM.
 *
 * THE WHOLE RESIDUAL IS ONE MISSING LICM HOIST, and it is NOT a data-spelling
 * problem. The ROM's loop preheader -- after the entry guard and before the
 * strength-reduced giv init, so an LICM hoist by position -- is
 *      ldr r0, =gUnknown_085D5AD0 ; mov sl, r0
 * and the body then reaches the class table with `add r0, sl` (1 insn). This
 * draft rematerialises it as `ldr r7,[pc,#88] ; adds r0,r0,r7` (2 insns).
 * That single difference cascades into everything else:
 *   +2 B  the loop counter is pushed out of r7 into ip, so the increment is
 *         `movs r1,#1 ; add ip,r1` instead of `adds r7,#1`;
 *   +2 B  the class-table base is a pool load rather than `add r0, sl`;
 *   +4 B  rec->unk02 splits across r6 AND r9 (the ROM keeps it only in ip), so
 *         the two `return` blocks stop being identical and cross-jumping merges
 *         only their TAIL instead of the whole block.
 * None of that is a control-flow or type error. It is one allocation fact.
 * The ROM's pool order proves the hoist: gUnknown_085D5AD0 is the SECOND word,
 * ahead of gUnknown_08499594, which is referenced by the body's very first
 * statement -- only a preheader reference can get in front of it.
 *
 * THE RELOC LINES ARE NOT DEFECTS. `b0: original gUnknown_0816DAC0 / candidate
 * .rodata` is agbcc's own -fforce-addr word for &gUnknown_03003F2C (the loop's
 * first reference; the loop-BOTTOM reference names the symbol directly, and the
 * honest spelling reproduces both). Promotion would need
 * "rodata": ["0x0816DAC0"]. gUnknown_085D5AD0 is &gUnknown_085D5ABC[0].unk14 --
 * the same address the candidate spells as gUnknown_085D5ABC+0x14, NOT a
 * separate object.
 *
 * FOUR THINGS RULED OUT BY W55-F, each with its measurement:
 *  1. DECLARING gUnknown_085D5AD0 as a separate global -- a 0x5c-stride struct
 *     whose first member is the u8 * at offset 0, so the base needs no
 *     displacement -- produces a BYTE-IDENTICAL instruction stream. Only the
 *     pool word's symbol+addend changes, and it is STILL not hoisted. Symbol
 *     spelling has no effect on LICM whatsoever. Do not declare it;
 *     include/unknown-globals.h's gUnknown_081D9328 note is the precedent.
 *  2. SPLITTING `e` into two locals (the wave-17 "binding locals are
 *     punctuation" lever) makes it WORSE -- it adds a second
 *     `ldr r2,[pc,#136]` at the top of the loop body.
 *  3. BINDING THE BASE AS THE FIRST STATEMENT OF THE LOOP BODY -- the wave-50
 *     W50-L lever, `cls = (u8 *)gUnknown_085D5ABC + 0x14;` then
 *     `tbl = *(u8 **)(cls + rec->unk00 * 0x5c)` -- compiles byte-for-byte
 *     identically to this draft. CSE folds the bind away completely, so W50-L
 *     does NOT transfer from a pointer global's LOAD to an ADDRESS CONSTANT.
 *  4. decomp-permuter, 300 s from best.c: nothing matched, best stayed 69.2%.
 *  5. Wave 63 duplicated the honest `gUnknown_085D5ABC[rec->unk00].unk14`
 *     expression at both use sites. CSE merged the pointer load, but the base
 *     address still remained in the loop body; duplication did not raise the
 *     single address pseudo's LICM savings.
 * The lever, if one exists, is whatever tips agbcc's loop.c into hoisting a
 * SINGLE-USE address constant. Nothing in this draft's source order reaches it.
 *
 * What IS settled and reusable:
 *  - `e = tbl + K; e[i]` (a BOUND POINTER LOCAL, and ONE local reused for both
 *    bindings -- see rule 2 above) is what produces the ROM's
 *    `adds r0,r5,#K; adds r0,r0,ri; ldrb r0,[r0]`. Spelling it inline as
 *    tbl[K + i] or *(tbl + K + i) both reassociate to `adds; ldrb [r0,#K]`.
 *  - the +0x1432 plane is an ordinary struct member (K > 31 cannot fold into an
 *    ldrb displacement), so the two spellings coexist in one statement.
 *  - `cmp #0x14/beq; cmp #0x14/bgt; cmp #7/beq; b` is the ROM's switch on
 *    rec->unk00, and this draft reproduces it exactly.
 */
#include "global.h"

struct Unk5FC1CMap
{
    /* 0x0000 */ u8 filler_00[0x1432];
    /* 0x1432 */ u8 terrain[0x417a - 0x1432];
    /* 0x417a */ u16 rows[1];
};

void sub_0805FC1C(int a1, void *a2)
{
    int i;
    int t;
    struct Unk08499594 *rec;
    struct Unk030040D8 *p;
    u8 *tbl;
    u8 *e;

    for (i = gUnknown_03003F2C; i < gUnknown_03003F2C + 0x40; i++)
    {
        rec = &gUnknown_08499594[i];
        if (rec->unk00 == 0)
            continue;
        if (rec->unk01 & 8)
            continue;
        if ((s8)gUnknown_03003340[rec->unk03][rec->unk02] < 0)
            continue;
        tbl = gUnknown_085D5ABC[rec->unk00].unk14;
        p = gUnknown_030040D8;
        e = tbl + 1;
        if (e[p->unk00] == 0)
            continue;
        t = ((struct Unk5FC1CMap *)gUnknown_08499590)->terrain[
                ((struct Unk5FC1CMap *)gUnknown_08499590)->rows[rec->unk03]
                + rec->unk02] & 0x1f;
        e = tbl + 0x1a;
        if (e[t] == 0)
            continue;

        switch (rec->unk00)
        {
        case 7:
        case 0x14:
            if ((rec->unk09 & 0xc0) == 0 && rec->unk07 == 0)
            {
                ((union Unk802C57CBuf *)a2)->pos.unk00 = rec->unk02;
                ((union Unk802C57CBuf *)a2)->pos.unk02 = rec->unk03;
                return;
            }
            rec->unk09 = (rec->unk09 & 0x3f) | 0x40;
            break;
        case 0x17:
            if ((p->unk07[2] & 0x38) != 0x18)
                continue;
            if ((rec->unk09 & 0xc0) != 0x80 && rec->unk08 == 0)
            {
                ((union Unk802C57CBuf *)a2)->pos.unk00 = rec->unk02;
                ((union Unk802C57CBuf *)a2)->pos.unk02 = rec->unk03;
                return;
            }
            rec->unk09 = (rec->unk09 & 0x3f) | 0x80;
            break;
        }
    }
}




