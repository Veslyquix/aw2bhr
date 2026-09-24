#include "global.h"
#include "hardware.h"
#include "map.h"

/* Design-room code at 0x08003640..0x08004723; grouped at a literal-pool boundary. */

#define MAP gMap

void sub_08003640(void)
{
    u8 v[4];
    int i;

    sub_0808B6E8(v, gUnknown_0808D77C, 4);
    for (i = 0; i < 4; i++)
    {
        sub_08011E54((void *)(sub_0802A880(v[i], 0) + 0x40),
                     (void *)(gUnknown_08485C9C[i + 1] * 32 + 0x06010000), 0xC0);
        sub_08011E54(gUnknown_08485A2C,
                     (void *)(gUnknown_08485C9C[i + 1] * 32 + 0x060100C0), 0x40);
    }
}

/* A five-entry sprite load list, the same idiom as src/decomp/c_0800376C.c. */
void sub_080036A4(void)
{
    DrawOamObject(0x30, 0x19, 0x418, 0, 0);
    DrawOamObject(0x2F, 0x19, 0x428, 0, 0);
    DrawOamObject(0x02, 0x19, 0x438, 0, 0);
    DrawOamObject(0x34, 0x18, 0x448, 0, 0);
    DrawOamObject(0x0C, 0x19, 0x458, 0, 0);
}

/* MATCHED, first draft. A font/graphics load list: one sub_0801F150 followed by
 * fourteen sub_0801F234 ids. sub_080037AC is the same function again, byte for
 * byte, which is why both were taken together. The same idiom is already
 * matched in src/decomp/c_080339B0.c and c_08065990.c. */
void sub_08003704(void)
{
    sub_0801F150(0, (void *)0x06010000, 0x28D, 0x1D);
    sub_0801F234(0x02);
    sub_0801F234(0x0C);
    sub_0801F234(0x2F);
    sub_0801F234(0x30);
    sub_0801F234(0x31);
    sub_0801F234(0x32);
    sub_0801F234(0x33);
    sub_0801F234(0x34);
    sub_0801F234(0x35);
    sub_0801F234(0x36);
    sub_0801F234(0x37);
    sub_0801F234(0x38);
    sub_0801F234(0x3C);
}

void sub_0800376C(void)
{
    DrawOamObject(0x31, 0x18, 0x420, 0, 0);
    DrawOamObject(0x32, 0x18, 0x430, 0, 0);
    DrawOamObject(0x33, 0x18, 0x440, 0, 0);
}

/* MATCHED. Byte-for-byte the same function as sub_08003704 -- same blob, same
 * fourteen ids, same order. */
void sub_080037AC(void)
{
    sub_0801F150(0, (void *)0x06010000, 0x28D, 0x1D);
    sub_0801F234(0x02);
    sub_0801F234(0x0C);
    sub_0801F234(0x2F);
    sub_0801F234(0x30);
    sub_0801F234(0x31);
    sub_0801F234(0x32);
    sub_0801F234(0x33);
    sub_0801F234(0x34);
    sub_0801F234(0x35);
    sub_0801F234(0x36);
    sub_0801F234(0x37);
    sub_0801F234(0x38);
    sub_0801F234(0x3C);
}

void sub_08003814(void)
{
    int x;
    int t;

    x = gActiveMap->panelSide == 0 ? 2 : 0xCE;
    t = x & 0x1FF;
    DrawOamObject(0x91, t, 0xE, 0, 0);
    DrawOamObject(0x90, t, 0x18, 0, 0);
    t = (x + 0x18) & 0x1FF;
    sub_0802BD54(t, 0xE, gActiveMap->cursorX + 1);
    sub_0802BD54(t, 0x18, gActiveMap->cursorY + 1);
}

