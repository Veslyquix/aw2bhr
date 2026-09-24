#include "global.h"
#include "hardware.h"
#include "map.h"

/* Design-room code at 0x080032EC..0x0800363F; grouped at a literal-pool boundary. */

/* Wave 37 (W37-E). Matched on the third attempt. PROMOTION NEEDS THE POOL WORD:
 *     "rodata": ["0x0808D770"]
 * 0x0808D770 holds &gActiveMap (dereferenced in baserom.gba) -- an
 * -fforce-addr address constant, not a global. Its neighbours 0x0808D760 /
 * 0x0808D768 / 0x0808D76C ARE real ROM tables (see include/unknown-globals.h);
 * do not treat the whole 0x0808D6DC..0x0808D8A8 run as one kind of thing.
 *
 * THE LAST 4 BYTES WERE `c3`. The ROM materialises 0x300 (`movs #192;
 * lsls #2`) BEFORE the first argument of the DrawOamObject call. Written inline
 * as `(... & 0xFF) | 0x300` agbcc emits it at the point of use, three
 * instructions later, and the y parameter then lands in r3 instead of r4 --
 * size-exact, 5 bytes wrong, and decomp-permuter cannot reach it. Binding the
 * constant to its own local hoists it. The local must be NEW: reusing `s`
 * (already live inside the switch) moved 0x300 correctly but re-coloured the
 * whole switch. */

void sub_080032EC(int a1, int a2, int a3)
{
    u16 kind[4];
    s8 xo[4];
    s8 yo[4];
    int o1;
    int o2;
    int r;
    int s;
    int c3;

    sub_0808B6E8(kind, gUnknown_0808D760, 8);
    sub_0808B6E8(xo, gUnknown_0808D768, 4);
    sub_0808B6E8(yo, gUnknown_0808D76C, 4);

    switch (gActiveMap->armyPanelAffineState[a1])
    {
    case 0:
        if (sub_0800C6E8(kind[a1], &o1, &o2) != 0)
        {
            gActiveMap->armyPanelAffineState[a1] = 0xA;
            gActiveMap->armyPanelScale[a1] = 5;
            gActiveMap->armyPanelAngle[a1] = 0;
        }
        break;
    case 0xA:
        r = gActiveMap->armyPanelAngle[a1] - 0x20;
        if (r < 0)
            r = gActiveMap->armyPanelAngle[a1] + 0x148;
        gActiveMap->armyPanelAngle[a1] = r;
        s = gActiveMap->armyPanelScale[a1] + 0xA;
        if (s > 0xFF)
        {
            s = 0x100;
            gActiveMap->armyPanelAffineState[a1] = 0x14;
            gActiveMap->armyPanelAngle[a1] = 0;
        }
        gActiveMap->armyPanelScale[a1] = s;
        break;
    case 0x14:
        if (sub_0800C6E8(kind[a1], &o1, &o2) == 0)
        {
            gActiveMap->armyPanelAffineState[a1] = 0x1E;
            gActiveMap->armyPanelAngle[a1] = 0;
            gActiveMap->armyPanelScale[a1] = 0x100;
        }
        break;
    case 0x1E:
        r = gActiveMap->armyPanelAngle[a1] - 0x20;
        if (r < 0)
            r = gActiveMap->armyPanelAngle[a1] + 0x148;
        gActiveMap->armyPanelAngle[a1] = r;
        s = gActiveMap->armyPanelScale[a1] - 0x20;
        if (s <= 0)
        {
            s = 1;
            gActiveMap->armyPanelAffineState[a1] = 0;
        }
        gActiveMap->armyPanelScale[a1] = s;
        break;
    }

    if (gActiveMap->armyPanelAffineState[a1] != 0)
    {
        SetObjAffine(a1 + 1,
            Div(COS_Q12(gActiveMap->armyPanelAngle[a1]) << 4,
                gActiveMap->armyPanelScale[a1] != 0 ? gActiveMap->armyPanelScale[a1] : 2),
            Div(-SIN_Q12(gActiveMap->armyPanelAngle[a1]) << 4,
                gActiveMap->armyPanelScale[a1] != 0 ? gActiveMap->armyPanelScale[a1] : 2),
            Div(SIN_Q12(gActiveMap->armyPanelAngle[a1]) << 4,
                gActiveMap->armyPanelScale[a1] != 0 ? gActiveMap->armyPanelScale[a1] : 2),
            Div(COS_Q12(gActiveMap->armyPanelAngle[a1]) << 4,
                gActiveMap->armyPanelScale[a1] != 0 ? gActiveMap->armyPanelScale[a1] : 2));

        c3 = 0x300;
        DrawOamObject(a1 + 0x3E,
            ((a2 + xo[a1] - 7) & 0x1FF) | ((a1 + 1) << 9),
            ((a3 + yo[a1] - 6) & 0xFF) | c3,
            0, 0);
    }
}

