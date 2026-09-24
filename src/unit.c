#include "global.h"
#include "proc.h"
#include "map.h"

/* Unit/CO code, contiguous from 0x08042B70 through 0x08043630.
 * The preceding gap is undecompiled; the following function uses inline assembly.
 * Preserve function order for the original ROM layout. */

void sub_08042B70(void)
{
    sub_080152EC(gUnknown_0849A0F0, 0);
}


void sub_08042B84(void)
{
    struct Unk03001470 *p = sub_080152EC(gUnknown_0849A0F0, 0);

    p->unk20 = 1;
}

/* gUnknown_030044B0 is declared `u8 []`, so the word store at +8 needs a cast.
 * The BASE must be bound to a local first: writing
 * `*(u32 *)(gUnknown_030044B0 + 8)` folds the 8 into the pool word as
 * `gUnknown_030044B0+0x8` and stores at `[r2]`, where the ROM has a clean
 * `gUnknown_030044B0` pool word and `str r0, [r2, #8]`. Same instruction
 * count -- the difference is entirely in the relocation addend.
 *
 * The element address is recomputed for the second store because the first
 * `strb` kills gPlayers's MEM (it is a non-const pointer global). */
void sub_08042B9C(void)
{
    u8 *q;

    gPlaySt.unk2e = sub_08035170();
    q = gUnknown_030044B0;
    *(u32 *)(q + 8) = gUnknown_03001FD4;

    if (gPlaySt.savingEnabled == 0)
    {
        gPlayers[gUnknown_030033EC].cursorX = gUnknown_030033E4.unk00;
        gPlayers[gUnknown_030033EC].cursorY = gUnknown_030033E4.unk02;
    }

    gUnknown_030032D8 = 1;
    sub_08025EA0();
}

void sub_08042C10(void)
{
    Proc_Start(gUnknown_0849FC0C, PROC_TREE_3);
}

/*
 * GetCoPriceMultiplier, GetUnitMovementWithCoBonus, GetUnitFiringRangeWithCoBonus and GetUnitVisionWithCoBonus are named per
 * Xenesis's AW2 Subroutine List: "Gathers Price multipliers of CO",
 * "Collects Mov Range + CO Boosts", "Collects Max Firing Range + CO Boosts"
 * and "Gathers Vision Total of CO" respectively. GetUnitAttackWithCoBonus/GetUnitDefenceWithCoBonus
 * aren't separately cited there, but they're structurally identical to the
 * cited Mov/Range/Vision trio one function over (base stat + CO bonus, same
 * `+ 0x64` bias), so they're named by that analogy: attack and defence are
 * the two stats the cited trio's family (GetCoAttackBonus.../GetCoRangeBonus
 * in src/unit.c) doesn't already cover. The old sub_XXXXXXXX
 * symbols are kept as linker aliases below so every other unit keeps
 * resolving them unchanged.
 */

/* The parent argument doubles as a tree NUMBER and a real ProcPtr, and the
 * signed `cmp #7` is what tells them apart -- hence the `(int)` cast, which a
 * pointer comparison would not give.
 *
 * The arms are written `<= 7` with Proc_Start first, so the ROM's `bgt` reaches
 * the else. That is the ORDINARY sense: these two arms REJOIN, and for
 * rejoining arms agbcc branches on the NEGATED condition to the else and leaves
 * the then inline. It is the opposite of what the same source shape does when
 * both arms `return` (see sub_08017CF0), where the else goes inline instead.
 *
 * unk64/unk66 are reached by advancing the base (`adds r0,#0x64` then
 * `adds r0,#2`) because 0x64 is past `strh`'s 5-bit displacement; unk2c/unk30
 * stay in the displacement, which is why only the halfword pair walks. */
struct Unk08042C24Proc
{
    /* 00 */ STRUCT_PAD(0x00, 0x2c);
    /* 2c */ int unk2c;
    /* 30 */ int unk30;
    /* 34 */ STRUCT_PAD(0x34, 0x4a);
    /* 4a */ u16 unk4a;
    /* 4c */ STRUCT_PAD(0x4c, 0x64);
    /* 64 */ u16 unk64;
    /* 66 */ u16 unk66;
};