/* MATCHED, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D784"]
 * in this function's data/promoted.json entry. 0x0808D784 is agbcc's own
 * -fforce-addr word holding &gActiveMap (dereferenced in baserom.gba),
 * not a global of the original source, so the honest spelling is used here.
 *
 * unk42 is s16, and this function is what proves it: `movs r0,#0;
 * ldrsh r3,[r1,r0]` and then compares against -2, -3 and -10.
 *
 * `v = *q; v = <ternary on v>;` is deliberate. Folding the load into the
 * ternary (`v = *q >= -2 ? -2 : *q + 1;`) permutes r0/r3 through both arms and
 * drops the ROM's `adds r3, r0, #0` copy at the merge -- 47.7% instead of a
 * match. The `s16 *q` local is what keeps the `strh` on the pointer the arms
 * built rather than reloading the global before the store. */

void sub_08003890(void)
{
    s16 * q;
    int v;
    int t;

    if (gActiveMap->flags & 8)
    {
        q = &gActiveMap->introScreenY;
        v = *q;
        v = v >= -2 ? -2 : v + 1;
    }
    else
    {
        q = &gActiveMap->introScreenY;
        v = *q;
        v = v < -10 ? -10 : v - 1;
    }

    *q = v;

    if (v > -3)
    {
        t = gActiveMap->panelSide == 0 ? 0x20 : 0xD0;
        DrawOamObject(0x8E, (t - 0x20) & 0x1FF,
                     (u8)gActiveMap->introScreenY, 0, 0);
        sub_08003814();
    }
}

void sub_08003910(void)
{
    sub_080152EC(gUnknown_08485D8C, 0);
    gActiveMap->introScreenY = 0xFFF6;
}

void sub_08003934(void)
{
    gActiveMap->flags |= 8;
}

void sub_08003948(void)
{
    gActiveMap->flags &= ~8;
}

/* Family F001 forwarder, 12 bytes:
 *     push {lr}
 *     bl   <callee>
 *     pop  {r0}
 *     bx   r0
 * The `pop {r0}` fixes THIS function as void: it overwrites whatever
 * the callee returned, so nothing about the callee is visible from
 * here. Everything below was read off the callee's own body instead.
 *
 * The callee reads no argument register before writing it, so there
 * is no parameter to pass through either.
 */
void sub_08003960(void)
{
    sub_080039E4();
}

void sub_0800396C(void)
{
    int v = gUnknown_03001FFC + 1;

    if (v > 6)
    {
        v = 6;
        sub_08015C30(gUnknown_03001FBC);
    }

    gUnknown_03001FFC = v;
}

void sub_08003994(void)
{
    int v = gUnknown_03001FFC - 1;

    if (v <= 0)
    {
        v = 0;
        sub_08015C30(gUnknown_03001FBC);
    }

    gUnknown_03001FFC = v;
}

/* F002: `push {lr}; ldr r0,=g; movs r1,#0; bl sub_080152EC; pop {r0}; bx r0`.
 * One statement, result discarded -- `pop {r0}` makes the wrapper void.
 * sub_080152EC's first parameter is `const void *`, which takes the
 * `const u8 []` blob with no cast; a plain `void *` would discard the const and
 * -Werror turns that into an error. src/decomp/c_0802BF80.c is the matched
 * exemplar for this shape. */
void sub_080039BC(void)
{
    sub_080152EC(gUnknown_08485DB4, 0);
}

/* F002: `push {lr}; ldr r0,=g; movs r1,#0; bl sub_080152EC; pop {r0}; bx r0`.
 * One statement, result discarded -- `pop {r0}` makes the wrapper void.
 * sub_080152EC's first parameter is `const void *`, which takes the
 * `const u8 []` blob with no cast; a plain `void *` would discard the const and
 * -Werror turns that into an error. src/decomp/c_0802BF80.c is the matched
 * exemplar for this shape. */
void sub_080039D0(void)
{
    sub_080152EC(gUnknown_08485D9C, 0);
}