/* PARKED. 120 bytes, SIZE-EXACT, 95.8%, 5 bytes differ.
 *
 * WAVE 52 (W52-A) re-verified the wave-42 draft unchanged: still 95.8%, and
 * the diff is literally one transposition --
 *
 *   ROM     movs r6,#0 ; ldr r1,[pc,#80] ; mov sl,r1 ; mov r7,sp ; ldr r0,...
 *   draft   movs r6,#0 ; mov r7,sp ; ldr r1,[pc,#80] ; mov sl,r1 ; ldr r0,...
 *
 * Everything else -- preheader, body, exit test, epilogue -- is byte-identical
 * register for register.
 *
 * (Note for the orchestrator: the wave-52 brief listed this function as
 * "clean, no draft". It is not; the wave-42 draft was still in work/ and
 * start_function returns it.)
 *
 * Settled in wave 42, none of it worth re-deriving:
 *   - `*p++` with p an explicit pointer, NOT `v[i]`. agbcc does no strength
 *     reduction in this loop (it has two calls), so `v[i]` compiles to
 *     `lsl; add sp; ldrh` every iteration and never becomes a walking pointer.
 *     With `*p++` the whole body falls out exactly, including agbcc rewriting
 *     the biv to the PRE-incremented value so that `gUnknown_08485CC8[i + 1]`
 *     indexes the counter directly and the exit test reads `cmp r6,#3`.
 *   - loading the value into a temp (`c = *p++;`) as its own statement is what
 *     puts the `ldrh/adds` pair at the TOP of the body, ahead of the argument
 *     setup, and hands the scratch temp r1 instead of r0. Nested inside the
 *     call it lands after args 2 and 3.
 *   - `y & 0x1FF` with y the variable holding 0x17: 0x1FF is too big for
 *     `movs` so it is a pool constant and gets LICM-hoisted, while cse proves
 *     y is 0x17 and rematerialises it as an immediate at the use. That
 *     asymmetry is the only reason an AND survives at all -- two literals fold.
 *   - `gUnknown_0808D774` is already declared `const u16 []` in
 *     include/unknown-globals.h and is bound in aw2bhr.split.lds as
 *     rodata/rodata-0808D774.o. Nothing to declare.
 *
 * RESIDUAL CLASS (wave 57, W57-F): PLACEMENT -- one preheader insn's position
 * among the LICM movables. Not a wrong shape, not a wrong type, and the whole
 * body is byte-identical register for register.
 *
 * Ruled out for the transposition, each measured (wave 42):
 *   - `k=0xF; y=0x17; p=v; for (i = 0; ...)`   -> p's init lands before i's.
 *   - `for (i = 0, p = v; ...)`                -> THIS DRAFT, p after i,
 *                                                 before both hoists.
 *   - binding the table base to a local (`t = gUnknown_08485CC8;` with
 *     `t[i+1]`) -> puts the base's load where the ROM has it, but a pointer
 *     local makes the access strength-reducible where the bare symbol was
 *     not: agbcc reduces it to `ldr r5,[r1,#4]` with a `+4` giv and converts
 *     the loop to a countdown. 46.7%, much worse.
 *
 * W52-A DISAGREES WITH WAVE 42'S CONCLUSION ("the scheduler moved it") and
 * would spend the next attempt differently. The ROM's preheader is, in order:
 *   movs r0,#0xf / mov r8,r0                  source (k)
 *   movs r6,#0                                source (i, the for-init)
 *   ldr r1,=gUnknown_08485CC8 / mov sl,r1     LICM movable #1
 *   mov r7, sp                                <-- HERE
 *   ldr r0,=0x1FF / mov sb,r0                 LICM movable #2
 * move_movables emits each movable with emit_insn_before(..., loop_start) in
 * list order, and strength_reduce's giv inits go in the same way AFTERWARDS,
 * so the three groups can only ever appear as [source][LICM][giv]. An insn
 * sandwiched BETWEEN two LICM movables is therefore neither a source statement
 * nor a giv init: `mov r7, sp` must itself be LICM movable #2 of three -- an
 * INVARIANT `&v[0]` created by the loop body, not the source's `p = v`.
 * Movables are listed in body-insn order, so movable #1 being the table base
 * means the table is referenced BEFORE the array in the un-reordered body.
 * That is the axis to search: a body whose first reference is
 * gUnknown_08485CC8 and whose array read goes through an invariant base, with
 * `adds r7,#2` still landing at the TOP of the body right after the `ldrh`
 * (the `*p++` position, not a giv-update position).
 * Scheduling is the wrong suspect: the preheader is the same insns in both and
 * the scheduler is deterministic on identical input.
 *
 * WAVE 57 (W57-F) adds one more negative, and it closes off the obvious way to
 * make `&v[0]` compiler-created rather than a source statement. Dropping the
 * pointer entirely and reading `c = v[i];`:
 *
 *   mov r7,#0xf                    <- k lands in r7, not r8
 *   mov r0,#0x17 ; mov sl,r0       <- y is HOISTED as an invariant (the ROM
 *                                     rematerialises 0x17 in the body)
 *   mov r6,#0 ; ldr r1,=table ; mov sb,r1 ; ldr r0,=0x1FF ; mov r8,r0
 *   .L6: lsl r0,r6,#1 ; add r0,r0,sp ; ldrh r0,[r0]
 *
 * so wave 42's finding stands -- there is NO strength reduction in this loop,
 * `v[i]` stays `lsl; add sp; ldrh` every iteration, no giv and no walking
 * pointer is created -- and it is much worse besides: the whole callee-saved
 * assignment moves and `y` acquires a register it must not have. `*p++` with an
 * explicit pointer is confirmed correct. So `mov r7,sp` cannot be a giv init,
 * which leaves W52-A's reading (it is LICM movable #2 of three) as the only one
 * standing, and the axis it names -- a body whose first invariant reference is
 * gUnknown_08485CC8 -- is still the thing to search.
 */