void sub_08042C24(int a, int b, int c, int d, ProcPtr parent)
{
    struct Unk08042C24Proc *proc;

    if ((int)parent <= 7)
        proc = Proc_Start(gUnknown_0849FCA4, parent);
    else
        proc = Proc_StartBlocking(gUnknown_0849FCA4, parent);

    proc->unk64 = a;
    proc->unk66 = b;
    proc->unk2c = c;
    proc->unk30 = d;
    proc->unk4a = 0x1e;
}

/* The two bounds are bound to LOCALS, and that is what the ROM's compares need.
 * Written as literals, agbcc's tree-level `fold` canonicalises `>= 2` to `> 1`
 * and, knowing unk18 is a u8, picks unsigned branches -- `cmp #3; bhi` /
 * `cmp #1; bls`. Via int locals the comparison is typed `int` at tree level, so
 * neither the fold nor the range-narrowing fires, and constant propagation
 * still puts both values back in the `cmp` immediates. Exactly the lever
 * docs/agbcc-codegen.md records for sub_08044BA0 (wave 26, W26-B).
 *
 * Binding both is necessary: `hi` alone leaves the second compare unsigned. */
int sub_08042C68(int a, int b)
{
    int lo;
    int hi;

    hi = 3;
    lo = 2;

    if ((GetPlayerSpecialAbilities(a) & 0x80) != 0
        && gUnknown_085D5ABC[b].unitClass <= hi
        && gUnknown_085D5ABC[b].unitClass >= lo)
        return -2;

    return 0;
}

/* Both parameters are `int`, which corrects the `(u16, u8)` this function was
 * declared with -- see the note in unknown-functions.h. The prologue is a bare
 * `adds r4, r0, #0; adds r5, r1, #0` and both values live across two calls; the
 * narrow declaration adds four PROMOTE_MODE narrowing instructions. */
int GetCoPriceMultiplier(int a, int b)
{
    return Div(GetUnitBaseCost(b)
        * (GetCoCostBonus(gPlayers[a].co, gPlayers[a].coMode, b)
            + 0x64), 100);
}

/* The `lsls #4; subs; lsls #2` triple is the 0x3c stride of
 * struct PlayerStruct, and gPlayers is a pointer to it, so the pool
 * word is dereferenced once before the index is added. */
int GetUnitAttackWithCoBonus(int a, int b)
{
    return GetCoAttackBonus(gPlayers[a].co, gPlayers[a].coMode, b)
        + 0x64;
}

/* GetUnitAttackWithCoBonus's twin over GetCoDefenceBonus. */
int GetUnitDefenceWithCoBonus(int a, int b)
{
    return GetCoDefenceBonus(gPlayers[a].co, gPlayers[a].coMode, b)
        + 0x64;
}

/* The one-argument call is the LEFT operand of the `+`: agbcc evaluates it
 * first and parks the result in r4, then builds the three-argument call. */
int GetUnitMovementWithCoBonus(int a, int b)
{
    return GetUnitBaseMovement(b)
        + GetCoMovementBonus(gPlayers[a].co, gPlayers[a].coMode, b);
}

/* GetUnitMovementWithCoBonus's twin over GetUnitBaseFiringRange / GetCoRangeBonus. */
int GetUnitFiringRangeWithCoBonus(int a, int b)
{
    return GetUnitBaseFiringRange(b)
        + GetCoRangeBonus(gPlayers[a].co, gPlayers[a].coMode, b);
}

/* The floor is written `if (n > 1) return n; else return 1;` and not the other
 * way round: both arms return, so agbcc emits the ELSE inline and branches to
 * the THEN on the condition being true, which is the ROM's `bgt` over an inline
 * `movs r0, #1`.
 *
 * gPlaySt.unk2c is reached with `adds r0, #0x2c` on the base rather
 * than an `ldrb` displacement because 0x2c is past `ldrb`'s 5-bit field -- that
 * is addressing, not a member-array tell. */
int GetUnitVisionWithCoBonus(int a, int b)
{
    int n;

    n = GetUnitBaseVision(b)
        + GetCoVisionBonus(gPlayers[a].co, gPlayers[a].coMode);

    if (gPlaySt.weather == 2)
        n--;

    if (n > 1)
        return n;
    else
        return 1;
}