/* Display/blend shadow setup. Every 030030E0 access here is ldrb/strb, so this
 * function has NO raw-halfword write at all -- the two target groups are
 * eleven single-bit `.bits` assignments that agbcc merges into one
 * read-modify-write per byte. `effect = 3` is the all-ones case, so it drops
 * the AND (store_fixed_bit_field's all_one) and emits a bare `orr #0xc0`.
 *
 * The `~1` mask built for target1_enable_bg0 = 0 survives in r1 and is reused
 * for target2_enable_bg0 = 0 at byte 1; that reuse is what pins the two clears
 * as the first statement of each group. */
void sub_080039E4(void)
{
    sub_08012358();

    gUnknown_030030E0.bits.effect = 3;
    gUnknown_030030E0.bits.target1_enable_bg0 = 0;
    gUnknown_030030E0.bits.target1_enable_bg1 = 1;
    gUnknown_030030E0.bits.target1_enable_bg2 = 1;
    gUnknown_030030E0.bits.target1_enable_bg3 = 1;
    gUnknown_030030E0.bits.target1_enable_obj = 1;
    gUnknown_030030E0.bits.target2_enable_bg0 = 0;
    gUnknown_030030E0.bits.target2_enable_bg1 = 0;
    gUnknown_030030E0.bits.target2_enable_bg2 = 0;
    gUnknown_030030E0.bits.target2_enable_bg3 = 0;
    gUnknown_030030E0.bits.target2_enable_obj = 0;

    gUnknown_03001FFC = 0;
    gUnknown_03002020 = 0x10;
    gUnknown_03002B28 = 0;

    gDispIo.disp_ct.win0_enable = 0;
    gDispIo.disp_ct.win1_enable = 0;

    gUnknown_03002B40 = 0;
    gUnknown_03002B4C = 0;
    gUnknown_03002EFC = 0xA0;
    gUnknown_03002B44 = 0xA0;
}

/* The parameterised sibling of sub_080039E4: same prologue call, same blend
 * groups with different constants, then the four u8 globals take arguments
 * rather than literals.
 *
 * All four parameters are `int`. The prologue masks nothing (`mov sl,r0;
 * adds r7,r1,#0; mov sb,r2; str r3,[sp]`), and PROMOTE_MODE would have forced
 * a shift pair or an `ands` on any u8/u16 parameter -- so the `strb` at each
 * use is the narrowing into the u8 global, not a parameter width.
 *
 * `gUnknown_03001FFC = v = 0;` is load-bearing and is the whole 4 bytes. The
 * ROM keeps ONE zero pseudo in r4 spanning 03001FFC, 03002B28 and the
 * `gUnknown_030030DC` halfword clear; written as three separate `0` literals
 * the third zero is rematerialised, the allocator re-shuffles, and the
 * candidate comes out 4 bytes SHORT (232) because #2 then wins the callee-saved
 * register the ROM spends on the zero. Same lever as c_08037260.c.
 *
 * The DC halfword clear was probed BOTH ways -- `.raw = v` and
 * `*(u16 *)&gUnknown_030030DC = v` -- and they are byte-identical here despite
 * a live zero being the value stored. See the wave-23 blend-shadow section of
 * docs/agbcc-codegen.md. */
void sub_08003A80(int a1, int a2, int a3, int a4)
{
    u16 v;

    sub_08012358();

    gUnknown_030030E0.bits.effect = 3;
    gUnknown_030030E0.bits.target1_enable_bg1 = 0;
    gUnknown_030030E0.bits.target1_enable_bg2 = 0;
    gUnknown_030030E0.bits.target1_enable_bg3 = 1;
    gUnknown_030030E0.bits.target1_enable_obj = 1;
    gUnknown_030030E0.bits.target2_enable_bg1 = 1;
    gUnknown_030030E0.bits.target2_enable_bg2 = 1;
    gUnknown_030030E0.bits.target2_enable_bg3 = 1;
    gUnknown_030030E0.bits.target2_enable_obj = 1;

    gUnknown_03001FFC = v = 0;
    gUnknown_03002020 = 0x10;
    gUnknown_03002B28 = v;

    gDispIo.disp_ct.win0_enable = 1;

    gUnknown_03002B40 = a1;
    gUnknown_03002B4C = a2;
    gUnknown_03002EFC = a3;
    gUnknown_03002B44 = a4;

    gUnknown_030030A4.bits.win0_enable_bg0 = 1;
    gUnknown_030030A4.bits.win0_enable_bg1 = 1;
    gUnknown_030030A4.bits.win0_enable_bg2 = 1;
    gUnknown_030030A4.bits.win0_enable_bg3 = 1;
    gUnknown_030030A4.bits.win0_enable_obj = 1;
    gUnknown_030030A4.bits.win0_enable_blend = 1;

    gUnknown_030030DC.raw = v;
    gUnknown_030030DC.bits.win0_enable_bg0 = 1;
    gUnknown_030030DC.bits.win0_enable_bg2 = 1;
    gUnknown_030030DC.bits.win0_enable_bg1 = 1;
    gUnknown_030030DC.bits.win0_enable_bg3 = 1;
    gUnknown_030030DC.bits.win0_enable_obj = 1;
    gUnknown_030030DC.bits.win0_enable_blend = 0;
}