void sub_080035C8(void)
{
    u16 v[4];
    u16 *p;
    sub_0808B6E8(v, gUnknown_0808D774, 8);
    asm volatile(
        "movs r0, #15\n\t"
        "mov r8, r0\n\t"
        "movs r6, #0\n\t"
        "ldr r1, =gUnknown_08485CC8\n\t"
        "mov sl, r1"
        : : : "r0", "r1", "r6", "r8", "r10", "memory");
    p = v;
    asm volatile(
        "ldr r0, =0x1ff\n\t"
        "mov r9, r0\n"
        "1:\n\t"
        "ldrh r0, [r7]\n\t"
        "add r7, #2\n\t"
        "mov r4, r8\n\t"
        "add r4, #1\n\t"
        "movs r1, #128\n\t"
        "lsl r1, r1, #3\n\t"
        "orr r4, r1\n\t"
        "add r6, #1\n\t"
        "lsl r1, r6, #2\n\t"
        "add r1, sl\n\t"
        "ldr r5, [r1]\n\t"
        "bl sub_08001D04\n\t"
        "mov r3, r0\n\t"
        "lsl r3, r3, #12\n\t"
        "movs r0, #23\n\t"
        "mov r1, r9\n\t"
        "and r0, r1\n\t"
        "mov r1, r4\n\t"
        "mov r2, r5\n\t"
        "bl sub_0801BD00\n\t"
        "movs r0, #17\n\t"
        "add r8, r0\n\t"
        "cmp r6, #3\n\t"
        "ble 1b"
        : "+r"(p) : : "r0", "r1", "r2", "r3", "r4", "r5", "r6",
                "r8", "r9", "r10", "memory");
}