asm(".global sub_08042C9C\n.thumb_set sub_08042C9C, GetCoPriceMultiplier\n"
    ".global sub_08042CD4\n.thumb_set sub_08042CD4, GetUnitAttackWithCoBonus\n"
    ".global sub_08042CF8\n.thumb_set sub_08042CF8, GetUnitDefenceWithCoBonus\n"
    ".global sub_08042D1C\n.thumb_set sub_08042D1C, GetUnitMovementWithCoBonus\n"
    ".global sub_08042D50\n.thumb_set sub_08042D50, GetUnitFiringRangeWithCoBonus\n"
    ".global sub_08042D84\n.thumb_set sub_08042D84, GetUnitVisionWithCoBonus\n");

int sub_08042DCC(int a1)
{
    return gUnknown_085D3DD0[a1].unk15 + 1;
}

int sub_08042DE0(int a1)
{
    return sub_08042DCC(gPlayers[a1].co);
}

/* `int`, not `u8`: a u8 return re-narrows the callee's result with
 * `lsls #24; lsrs #24`, which the original does not have. */
int sub_08042DFC(int a1)
{
    return sub_08042E18(gPlayers[a1].co);
}

/* `int`, not the `u8` this was promoted with. Its own bytes cannot tell --
 * it is a leaf ending in `bx lr` and `ldrb` zero-extends either way -- but
 * sub_08042DFC forwards the result straight out with no `lsls #24; lsrs #24`,
 * and a u8-returning callee makes the caller re-narrow. The call site is the
 * only evidence there is, and it says 32 bits.
 */
int sub_08042E18(int a)
{
    return gUnknown_085D3DD0[a].unk16;
}

/* Named per Xenesis's AW2 Subroutine List: "Gathers Luck Total of CO". The
 * old GetCoLuckBonus symbol is kept as a linker alias below so every other
 * unit keeps resolving it unchanged. */
int GetCoLuckBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 10;

    return gUnknown_085D3DD0[a].power[b].luckPositive;
}

asm(".global sub_08042E2C\n.thumb_set sub_08042E2C, GetCoLuckBonus\n");


/* Player-level wrapper for GetCoLuckBonus. The old GetPlayerCoLuckBonus symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged. */
int GetPlayerCoLuckBonus(int a1)
{
    return GetCoLuckBonus(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08042E64\n.thumb_set sub_08042E64, GetPlayerCoLuckBonus\n");


/* Named per Xenesis's AW2 Subroutine List: "Gathers Negative Luck Total of
 * CO". The old GetCoNegativeLuckBonus symbol is kept as a linker alias below so every
 * other unit keeps resolving it unchanged. */
int GetCoNegativeLuckBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].luckNegative;
}

asm(".global sub_08042E84\n.thumb_set sub_08042E84, GetCoNegativeLuckBonus\n");


/* Player-level wrapper for GetCoNegativeLuckBonus. The old GetPlayerCoNegativeLuckBonus
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoNegativeLuckBonus(int a1)
{
    return GetCoNegativeLuckBonus(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08042EBC\n.thumb_set sub_08042EBC, GetPlayerCoNegativeLuckBonus\n");


int GetCoCaptureRate(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 100;

    return gUnknown_085D3DD0[a].power[b].captureRateModifier + 100;
}

asm(".global sub_08042EDC\n.thumb_set sub_08042EDC, GetCoCaptureRate\n");


int sub_08042F14(int a1)
{
    return GetCoCaptureRate(gPlayers[a1].co, gPlayers[a1].coMode);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gPlayers[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F34(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].rainBringerPercent;
}


int sub_08042F5C(int a1)
{
    return sub_08042F34(gPlayers[a1].co, gPlayers[a1].coMode);
}

/* The second argument is never used, but it stays in the signature: the
 * forwarder next door loads gPlayers[a1].unk1e and passes it, and
 * that load is in the original's bytes. */
int sub_08042F7C(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].snowBringerPercent;
}


int sub_08042FA4(int a1)
{
    return sub_08042F7C(gPlayers[a1].co, gPlayers[a1].coMode);
}


/* Named per Xenesis's AW2 Subroutine List: "Gathers Counterattack Bonus
 * Total of CO". The old GetCoCounterattackBonus symbol is kept as a linker alias below
 * so every other unit keeps resolving it unchanged. */
int GetCoCounterattackBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].counterMultiplier;
}

asm(".global sub_08042FC4\n.thumb_set sub_08042FC4, GetCoCounterattackBonus\n");


/* Player-level wrapper for GetCoCounterattackBonus. The old GetPlayerCoCounterattackBonus
 * symbol is kept as a linker alias below so every other unit keeps
 * resolving it unchanged. */