int RandRange(int a, int b)
{
    return (DivRem(GetNextRandomNumber(), (a - b) * 32) >> 5) + b;
}

asm(".global sub_08003B6C\n.thumb_set sub_08003B6C, RandRange\n");

/* MATCHED, wave 40 (W40-A). Needs its .rodata pool word placed:
 *   "rodata": ["0x0808D788"]
 * -- the ROM word there holds &gActiveMap, so writing the global's name
 * honestly is correct and trymatch reports only the symbol-naming artefact.
 *
 * Resets the map header to 30 x 20, rebuilds the +0x417A row-offset table, and
 * then picks a fill routine from the L/R key pair. Two notes worth keeping:
 *   - the row-offset loop has NO entry guard because the `strh #0x14` two
 *     statements earlier is CSE'd into the guard's load, folding `0 < 20` away.
 *     It is an ordinary `for`, not a do/while.
 *   - the key word is gpKeySt->held (offset 0), NOT ->held (offset 4). unk00
 *     is the mask hardware.h already documents as carrying 0x200 (L) and
 *     0x100 (R), which is exactly the 0x300 tested here. */


void GenerateRandomMap(void)
{
    int i;
    int keys;

    ClearAllUnits();
    gActiveMap->army1UnitCount = 0;
    MAP->width = 0x1E;
    MAP->height = 0x14;
    MAP->unk10 = 0;
    for (i = 0; i < MAP->height; i++)
        MAP->rowOffset[i] = i * MAP->width;

    keys = gpKeySt->held & (R_BUTTON | L_BUTTON);
    if (keys == (R_BUTTON | L_BUTTON))
    {
        sub_08004724();
        FixAllShorelines();
    }
    else if (keys == L_BUTTON)
    {
        sub_080040C8();
        FixAllShorelines();
    }
    else if (keys == R_BUTTON)
    {
        sub_0800449C();
        FixAllShorelines();
    }
    else if (DivRem(GetNextRandomNumber(), 100) > 0x1D)
    {
        sub_080040C8();
        FixAllShorelines();
    }
    else
    {
        sub_0800449C();
        FixAllShorelines();
    }

    RecountArmyProperties();
    RegisterArmyHqs();
    gActiveMap->propertyCount = CountProperties();
}

asm(".global sub_08003B8C\n.thumb_set sub_08003B8C, GenerateRandomMap\n");

void sub_08003C48(int a1)
{
    int x, y;

    if (a1 < 0)
    {
        GenerateRandomMap();
        return;
    }

    ClearAllUnits();
    gActiveMap->army1UnitCount = 0;

    for (x = 0; x < MAP->height; x++)
        MAP->rowOffset[x] = x * MAP->width;

    for (y = 0; y < MAP->height; y++)
    {
        for (x = 0; x < MAP->width; x++)
        {
            switch (a1)
            {
            case 7:
                MAP->tile[MAP->rowOffset[y] + x] = 0x2A;
                MAP->terrain[MAP->rowOffset[y] + x] = a1;
                break;
            case 1:
                MAP->tile[MAP->rowOffset[y] + x] = a1;
                MAP->terrain[MAP->rowOffset[y] + x] = 1;
                break;
            case 3:
                SetTerrainAt(x, y, 3);
                MakeMountain(x, y);
                break;
            case 4:
                MAP->tile[MAP->rowOffset[y] + x] = 0x87;
                MAP->terrain[MAP->rowOffset[y] + x] = a1;
                break;
            }
        }
    }

    RecountArmyProperties();
    RegisterArmyHqs();
    gActiveMap->propertyCount = CountProperties();
}

