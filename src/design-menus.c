#include "global.h"
#include "hardware.h"
#include "map.h"

/* Design-room code at 0x08004724..0x08004D8F; grouped at a literal-pool boundary. */

#define MAP gMap

/* MATCHED, wave 42 (W42-B2), via decomp-permuter from a 57.4% size-exact
 * hand draft. PROMOTION NEEDS THE .rodata POOL WORD PLACED -- add
 *     "rodata": ["0x0808D7A8"]
 * to this function's data/promoted.json entry, then re-run
 * tools/split_rodata.py and tools/gen_lds.py before building. trymatch
 * reports `relocs: name different symbols that resolve to the same address`,
 * which is the false-mismatch case, not a difference.
 *
 * The two levers, both of which the permuter found and neither of which was
 * on the wave-40 draft's list of things to try:
 *   - `m = MAP;` INSIDE the inner loop body, used for the two stores' bases
 *     while the rowOffset reads still go through the global expression. The
 *     residual was that agbcc kept the -fforce-addr .rodata word's ADDRESS
 *     live in sl for the whole function so pass 2's guard could re-read it;
 *     splitting the address's uses this way lets pass 2 re-materialise the
 *     plain .text pool word as the ROM does, and the freed register pays for
 *     hoisting 0x417A.
 *   - `c = 7;` before the loops rather than the literal at the store. A named
 *     constant local lands in a different register (`movs r5,#7` and not
 *     `movs r0,#7`) -- the same family as the wave-23 named-constant rule.
 *
 * What was already right and is worth keeping: the ROM materialises
 * &gUnknown_08499590 TWICE by two different routes and BOTH belong. -fforce-addr
 * parks the address in this unit's own .rodata (the word the ROM has at
 * 0x0808D7A8, immediately behind gUnknown_0808D7A0's 8 bytes) and pass 1's
 * outer guard reads through it, while pass 1's body and all of pass 2 use a
 * plain .text pool word holding the symbol. The honest spelling below produces
 * both; no c_local workaround is needed.
 */


void sub_08004724(void)
{
    u16 tiles[4];
    const u8 *p;
    struct Map *m;
    int x;
    int y;
    int c;

    sub_0808B6E8(tiles, gUnknown_0808D7A0, 8);
    c = 7;
    p = gUnknown_08486FC4;

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
        {
            m = MAP;
            m->tile[MAP->rowOffset[y] + x] = 0x2A;
            m->terrain[MAP->rowOffset[y] + x] = c;
        }

    for (y = 0; y < MAP->height; y++)
        for (x = 0; x < MAP->width; x++)
            sub_08003F44(x, y, tiles[*p++]);
}

/* Family F003 (data/families.json): 34 twelve-byte forwarders shaped
 * `push {lr}; movs r0,#K; bl S; pop {r0}; bx r0`, i.e. one call with one
 * literal argument and nothing else. `pop {r0}; bx r0` fixes this as void.
 * The argument's C type is not recoverable from here -- `movs r0,#K` is the
 * same two bytes for int/u32/u16/s16/u8 -- so the spelling follows the
 * callee's declaration in unknown-functions.h and nothing else.
 * Exemplar: src/decomp/c_08004A60.c. */

void sub_08004818(void)
{
    sub_0800056C(1);
}

/* Family F055 (data/families.json): `push {lr}; movs r0,#K; bl A; movs r0,#1;
 * bl B; pop {r0}; bx r0` -- 20 bytes, three members. `varies` covers index 1
 * (the first immediate) and the two `bl` targets; index 3 is absent, so the
 * `movs r0, #1` is byte-identical across all three.
 *
 * Two independent calls with their arguments materialised in front of each --
 * no nesting is possible, both callees have their r0 written by a `movs`.
 * `pop {r0}` is the void epilogue.
 */


/* 0x66 is a sound id: sub_0803B4DC is the sound-request wrapper matched in this
 * same wave as a member of family F066, and its `int` parameter is the one
 * already declared in include/unknown-functions.h. Passing a literal into it is
 * an independent check on that reading -- and the check is that this call site
 * does NOT constrain the width at all, since `int`, `s16` and `u16` are
 * byte-identical for a `movs`-sized constant. That is why the width had to be
 * settled from sub_08016104/sub_08016130 and src/proc.c instead.
 */

void sub_08004824(void)
{
    sub_0803B4DC(0x66);
    sub_0800056C(1);
}

int sub_08004838(void)
{
    return 0;
}

/* Family F056 (data/families.json): `push {lr}; bl A; movs r0,#K; bl B;
 * pop {r0}; bx r0` -- 16 bytes, three members, and the three agree on nothing
 * but the shape: `varies` gives three distinct first callees, two distinct
 * immediates and three distinct second callees. Callee A's result (if it has
 * one) is discarded, because B's r0 is loaded by the `movs`.
 * `pop {r0}` is the void epilogue.
 */