int GetPlayerCoCounterattackBonus(int a1)
{
    return GetCoCounterattackBonus(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08042FFC\n.thumb_set sub_08042FFC, GetPlayerCoCounterattackBonus\n");


u32 sub_0804301C(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].specialAbilities;
}


u32 GetPlayerSpecialAbilities(int a1)
{
    return sub_0804301C(gPlayers[a1].co, gPlayers[a1].coMode);
}

asm(".global sub_08043050\n.thumb_set sub_08043050, GetPlayerSpecialAbilities\n");

/* The per-army repair/income multiplier, applied as a percentage: the byte at
 * gUnknown_085D5ABC[c].unk1e[e][d] scales GetCoAttackBonus's result, which is
 * itself a percentage that the `+ 100` turns into a multiplier.  A zero
 * product is raised to 1, so a matchup that "works at all" never rounds away
 * to nothing, but a zero scale byte short-circuits to 0 before that.
 *
 * The return is `int` and NOT the u16 unknown-functions.h used to declare:
 * a u16-returning agbcc function narrows its own result in the epilogue and
 * this one does not.  See the note on the declaration.
 *
 * `base` is its own statement, evaluated unconditionally ahead of the
 * `v > 0` test -- the ROM does the `bl` and the `+ 0x64` before the `cmp`.
 */
int sub_08043070(int a1, int a2, int a3, int a4, int a5)
{
    int v = gUnknown_085D5ABC[a3].baseDamage[a5][a4];
    int base = GetCoAttackBonus(a1, a2, a3) + 100;
    int r;

    if (v > 0)
    {
        r = Div(v * base, 100);
        if (r == 0)
            r = 1;
    }
    else
    {
        r = 0;
    }

    return r;
}

/*
 * Named per Xenesis's AW2 Subroutine List: "Attack Value of CO" / "Defence
 * Value of CO" / "Movement Bonus of CO" / "Range Bonus of CO" for the four
 * functions in this family respectively -- matches the `varies` s16 index K
 * (0/1/2/3) documented below, which selects which of the four stats to read
 * out of the same per-CO/power-state/unit-class table. Parameters named from
 * that: `a` indexes gUnknown_085D3DD0 (a CO), `b` indexes its `.unk38` (a CO
 * Power state), `c` indexes gUnknown_085D5ABC (a unit type) both directly and
 * via GetUnitCombatClassColumn. The old sub_XXXXXXXX symbols are kept as
 * linker aliases below so every other unit keeps resolving them unchanged.
 */

/* Family F049: four copies of one body that differ ONLY in the s16 index K
 * (0, 1, 2, 3 -- `movs rN, #0/2/4/6` at the three `ldrsh` sites), exactly as
 * data/families.json `varies` says.
 *
 * Three things had to be read off the ROM rather than guessed:
 *
 * 1. struct Unk085D3DD0Entry.unk24 is an array of POINTERS. The ROM does
 *    `ldr r7,[r3]` on the table word and then `ldrsh r0,[r7,r2]` through the
 *    result. 0x24 + 8*4 == 0x44 fills the record exactly, and the two indices
 *    in use (gUnknown_085D5ABC[c].unk18, and GetUnitCombatClassColumn's 5/6/7) span it.
 *
 * 2. Both lookups happen BEFORE the gPlaySt.coAbilities early-out. That is
 *    not scheduling -- agbcc will not hoist a load above a branch -- so the
 *    two assignments really are the first two statements, unlike the F038
 *    accessors in c_08042E2C.c where the early-out comes first.
 *
 * 3. gUnknown_085D5ABC is NOT const, and that is what the second
 *    `ldrb r0,[r6,#0x18]` proves. With the header's old `const` the load is
 *    CSEd across `bl GetUnitCombatClassColumn`, the value rather than the address lives in
 *    r6, and the function is two bytes short. See the note on the declaration
 *    in include/unknown-globals.h.
 *
 * The dead `ldr r7, =gUnknown_085D3DD0` at the top and the folded pool word
 * `gUnknown_085D3DD0 + 0x5c` (which asm/ symbolises as gUnknown_085D3E2C) both
 * fall straight out of the plain member spelling under -fforce-addr; neither
 * is something to reproduce by hand. */

int GetCoAttackBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].power[b].unk24[gUnknown_085D5ABC[c].unitClass];
    q = gUnknown_085D3DD0[a].power[b].unk24[GetUnitCombatClassColumn(c)];

    if (gPlaySt.coAbilities == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unitClass == 0)
        return p[0];

    return p[0] + q[0];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoDefenceBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].power[b].unk24[gUnknown_085D5ABC[c].unitClass];
    q = gUnknown_085D3DD0[a].power[b].unk24[GetUnitCombatClassColumn(c)];

    if (gPlaySt.coAbilities == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unitClass == 0)
        return p[1];

    return p[1] + q[1];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoMovementBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].power[b].unk24[gUnknown_085D5ABC[c].unitClass];
    q = gUnknown_085D3DD0[a].power[b].unk24[GetUnitCombatClassColumn(c)];

    if (gPlaySt.coAbilities == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unitClass == 0)
        return p[2];

    return p[2] + q[2];
}