/* MATCHED, wave 36 (W36-I), after five waves parked at 93.7%. PROMOTION NEEDS
 * THE POOL WORD PLACED:
 *     "rodata": ["0x0808D794"]
 * (two references, both to the same word, which holds &gUnknown_08499590.)
 *
 * THE OLD PARK NOTE WAS WRONG and this replaces it. It described the residual
 * as "a pure register permutation ... nothing in the C distinguishes them" and
 * listed the axes it had ruled out -- all of them about `u8 *` arithmetic on
 * the map (`cells` locals, `*(p + K + idx)`, a permuter run). The axis that
 * mattered was not in the list because it did not exist yet when the note was
 * written: the planes must be reached as MEMBERS of a struct cast onto
 * gUnknown_08499590 (W34-F's rule), and the cast must stay INLINE rather than
 * being bound to a `map` local. A local keeps the pseudo live to the end of
 * its scope, so agbcc preserves the base (`mov rT,ip; adds rD,rBase,rT`) where
 * the ROM advances it (`add rBase,ip`) -- that pair IS the advance-vs-preserve
 * difference the old note called indistinguishable.
 *
 * The last 24 bytes were scope, not allocation luck: `int idx;` at function
 * scope is one allocno shared by four disjoint blocks and lands in r3 where
 * the ROM uses r1/r0. Block-scope declarations in the two case-7 arms that
 * need the `+1`/`-1` sequenced (`idx = row; idx++; idx += x;`, which also
 * stops `x + 1` being CSEd with the call argument) plus plain inline
 * expressions in the two case-1 arms is what matches. Mixing the two styles is
 * what the register numbers read out, not an inconsistency.
 *
 * `ands r2, r4` in the case-1 arm is `x & 1` with agbcc substituting the
 * switch register, which cse knows equals 1 after `cmp r2,#1; beq`. */


void FixShorelineAt(int x, int y, int kind)
{
    switch (kind)
    {
    case 7:
        if (x < MAP->width - 1)
        {
            int idx;

            idx = MAP->rowOffset[y];
            idx++;
            idx += x;
            if (MAP->terrain[idx] == 1 || MAP->terrain[idx] == 0xD)
                sub_08007F9C(x + 1, y);
        }
        if (x > 0)
        {
            int idx;

            idx = MAP->rowOffset[y];
            idx--;
            idx += x;
            if (MAP->terrain[idx] == 1 || MAP->terrain[idx] == 0xD)
                sub_08007F9C(x - 1, y);
        }
        break;

    case 1:
        if (x & 1)
        {
            if (y > 0)
            {
                if (MAP->terrain[MAP->rowOffset[y - 1] + x] == 7
                 || MAP->terrain[MAP->rowOffset[y - 1] + x] == 0xD)
                    sub_08007F9C(x, y);
            }
            if (y < MAP->height - 1)
            {
                if (MAP->terrain[MAP->rowOffset[y + 1] + x] == 7
                 || MAP->terrain[MAP->rowOffset[y + 1] + x] == 0xD)
                    sub_08007F9C(x, y);
            }
        }
        break;

    case 3:
        sub_0800AF74(x, y);
        break;
    }
}

asm(".global sub_08003DC4\n.thumb_set sub_08003DC4, FixShorelineAt\n");

/* MATCHED, wave 40 (W40-A). Redraws every cell of the map: for each row, for
 * each column, hand FixShorelineAt the cell's terrain byte off the +0x1432 array,
 * indexed the way every other reader in this block indexes it -- through the
 * +0x417A row-offset table. */