/* sub_0801A168 is `int(void)` and its result is discarded -- the ROM does not
 * settle its return width (see include/unknown-functions.h), and it does not
 * matter here because nothing narrows after the `bl`. src/decomp/c_0800484C.c
 * and eight other promoted files spell the same discarded call.
 *
 * The second callee is shared with family F056's other side of the batch:
 * sub_0800056C is called with `movs r0, #1` here and in sub_08004824 (F055).
 * Verified per member rather than assumed -- the other two F056 members call
 * sub_08034308 and sub_0806CC00 instead.
 */

void sub_0800483C(void)
{
    sub_0801A168();
    sub_0800056C(1);
}

/* Family F005 (data/families.json): 19 sixteen-byte wrappers shaped
 * `push {lr}; bl S; bl S; pop {r0}; bx r0` -- two calls, nothing between
 * them, `pop {r0}` so void.
 * Two statements and not `g(f())`: the second callee takes no arguments (it
 * opens with a `bl`, a pool `ldr` or a `movs` into r0, never a read of r0),
 * so there is no parameter for the first call's result to reach. `g(f())`
 * would be byte-identical only if `g` had a parameter, and none of the 19
 * second callees does -- see the F005 block in unknown-functions.h. */

void sub_0800484C(void)
{
    sub_0801A168();
    sub_0800485C();
}

void sub_0800485C(void)
{
    sub_0801A664();
    sub_0803B4DC(0x66);
    gActiveMap->mode = 3;
    sub_08004C5C();
}

void sub_0800487C(void)
{
    struct Unk03001470 * p;

    p = &gUnknown_03001470[gUnknown_03001FBC];

    if (sub_0808B694(&p->unk1e, gActiveMap->designName))
        gActiveMap->flags |= 0x1000;

    sub_08023348();
    sub_0803662C();
    sub_08024268();
    sub_08024830();
    sub_08002DEC();
}

/* Copies the up-to-19-byte NUL-terminated name at gActiveMap->designName
 * into the current gUnknown_03001470 slot at +0x1e, then hands the source to
 * sub_0804B10C. sub_0800487C (already promoted) strcmps the same two
 * addresses, which corroborates both as strings.
 *
 * THE 0x9c NAME FIELD IS AN ARRAY IN THE ORIGINAL SOURCE, and that is a
 * measured claim, not a guess: the ROM computes `g + 0x9c` and THEN adds `i`,
 * which is the ARRAY_REF tree. The old scalar-plus-padding declaration instead
 * reassociated the address as `g + i + 0x9c` and missed by one swapped pair.
 * The extent is exact rather than assumed: 0x9c..0xae is the 0x13 bytes this
 * loop copies. The shared declaration now records that measured array.
 *
 * struct Unk03001470 has the same problem at the destination end and is also
 * left alone: 0x1e is typed `s16 unk1e` (a frame counter measured from
 * sub_0803B118's signed compare) and 0x20/0x22/0x24 are s16 indices with
 * independent `ldrsh` evidence, yet this loop writes 0x1e..0x30 as bytes across
 * all of them. Both readings have evidence, so the slot is a UNION -- wave 40's
 * W40-F reaches the same conclusion from the other side, calling its layout
 * `struct Unk8019A60` a gUnknown_03001470 slot OVERLAY.
 *
 * gActiveMap IS NAMED EXACTLY TWICE and both mentions are load-bearing:
 * THREE mentions crosses agbcc's -fforce-addr threshold and buys a .rodata
 * indirection the ROM does not have (+20 bytes, measured); ONE mention, bound
 * at the TOP of the body, lets LICM hoist it and loses both reloads (-4 bytes,
 * measured). The reload survives only because `q` is assigned AFTER the `strb`,
 * which is what kills the invariance.
 *
 * DO/WHILE, NOT `for`. With two exits -- the NUL break and the counter -- the
 * `for` spelling makes agbcc rotate the loop and emit the i == 0 iteration a
 * second time ahead of it, with `d[0]` folded to a `strb [p,#30]`
 * displacement: +20 bytes, measured. */
void sub_080048D4(void)
{
    struct Unk03001470 *p;
    u8 *d;
    u8 *q;
    int i;

    sub_08011B18();
    p = &gUnknown_03001470[gUnknown_03001FBC];
    i = 0;
    d = (u8 *)&p->unk1e;

    do
    {
        d[i] = gActiveMap->designName[i];
        q = gActiveMap->designName;
        if (q[i] == 0)
            break;
        i++;
    } while (i <= 0x12);

    sub_0804B10C((int)q, 8);
}

/* `adds rN, #0xae` before the `strb` is THUMB's byte-store immediate stopping
 * at 31, the same addressing-mode artefact unk6a and unk6b already carry -- not
 * a second object. */