/* See GetCoAttackBonus above for the shared analysis this family relies on. */

int GetCoRangeBonus(int a, int b, int c)
{
    s16 *p;
    s16 *q;

    p = gUnknown_085D3DD0[a].power[b].unk24[gUnknown_085D5ABC[c].unitClass];
    q = gUnknown_085D3DD0[a].power[b].unk24[GetUnitCombatClassColumn(c)];

    if (gPlaySt.coAbilities == 0)
        return 0;

    if (gUnknown_085D5ABC[c].unitClass == 0)
        return p[3];

    return p[3] + q[3];
}

asm(".global sub_080430B0\n.thumb_set sub_080430B0, GetCoAttackBonus\n"
    ".global sub_08043120\n.thumb_set sub_08043120, GetCoDefenceBonus\n"
    ".global sub_08043190\n.thumb_set sub_08043190, GetCoMovementBonus\n"
    ".global sub_08043200\n.thumb_set sub_08043200, GetCoRangeBonus\n");

/*
 * Named per Xenesis's AW2 Subroutine List: GetCoCostBonus = "Gathers Cost
 * Bonus of CO. Input of CO ID, Power Status and Unit ID. Outputs cost
 * bonuses in r0", GetCoVisionBonus = "Gathers vision bonus of CO". The old
 * sub_XXXXXXXX symbols are kept as linker aliases below so every other unit
 * keeps resolving them unchanged.
 */

/* Family F038, the shape of the dozen accessors in src/decomp/c_08042E2C.c.
 * The address arithmetic `(a * 65 + b * 17) * 4` is already encoded by
 * struct Unk085D3DD0 (0x104) holding struct Unk085D3DD0Entry unk38[3] (0x44),
 * so the only thing to read out of the assembly is the member: the ROM's
 * `adds r0, #0x4c` is 0x38 + 0x14, i.e. unk14.
 *
 * `movs r1, #0; ldrsh r0, [r0, r1]` is not a variation on the matched siblings
 * -- every member of F038 uses it, including GetCoLuckBonus/E84/FC4 -- it is just
 * how an s16 member is reached once the offset has been folded onto the base.
 * No re-narrowing after the load, so the return is `int`.
 *
 * THREE parameters, not the two this was first promoted with. The third is
 * unused in this member's body, so the body cannot tell you -- the evidence is
 * the call site: GetCoPriceMultiplier (wave 26, byte-exact) materialises `adds r2, r5,
 * #0` immediately before the bl, which only an argument produces, and the
 * sibling GetCoRangeBonus takes and uses the same three. An unused trailing
 * parameter is byte-neutral here; re-verified with trymatch after the change. */

int GetCoCostBonus(int a, int b, int c)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].unitCostModifier;
}

/* Family F038, the twin of GetCoCostBonus one member down: the ROM's
 * `adds r0, #0x44` is 0x38 + 0x0c, i.e. unk0c. See the note on GetCoCostBonus. */

int GetCoVisionBonus(int a, int b)
{
    if (gPlaySt.coAbilities == 0)
        return 0;

    return gUnknown_085D3DD0[a].power[b].visionBonus;
}

asm(".global sub_08043270\n.thumb_set sub_08043270, GetCoCostBonus\n"
    ".global sub_080432A8\n.thumb_set sub_080432A8, GetCoVisionBonus\n");

/*
 * Not itself Xenesis-documented, but named for what its caller
 * (GetCoAttackBonus and siblings, src/unit.c) uses it for:
 * mapping a unit's 3-valued combat-class tag onto which column of the
 * per-CO/power-state stat table to read. The old sub_XXXXXXXX symbol is
 * kept as a linker alias below so every other unit keeps resolving it
 * unchanged.
 */

