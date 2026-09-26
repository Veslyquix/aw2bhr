#include "global.h"

/* PARKED, wave 59 (W59-A). 232 bytes; this draft is 224 (-8), 25.9%.
 * TWO OF THE THREE RESIDUALS ARE NOW SOLVED. Only the FIRST LOOP is left.
 *
 * ================= SOLVED THIS WAVE: the dead computation =================
 * The ROM's dead `(s8)p->unk36 + i` inside the second loop (12 bytes) is kept
 * by a loop whose body is dead. Full write-up in
 * work/sub_080079B8/sub_080079B8.c, which MATCHED with the same vehicle, and in
 * docs/agbcc-codegen.md ("A dead computation that the ROM emits").
 *
 * ONE TRAP, and it is why the comparand here is 1 and not 0. Thumb has
 * `cmn rn, rm` but no `cmn rn, #imm`. This function's addend is a REGISTER
 * (`adds r0,r0,r3`), so with `while (m == 0)` combine folds the add and the
 * compare into a single destination-less `cmn`, and the add is then deleted
 * along with the branch -- measured: the ldrb/lsls/asrs survive and
 * `adds r0,r0,r3` does not. Any NON-zero comparand that still fits `cmp #imm8`
 * keeps them apart; the `cmp` dies with the branch and the `adds` survives with
 * its destination. `== 1` and `== 5` are byte-identical. sub_080079B8 is the
 * mirror image: its addends are immediates, so it REQUIRES `== 0`.
 *
 * ================= SOLVED THIS WAVE: the switch case order =================
 * The ROM emits the five case bodies as movs #4, #3, #2, #1, #0 in ADDRESS
 * order. gcc lays case bodies out in SOURCE order, so the original listed them
 * DESCENDING BY RESULT -- `case 8, case 6, case 14, case 10, case 11` -- not
 * ascending by case label. The jump table is identical either way (it is
 * indexed, not ordered), so this is invisible until you read the block layout.
 * It also moves the whole second loop's register assignment.
 *
 * ================= RESIDUAL 1 (OPEN): the first loop ======================
 * The ROM's first loop keeps `i` as a real ascending biv 9..13 and reduces ONLY
 * `gUnknown_0200B224[i]`, recomputing the gUnknown_084887AC index from i every
 * iteration:
 *   adds r0,r3,#0 ; subs r0,#9 ; lsls r1,r0,#2 ; adds r1,r1,r0 ; lsls r1,r1,#1
 *   adds r1,r1,r5 ; lsls r0,r1,#1 ; adds r0,r0,r4 ; ldrh ; strh [r2]
 *   adds r1,#1 ; lsls r1,r1,#1 ; adds r1,r1,r4 ; ldrh ; strh [r2,#2]
 *   adds r2,#4 ; adds r3,#1 ; cmp r3,#13 ; ble
 * Every spelling tried instead builds TWO givs off gUnknown_084887AC
 * (`adds r2,#0xa`, `adds r1,#0x14`), which removes i's last body use, lets
 * check_dbra_loop reverse the loop to `movs r4,#4; subs; cmp #0; bge`, and then
 * rematerialises `movs r4,#14` after it.
 *
 * RULED OUT, waves 52/57: `for (i = 9; i <= 13; i++)` with the index written
 * out (this draft); the same with an explicit `q++` pointer for the
 * gUnknown_0200B224 side; `q = &gUnknown_0200B224[9]` (becomes a .rodata word
 * base+0x24 where the ROM has `ldr; adds; adds`); a two-biv form
 * `j = 0; ... [j*10 + a2*2]; j++` (gcc eliminates i instead and the output is
 * byte-identical to this draft).
 *
 * RULED OUT, wave 59, and it was the best remaining theory: LOOP SIZE IS NOT
 * THE LEVER. `flow` runs after `loop`, so dead code in the loop body would be
 * present at strength_reduce time -- raising `insn_count`, which suppresses giv
 * reduction -- and would then vanish without trace, a mechanism that would be
 * invisible in the ROM. Measured with compile_probe: a dead `z = p->unk3a + i;`
 * a dead `z = gUnknown_084887AC[i] + a1;` and even a genuinely LIVE extra store
 * (`gUnknown_0200B0B0->unk2e = a2;` inside the loop, three real insns) ALL
 * still reduce both givs and still reverse the loop. insn_count is not the axis;
 * do not spend another wave on loop-body volume.
 *
 * WHAT IS LEFT. The register differences everywhere else in the diff (i in r4
 * rather than r3, the second loop's counter and pointer swapped, the
 * `movs r5,#4` / giv-init order in the second preheader) are ALL downstream of
 * this one decision -- the reversal leaks `movs r4,#14` and shifts every
 * allocno number after it. Do not chase them separately; they come back on
 * their own when the first loop is right.
 *
 * SETTLED, do not re-derive: `i` is ONE variable across the whole function (the
 * first loop leaves it at 14 and the switch's DEFAULT path uses that value);
 * the switch is on `a1 & 0x1F` dispatched through a jump table over 6..14
 * (`subs #6; cmp #8; bhi`), byte-exact; the second loop's five iterations come
 * out as `movs r5,#4; subs; cmp #0; bge` from an ASCENDING `for (k = 0; k < 5;
 * k++)`; gUnknown_0200B0B0 is re-dereferenced INSIDE the second loop each
 * iteration because the gUnknown_0200B0D0 store may alias it -- binding `p` in
 * the loop BODY (as below) is the correct scope and gives the ROM's
 * `ldr r2,[r7]`; gUnknown_084887AC is indexed flat in halfword units,
 * `row*10 + col*2` and `+1`; `gUnknown_0200B0B0->unk2e = a2;` compiles to
 * `ldr; ldr; adds #0x2e; strb` because 0x2e exceeds strb's 5-bit displacement.
 */

void sub_080077EC(int a1, int a2)
{
    int i, k;
    int idx;

    gUnknown_0200B0B0->unk2e = a2;
    for (i = 9; i <= 13; i++)
    {
        gUnknown_0200B224[i].unk00 = gUnknown_084887AC[(i - 9) * 10 + a2 * 2];
        gUnknown_0200B224[i].unk02 = gUnknown_084887AC[(i - 9) * 10 + a2 * 2 + 1];
    }

    switch (a1 & 0x1F)
    {
    case 8:
        i = 4;
        break;
    case 6:
        i = 3;
        break;
    case 14:
        i = 2;
        break;
    case 10:
        i = 1;
        break;
    case 11:
        i = 0;
        break;
    }

    for (k = 0; k < 5; k++)
    {
        struct Unk0200B0B0 *p;
        int m;

        p = gUnknown_0200B0B0;
        idx = p->unk3a + i;
        if (idx > 9)
            idx -= 10;
        m = (s8)p->unk36 + i;
        while (m == 1)
            m = 0;
        gUnknown_0200B0D0[idx].unk04 = gUnknown_0200B224[k + 9].unk00;
        i++;
    }
}