void sub_0800492C(void)
{
    sub_0803B524(0xd8);
    sub_0800056C(1);
    gActiveMap->designName[0x12] = 0;
}

/* Family F003 (data/families.json): 34 twelve-byte forwarders shaped
 * `push {lr}; movs r0,#K; bl S; pop {r0}; bx r0`, i.e. one call with one
 * literal argument and nothing else. `pop {r0}; bx r0` fixes this as void.
 * The argument's C type is not recoverable from here -- `movs r0,#K` is the
 * same two bytes for int/u32/u16/s16/u8 -- so the spelling follows the
 * callee's declaration in unknown-functions.h and nothing else.
 * Exemplar: src/decomp/c_08004A60.c. */

void sub_0800494C(void)
{
    sub_0800056C(4);
}

/* Family F011: `push {lr}; bl f; ldr r0,=g; movs r1,#N; bl h; pop {r0}; bx r0`.
 * Two statements and NOT a nest -- r0 is overwritten by the pool `ldr` between
 * the two calls, so nothing can survive from the first one. `pop {r0}` is the
 * void epilogue.
 *
 * sub_0801A168 is nullary and its result is discarded. gUnknown_0848721C is a
 * gUnknown_03001470 script blob handed to the standard sub_080152EC installer
 * on tree 0. */
void sub_08004958(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848721C, 0);
}