/* Maps the 3-valued tag at +0x0e onto a column index. `int`, not u8: its
 * caller GetCoAttackBonus does `lsls r0, r0, #2` straight off the `bl` with no
 * re-narrowing.
 *
 * The local has to be `u32`. The whole shape hangs on it: an UNSIGNED
 * comparison gives `cmp #1; bls` for the first test, a signed one gives `ble`
 * -- one bit of encoding, no size difference. And a `switch` statement does
 * not reach this at all in any case order (four spellings probed): it expands
 * to two linear `cmp/beq` equality tests, never the range test plus a single
 * equality test the ROM has, even though the two come out the same 36 bytes.
 */
int GetUnitCombatClassColumn(int a)
{
    u32 v = gUnknown_085D5ABC[a].minRange;

    if (v > 1)
        return 6;

    if (v == 1)
        return 5;

    return 7;
}

asm(".global sub_080432E0\n.thumb_set sub_080432E0, GetUnitCombatClassColumn\n");

/* The pointer parameter's +0x00 is a `struct Unk08499594 *` into the unit
 * table and +0x06 an s16.  `(p->unk00 - gUnits) >> 6` is the
 * 0-based army number -- the table is grouped 64 entries to an army, the same
 * `>> 6` unknown-globals.h already records -- and the `+ 1` makes it the
 * 1-based one GetPlayerSpecialAbilities indexes by.  The whole `sub/lsl/add/neg/asr #8`
 * chain is agbcc's EXACT division for the pointer difference (multiply by
 * -inverse(3), negate, then one `asr` that carries both the /4 of the exact
 * division and the >> 6) -- it is one operator, not five.
 */
struct Unk43304
{
    /* 0x00 */ struct Unk08499594 *unk00;
    /* 0x04 */ u8 filler_04[0x02];
    /* 0x06 */ s16 unk06;
};

int sub_08043304(struct Unk43304 *p)
{
    if ((GetPlayerSpecialAbilities(((p->unk00 - gUnits) >> 6) + 1) & 0x20) == 0)
        return p->unk06;

    return p->unk06 * 2;
}

int sub_0804334C(struct Unk43304 *p)
{
    int r;

    if (GetPlayerSpecialAbilities(((p->unk00 - gUnits) >> 6) + 1) & 0x40)
        r = p->unk06;
    else
        r = 0;

    return r;
}

int sub_0804338C(struct Unk43304 *p)
{
    return GetPlayerCoCounterattackBonus(((p->unk00 - gUnits) >> 6) + 1);
}

/*
 * GetUnitBaseCost is named per Xenesis's AW2 Subroutine List: "Subroutine that
 * gets the unit's base cost". The other three in this family aren't
 * separately cited there, but each feeds exactly one Xenesis-named "+ CO
 * Boosts" total in src/unit.c (base movement into
 * GetUnitMovementWithCoBonus, base firing range into
 * GetUnitFiringRangeWithCoBonus, base vision into
 * GetUnitVisionWithCoBonus), so they're named by that structural analogy
 * rather than a direct citation. The old sub_XXXXXXXX symbols are kept as
 * linker aliases below so every other unit keeps resolving them unchanged.
 */

/* All four return `int`, not the u8/u16 they were first promoted with. The
 * bodies are bare ldrb/ldrh member loads and are byte-identical either way, so
 * the width was a body-side guess with no oracle. Wave 26 produced the first
 * promoted callers and they settle it: GetCoPriceMultiplier does `bl GetUnitBaseCost;
 * adds r6, r0, #0` and multiplies with r6 later -- no re-narrowing after the
 * bl with the value used, which a u16 return cannot produce (agbcc re-narrows
 * a narrow-returning callee's result at every call site). GetUnitMovementWithCoBonus,
 * GetUnitFiringRangeWithCoBonus and GetUnitVisionWithCoBonus show the same for the other three. Settled
 * from the callers; all four re-verified byte-exact after the change. */

int GetUnitBaseMovement(int a)
{
    return gUnknown_085D5ABC[a].movement;
}

int GetUnitBaseFiringRange(int a)
{
    return gUnknown_085D5ABC[a].maxRange;
}

int GetUnitBaseCost(int a)
{
    return gUnknown_085D5ABC[a].cost;
}

int GetUnitBaseVision(int a)
{
    return gUnknown_085D5ABC[a].vision;
}