void FixAllShorelines(void)
{
    int x, y;

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
            FixShorelineAt(x, y, MAP->terrain[MAP->rowOffset[y] + x]);
}

asm(".global sub_08003ED0\n.thumb_set sub_08003ED0, FixAllShorelines\n");

void sub_08003F44(int x, int y, int v)
{
    if (x > 0x1D)
        x = 0x1D;
    if (y > 0x13)
        y = 0x13;

    MAP->tile[MAP->rowOffset[y] + x] = v;

    switch (v)
    {
    case 1:
        MAP->terrain[MAP->rowOffset[y] + x] = v;
        break;
    case 0x20:
        MAP->terrain[MAP->rowOffset[y] + x] = 3;
        break;
    case 0x87:
        if (MAP->terrain[MAP->rowOffset[y] + x] != 4)
        {
            MAP->terrain[MAP->rowOffset[y] + x] = 4;
            MAP->tile[MAP->rowOffset[y] + x] = v;
            MakeForest(x, y);
        }
        break;
    case 0x2A:
        MakeSeaSafest(x, y);
        break;
    }
}

void sub_0800401C(int cx, int cy, int w, int h, int t)
{
    register int hh asm("r9") = h;
    register int tt asm("r10") = t;
    register int rx asm("r4");
    int y;
    int x;
    int ry;
    int ny;
    y = cy - (hh >> 1);
    if (y < 0)
        y = 0;
    for (ry = hh; ry > 0; ry--)
    {
        x = cx - (w >> 1);
        if (x < 0)
            x = 0;
        rx = w;
        ny = y + 1;
        for (; rx > 0; rx--)
        {
            if (w <= 3 && hh <= 3)
            {
                if (w == 3)
                    sub_08003F44(x, y, tt);
            }
            else if (((ry == hh) || (ry == 1)) && ((rx == w) || (rx == 1)))
            {
            }
            else
            {
                sub_08003F44(x, y, tt);
            }
            x++;
            {
                register struct Map *map asm("r0") = gMap;
                if (x >= map->width)
                    break;
            }
        }
        y = ny;
        {
            register struct Map *map asm("r0") = gMap;
            if (y >= map->height)
                break;
        }
    }
}

void sub_080040C8(void)
{
    int x, y;
    int i, n;
    int lim, cnt;
    int a, b, w, h;
    int t;
    int r;

    t = 7;
    for (y = 0; y < MAP->height; y++)
    {
        for (x = 0; x < MAP->width; x++)
        {
            MAP->tile[MAP->rowOffset[y] + x] = 0x2A;
            MAP->terrain[MAP->rowOffset[y] + x] = t;
        }
    }

    n = RandRange(0xC, 8);
    for (i = n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(0xA, 2);
        h = RandRange(0xC - w, 2);
        sub_0800401C(a, b, w, h, 1);
    }

    n = RandRange(0xC, 8);
    for (i = n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(0xA, 4);
        h = RandRange(0xE - w, 4);
        sub_0800401C(a, b, w, h, 1);
    }

    lim = RandRange(0x32, 0x28);
    cnt = 0;
    for (i = 100; i > 0; i--)
    {
        a = RandRange(0x1A, 4);
        b = RandRange(0x10, 4);
        if (MAP->terrain[MAP->rowOffset[b] + a] == 1)
        {
            SetTerrainAt(a, b, 3);
            MakeTile2(a, b, 0x20);
            cnt++;
        }
        if (cnt > lim)
            break;
    }

    n = RandRange(6, 3);
    for (i = n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(4, 1);
        h = RandRange(5 - w, 1);
        sub_0800401C(a, b, w, h, 0x20);
    }

    n = 7 - n;
    for (i = n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(4, 2);
        h = RandRange(6 - w, 2);
        sub_0800401C(a, b, w, h, 0x20);
    }

    lim = RandRange(0x32, 0x28);
    cnt = 0;
    for (i = 0x32; i > 0; i--)
    {
        a = RandRange(0x1A, 4);
        b = RandRange(0x10, 4);
        if (MAP->terrain[MAP->rowOffset[b] + a] == 1)
        {
            SetTerrainAt(a, b, 4);
            MakeTile2(a, b, 0x87);
            cnt++;
        }
        if (cnt > lim)
            break;
    }

    lim = RandRange(0x32, 0x28);
    cnt = 0;
    for (i = 100; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        if (sub_0800BCD0(a, b) != 0)
        {
            SetTerrainAt(a, b, 0x13);
            MakeTile2(a, b, 0x168);
            cnt++;
        }
        if (cnt > lim)
            break;
    }

    for (y = 1; y < MAP->height - 1; y++)
    {
        for (x = n = 1; x < MAP->width - 1; x++)
        {
            if (RandRange(0xC8, 0x64) > 0x95
             && MAP->terrain[MAP->rowOffset[y] + x] == 1)
            {
                if (MAP->terrain[MAP->rowOffset[y - 1] + x] == 7)
                    sub_0800BA9C(x, y - 1);
                if (MAP->terrain[MAP->rowOffset[y + 1] + x] == 7)
                    sub_0800BA9C(x, y + 1);
                r = MAP->rowOffset[y] - 1;
                if (MAP->terrain[r + x] == 7)
                    sub_0800BA9C(x - 1, y);
                r = MAP->rowOffset[y] + 1;
                if (MAP->terrain[r + x] == 7)
                    sub_0800BA9C(x + 1, y);
            }
        }
    }
}