void sub_08004970(void)
{
    sub_08002F1C();

    if ((gpKeySt->pressed & 7) != 0)
    {
        sub_08012BC8(gUnknown_08499580, 9, 2, 0xB, 0x11, 0x360);
        sub_08013B0C();
        sub_08002E5C();
        sub_08002E3C();
        sub_08015C30(gUnknown_03001FBC);

        if ((gpKeySt->pressed & 2) == 0)
            gUnknown_03002F1C = 1;
    }
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
void sub_080049DC(void)
{
    sub_08002FE4();
}

/* The two `strh`s share one `ldr r1, [r0]` because they are consecutive
 * statements with no call between them; `adds r2, r1, #0; adds r2, #0x46` then
 * `adds r1, #0x48` is the halfword-store immediate limit of 62, not two
 * separate loads. */
void sub_080049E8(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0800056C(6);
    sub_080152EC(gUnknown_084872B4, 0);
    gActiveMap->menuCursorX = 0x57;
    gActiveMap->menuCursorY = 0x10;
}

/* Family F005 (data/families.json): 19 sixteen-byte wrappers shaped
 * `push {lr}; bl S; bl S; pop {r0}; bx r0` -- two calls, nothing between
 * them, `pop {r0}` so void.
 * Two statements and not `g(f())`: the second callee takes no arguments (it
 * opens with a `bl`, a pool `ldr` or a `movs` into r0, never a read of r0),
 * so there is no parameter for the first call's result to reach. `g(f())`
 * would be byte-identical only if `g` had a parameter, and none of the 19
 * second callees does -- see the F005 block in unknown-functions.h. */

void sub_08004A20(void)
{
    sub_0801A168();
    sub_0800485C();
}

/* `int` and not a narrow parameter: the prologue saves r0 with a bare
 * `adds r4, r0, #0` across three calls, sub_08004A90 passes -1, and
 * sub_08003C48 tests the forwarded value with a signed `bge`. See
 * src/decomp/c_08004A60.c, which reads the same evidence from the other side.
 *
 * The `|=` is the aggregate-member operand swap its neighbour
 * src/decomp/c_08004BC0.c documents -- `orrs` with the CONSTANT's register as
 * the destination. */
void sub_08004A30(int a)
{
    sub_0801A168();
    sub_08003C48(a);
    sub_08002E3C();
    sub_08024268();
    gActiveMap->flags |= 0x1000;
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A60(void)
{
    sub_08004A30(7);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A6C(void)
{
    sub_08004A30(1);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A78(void)
{
    sub_08004A30(3);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A84(void)
{
    sub_08004A30(4);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A90(void)
{
    sub_08004A30(-1);
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AA0(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084873BC, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004ABC(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487404, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AD8(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848744C, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AF4(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487494, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004B10(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084874DC, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B2C(void)
{
    sub_080193B0(gUnknown_08487754);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B3C(void)
{
    sub_080193B0(gUnknown_084877F4);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B4C(void)
{
    sub_080193B0(gUnknown_08487894);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B5C(void)
{
    sub_080193B0(gUnknown_08487934);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B6C(void)
{
    sub_080193B0(gUnknown_084879D4);
}

void sub_08004B7C(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_0801B780(0x70);
    sub_0801A148(gUnknown_084872FC, 2, 2, 0);
    sub_0800056C(7);
    sub_08002DEC();
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x10;
}

/* `orr` with the constant's register as the destination -- the aggregate-member
 * `|=` operand swap, same as its neighbour sub_08003934.
 */
void sub_08004BC0(void)
{
    gActiveMap->flags |= 0x4000;
}

/* One `bl` with a selected argument, not two calls in two arms: the
 * unconditional `b` past the second `ldr` is the `?:` tell, and it also
 * explains why the literal pool splits in two here -- gUnknown_08487B64 sits in
 * the block after the `b`, gUnknown_08487AC4 in the one after the call. */
void sub_08004BD8(void)
{
    sub_0801A168();
    sub_0800056C(9);
    sub_080193B0((gActiveMap->flags & 0x1000) ? gUnknown_08487B64
                                                     : gUnknown_08487AC4);
}

void sub_08004C10(void)
{
    sub_080037AC();
    gActiveMap->state = 2;
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x18;
}

void sub_08004C34(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_08024268();
    sub_0801A148(gUnknown_08487C04, 2, 3, 0);
    sub_08004C10();
}

/* The pointer global is RELOADED between the first two stores even though no
 * call separates them (`ldr r1,[r4]` twice) -- a store through the pointer can
 * alias the pointer itself, so agbcc will not cache it. That is the ordinary
 * separate-statement shape and not a lever. */
void sub_08004C5C(void)
{
    gActiveMap->stateChanged = 0;
    gActiveMap->state = 1;
    sub_08003704();
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x10;
    sub_0801B780(0x70);
    sub_08022AD0(0x10, 0x10);
    sub_08001D9C();
    sub_08003948();
}

/* The seven-entry jump table is the load-bearing detail: agbcc only emits a
 * tablejump while the case nodes are still distinct, and `group_case_nodes`
 * merges adjacent cases sharing one body, so `case 3: ... case 7: break;`
 * collapses below the threshold and comes out as a three-compare tree. Giving
 * each of the five dead cases a body of its own keeps seven nodes alive; `flow`
 * then deletes the dead stores and cross-jumps the arms, which is why table
 * entries 2..6 all point at the epilogue. Same shape as sub_08020680. The
 * values stored are not recoverable -- only the fact that the five cases were
 * written out separately is. */
void sub_08004CA0(void)
{
    int x;

    if (gActiveMap->stateChanged != 0)
    {
        sub_08004C5C();
        sub_08024268();
        sub_0801A104(gUnknown_08487C84, 2, 2, 0);
    }

    switch (gActiveMap->state)
    {
    case 1:
        sub_080036A4();
        break;
    case 2:
        sub_0800376C();
        break;
    case 3:
        x = 1;
        break;
    case 4:
        x = 2;
        break;
    case 5:
        x = 3;
        break;
    case 6:
        x = 4;
        break;
    case 7:
        x = 5;
        break;
    }
}

void sub_08004D10(void)
{
    sub_08001D9C();
    sub_08003040();
    sub_080193B0(gUnknown_08487D44);
}

/* MATCHED, wave 36 (W36-I). This is the call site that RETYPED family F059:
 * sub_080055B8 / sub_08005634 / sub_080056B0 were promoted as `(void)` in
 * src/decomp/c_080055B8.c, but every one of the three `bl`s here is preceded
 * by `movs r0,#0; movs r1,#0; movs r2,#0`. All three parameters are unused in
 * the callees, which is exactly why `(void)` was byte-identical there and is
 * NOT evidence against them -- only a call site can prove an argument. The
 * three definitions were widened to `(int, int, int)`, re-verified with
 * try_match (all three still match), and declared in unknown-functions.h.
 *
 * The `(s8)` cast on the u8 member is the `ldrb; lsls #0x18; asrs #0x18` --
 * an s8 member at a constant offset would be `movs rN,#0x10; ldrsb`. */

void sub_08004D28(void)
{
    switch ((s8)gActiveMap->designSlot)
    {
    case 0:
        sub_080055B8(0, 0, 0);
        break;
    case 1:
        sub_08005634(0, 0, 0);
        break;
    case 2:
        sub_080056B0(0, 0, 0);
        break;
    }
}

/* Two pool words for one array element -- `ldr r2,=gTextTable;
 * ldr r3,=0x27E8; adds r2,r2,r3; ldr r2,[r2]` -- is `-fforce-addr` holding the
 * BASE address in its own register and then adding a byte offset too large for
 * `adds #imm8`. It is a constant subscript, not a variable one:
 * 0x27E8 / 4 == 0x9FA on the `u8 *[]` element type.
 *
 * Both parameters are pass-throughs, invisible here (no argument register is
 * written before the `bl`), and are read off sub_08004DD4. */
void sub_08004D74(int a, int b)
{
    sub_08004DD4(a, b, gTextTable[0x9fa], 0);
}