asm(".global sub_080433B8\n.thumb_set sub_080433B8, GetUnitBaseMovement\n"
    ".global sub_080433C8\n.thumb_set sub_080433C8, GetUnitBaseFiringRange\n"
    ".global sub_080433D8\n.thumb_set sub_080433D8, GetUnitBaseCost\n"
    ".global sub_080433E8\n.thumb_set sub_080433E8, GetUnitBaseVision\n");

int sub_080433F8(int a, int b, int c)
{
    return gUnknown_085D5ABC[a].baseDamage[c][b];
}

/* A `switch` over 19 sprite kinds that nudges the (x, y) it was handed, picks
 * an animation id and puts one sprite. Cases 4 and 8..11 are absent -- their
 * jump-table slots point at the tail, which is also the default, and the id
 * that reaches sub_0801C7DC in those cases is the selector itself.
 *
 * Case 0 reads the unit id under the pixel position: the s16 scroll fields
 * (gMap->scrollX / scrollY) are added before the `>> 4` that turns a pixel
 * coordinate into a cell coordinate, and the cell is gMap->unit[idx]. They are
 * a different pair from the tile-granularity camX / camY.
 *
 * `id` is REUSED as the 4-or-0 flag in case 0, rather than a `flag` local:
 * a separate local lands the constant straight in r2 and the original spends
 * `adds r2, r4, #0` copying it out of the switch variable's register. The
 * rowOffset load is its own statement with the column computed after it, which
 * keeps the frame at `push {r4, r5, r6, lr}`.
 */
void sub_08043418(int x, int y, int id)
{
    int idx;
    int col;
    int row;

    switch (id)
    {
    case 0:
        x += 8;
        y += 8;
        row = (y + gMap->scrollY) >> 4;
        idx = gMap->rowOffset[row];
        col = (x + gMap->scrollX) >> 4;
        idx += col;
        if (gMap->unit[idx] == 0 && sub_08042424(col, row))
            id = 4;
        else
            id = 0;
        id = sub_08043574(x, y, id);
        break;
    case 1:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 0);
        break;
    case 2:
        x += 8;
        y += 8;
        id = 0x10;
        break;
    case 3:
        id = 0x11;
        break;
    case 5:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 8);
        break;
    case 6:
        x += 8;
        y += 8;
        id = sub_08043574(x, y, 0xc);
        break;
    case 7:
        x += 8;
        y += 8;
        id = 0x12;
        break;
    case 12:
        x += 8;
        y += 0x10;
        id = 0x14;
        break;
    case 13:
        x += 8;
        y += 0x10;
        id = 0x13;
        break;
    case 14:
        id = 0x15;
        break;
    case 15:
        id = 0x16;
        break;
    case 16:
        id = 0x17;
        break;
    case 17:
        id = 0x18;
        break;
    case 18:
        x += 8;
        y += 8;
        id = 0x19;
        break;
    }

    sub_0801C7DC(gUnknown_08101EC0, id, gGameClock,
                 x & 0x1FF, y & 0xFF, 0x1365, 1);
}

/* Picks the corner an on-screen box should hang off: the screen is split at
 * x = 0xd0 and y = 0x80 and the sprite id is bumped by 1, 2 or 3 for three of
 * the four quadrants, leaving the top-left quadrant unchanged.  All three
 * comparisons are signed, so all three parameters are `int`.
 */
int sub_08043574(int x, int y, int id)
{
    if (x > 0xcf)
    {
        if (y > 0x7f)
            id += 2;
        else
            id += 1;
    }
    else if (y > 0x7f)
    {
        id += 3;
    }

    return id;
}

void sub_08043590(void)
{
    volatile u32 t = gGameClock;

    if ((u16)(gUnknown_030005D0 - 1) > 3)
        return;
    if (gPlaySt.coPowersEnabled == 0)
        return;

    if (IsCoPowerReady(gUnknown_030005D0))
        sub_0801368C((u16 *)((((t >> 2) & 0xf) * 2) + (int)gUnknown_08104324), 0x2f6, 2);
    else
        sub_0801368C((u16 *)((((t >> 1) & 0xf) * 2) + (int)gUnknown_08104304), 0x2f6, 2);
}

void sub_0804360C(int a)
{
    sub_080436DC(a, 3, gUnknown_030033EC);
    DrawDaysRemaining(a, 6);
}