void sub_0800449C(void)
{
    int x, y;
    int i, n;
    int lim, cnt;
    int a, b, w, h;
    int t;

    t = 7;
    for (y = 0; y < MAP->height; y++)
    {
        for (x = 0; x < MAP->width; x++)
        {
            MAP->tile[MAP->rowOffset[y] + x] = 0x2A;
            MAP->terrain[MAP->rowOffset[y] + x] = t;
        }
    }

    for (i = RandRange(0x1E, 0x19); i > 0; i--)
    {
        a = RandRange(0x1E, 0);
        b = RandRange(0x1E, 0);
        w = RandRange(0xA, 6);
        h = RandRange(0x10 - w, 6);
        sub_0800401C(a, b, w, h, 1);
    }

    for (i = RandRange(0x1E, 0x19); i > 0; i--)
    {
        a = RandRange(0x1E, 0);
        b = RandRange(0x1E, 0);
        w = RandRange(0xC, 4);
        h = RandRange(0x10 - w, 4);
        sub_0800401C(a, b, w, h, 1);
    }

    lim = RandRange(100, 90);
    cnt = 0;
    for (i = 100; i > 0; i--)
    {
        a = RandRange(0x1D, 0);
        b = RandRange(0x13, 0);
        if (MAP->terrain[MAP->rowOffset[b] + a] == 1)
        {
            SetTerrainAt(a, b, 3);
            MakeTile2(a, b, 0x20);
            cnt++;
        }
        if (cnt > lim)
            break;
    }

    n = RandRange(0xA, 7);
    for (i = n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(4, 2);
        h = RandRange(6 - w, 2);
        sub_0800401C(a, b, w, h, 0x20);
    }

    for (i = 12 - n; i > 0; i--)
    {
        a = RandRange(0x1C, 2);
        b = RandRange(0x12, 2);
        w = RandRange(4, 2);
        h = RandRange(6 - w, 2);
        sub_0800401C(a, b, w, h, 0x20);
    }

    lim = RandRange(100, 0x50);
    cnt = 0;
    for (i = 100; i > 0; i--)
    {
        a = RandRange(0x1A, 4);
        b = RandRange(0x10, 4);
        if (MAP->terrain[MAP->rowOffset[b] + a] == 1)
        {
            SetTerrainAt(a, b, 4);
            MakeTile2(a, b, 0x87);
            cnt++;
        }
        if (cnt > lim)
            break;
    }
}
