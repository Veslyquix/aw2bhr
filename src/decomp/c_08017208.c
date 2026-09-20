#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017208.
 * sub_08017208 @ 0x08017208
 */

/* Wave 80 (W80-C): the y/x plane-copy loop's r0/r1 exchange was a SOURCE
 * CONSTRUCT -- the W77-K lever from sub_08052BBC: bind the integer BYTE
 * OFFSET early and reference the base late. `off = idx * 2;` as its own
 * statement creates the index chain's pseudo before the pool constant
 * (0xa22) and the gUnknown_03003F68 load, so the chain takes r1 and the
 * constants take r0 as the ROM has it. The destination stays the array
 * reference `unk0a22[idx]` (its `idx * 2` is CSE'd onto `off`): spelling the
 * destination as `(u8 *)unk0a22 + off` reassociates to (map + off) + 0xa22
 * and the source read is `*(u16 *)((u8 *)gUnknown_03003F68 + off + 2)`. */

/* WAVE 78 (W78-A): configured baseline reverified size-exact with 7 differing
 * bytes (99.2%). Reusing each dead int local a/b/v for the plane index and
 * reordering the int declarations were new allocator mechanisms; all were
 * worse (best alternative 97.7%), so the readable baseline is retained. */

/* WAVE 77, W77-B. Size-exact 916/916, now 7 bytes differ (99.2%) -- the
 * sentinel-replay loop noted below is byte-exact and the whole residual is
 * item 1. CLASSIFIED as NOT ORDER: twelve instructions in identical sequence,
 * every differing byte a register field of one r0/r1 exchange. +0x196 ldrh Rd,
 * +0x19A adds Rd/Rn, +0x19C lsls Rd/Rm, +0x19F ldr Rd, +0x1A0 adds Rm,
 * +0x1A2 adds Rm, +0x1A6 ldr Rd. ROM keeps the index chain in r1 and the pool
 * base in r0; this draft does the reverse.
 *
 * RULED OUT this wave: a comma operator creating the unk0a22 array base ahead
 * of the idx computation (7, unchanged); *(u16 *)((u8 *)gUnknown_03003F68 +
 * idx * 2 + 2) on the source read (7, unchanged); swapping the idx addends to
 * `y + ...unk417a[x]` (8, worse). Consistent with the wave-77 finding that
 * source-level commutative operand order is byte-neutral. */

/* WAVE 72 RERUN: configured remains size-exact at 916/916 and 97.1% (27 bytes
 * differ). A bounded fresh value-local and element-pointer split at the plane
 * copy changed the instruction grouping instead of only swapping r0/r1, so
 * the original fixpoint is retained; the prior 300-second permuter still
 * rules out generic allocation search.
 *
 * Wave 53, W53-B. PARKED. SIZE-EXACT at 916 bytes, every branch offset agrees
 * and the instruction stream is identical to the ROM's instruction for
 * instruction. The residual is purely which register each pseudo landed in, in
 * two places:
 *
 *   1. the y/x plane-copy loop: the ROM keeps the index chain in r1
 *      (`ldrh r1,[r0]` ... `adds r0,r0,r1` with the gUnknown_03003F68 pointer
 *      in r0), this keeps it in r0 with the pointer in r1. Same instructions,
 *      operands swapped. Spelling the read as
 *      `*(u16 *)((u8 *)gUnknown_03003F68 + 2 + idx * 2)` instead of
 *      `((u16 *)gUnknown_03003F68)[idx + 1]` emits byte-identical output, so
 *      the operand order is not reachable from the source here.
 *   2. the sentinel-replay loop: r3/r5/r6 where the ROM has r5/r6/r7.
 *
 * decomp-permuter, 300 s / 4 threads / ~14,500 iterations, found nothing.
 *
 * Everything else was derived and is confirmed byte-exact:
 *   - `gUnknown_030032D8 = 5 / 0xc` is an if/else with TWO stores (the ROM
 *     duplicates the `ldr =gUnknown_030032D8` in both arms and cross-jumps only
 *     the `strh`); a `?:` hoists the symbol load and drops the `b`.
 *   - `gUnknown_030033EC = v = p->unk0002;` as ONE statement is what puts the
 *     destination's pool word before the `ldrh`; two statements swap them.
 *     Same for `map->unk04 = a = p->unk0bb2;`, which is also what keeps the
 *     VALUE live for the later unk08/unk0a stores instead of the address.
 *   - gUnknown_03003F2C names gUnknown_030033EC and RELOADS it, while
 *     gUnknown_03004084 and gUnknown_03004480 use the bound value: the store to
 *     gUnknown_03004084 in between is what kills the CSE entry.
 *
 * The `.rodata` relocation against gUnknown_0808E554 is the -fforce-addr pool
 * word for &gPlaySt (0x0808E554 holds 0x03003FC0 in baserom.gba), not
 * a global and not a difference -- see work/sub_08016F38/. */

extern u8 gUnknown_02023284[];
void sub_080456B8(u8 *);
struct SaveBlkRec
{
    /* 0x00 */ u8 unk00;
    /* 0x01 */ u8 unk01;
    /* 0x02 */ u16 unk02;
};
struct SaveBlk
{
    /* 0x0000 */ u16 unk0000;
    /* 0x0002 */ u16 unk0002;
    /* 0x0004 */ struct Unk802C57C unk0004;
    /* 0x0008 */ struct Unk08499594 unk0008;
    /* 0x0014 */ u8 unk0014[0x140 - 0x14];
    /* 0x0140 */ u8 unk0140[0x48];
    /* 0x0188 */ struct Unk08499594 unk0188[4 * 51];
    /* 0x0b18 */ int unk0b18[4];
    /* 0x0b28 */ u8 filler_0b28[0xb98 - 0xb28];
    /* 0x0b98 */ struct Unk03002F08 unk0b98;
    /* 0x0ba0 */ void (*unk0ba0)(void);
    /* 0x0ba4 */ bool8 (*unk0ba4)(void);
    /* 0x0ba8 */ u32 unk0ba8;
    /* 0x0bac */ u8 unk0bac;
    /* 0x0bad */ u8 filler_0bad[1];
    /* 0x0bae */ u16 unk0bae;
    /* 0x0bb0 */ u16 unk0bb0;
    /* 0x0bb2 */ u16 unk0bb2;
    /* 0x0bb4 */ u16 unk0bb4;
    /* 0x0bb6 */ u16 unk0bb6;
    /* 0x0bb8 */ struct SaveBlkRec unk0bb8[(0xd28 - 0xbb8) / 4];
    /* 0x0d28 */ struct Unk02028360 unk0d28[16];
    /* 0x0da8 */ u8 unk0da8[4];
};

void sub_08017208(void)
{
    struct SaveBlk *p = (struct SaveBlk *)gUnknown_02000000;
    struct Map *map;
    s16 i, j, x, y;
    int idx, v, a, b, off;

    if (p->unk0bac)
        gUnknown_030032D8 = 5;
    else
        gUnknown_030032D8 = 0xc;
    gUnknown_03001FD4 = p->unk0ba8;
    gUnknown_030033E4 = p->unk0004;
    gUnknown_03004080 = p->unk0000;
    gUnknown_030033EC = v = p->unk0002;
    gUnknown_03004084 = v * 0x20;
    gUnknown_03003F2C = (gUnknown_030033EC - 1) * 0x40;
    gUnknown_03004480 = v;
    sub_0808B6E8(&gPlaySt, p->unk0140, 0x48);
    *(struct Unk08499594 *)gUnknown_03004490 = p->unk0008;
    gUnknown_0200C420.unk0e = gPlaySt.unk09;
    gUnknown_0200C420.unk14 = (gPlaySt.unk0c == 0);
    for (i = 0; i < 4; i++)
        gUnknown_030033F4[i] = p->unk0b18[i];
    gUnknown_03002F08 = p->unk0b98;
    gUnknown_03002F20 = p->unk0ba0;
    gUnknown_03001FF0 = p->unk0ba4;
    map = gMap;
    map->width = p->unk0bae;
    map->height = p->unk0bb0;
    map->scrollX = a = p->unk0bb2;
    map->scrollY = b = p->unk0bb4;
    map->camX = map->scrollX / 16;
    map->camY = map->scrollY / 16;
    map->unk08 = a;
    map->unk0a = b;
    map->unk10 = p->unk0bb6;
    if (gPlaySt.mapID < 0xb4 || gPlaySt.mapID > 0xbf)
    {
        gMap->unk4233 = sub_0802490C(gPlaySt.mapID);
        sub_0803CC84(gMap->unk421a,
                     sub_08024944(gPlaySt.mapID));
        sub_080247A4(gPlaySt.mapID);
        sub_080215FC();
        for (y = 0; y < gMap->width; y++)
        {
            for (x = 0; x < gMap->height; x++)
            {
                idx = gMap->rowOffset[x] + y;
                off = idx * 2;
                gMap->tile[idx] =
                    *(u16 *)((u8 *)gUnknown_03003F68 + off + 2);
            }
        }
        sub_0802481C();
    }
    if (gPlaySt.mapID < 0xb4 || gPlaySt.mapID > 0xbf)
    {
        for (i = 0; p->unk0bb8[i].unk02 != 0xffff; i++)
        {
            gMap->tile[
                gMap->rowOffset[p->unk0bb8[i].unk01]
                + p->unk0bb8[i].unk00] = p->unk0bb8[i].unk02;
        }
    }
    for (i = 0; i < 5; i++)
        sub_0808B6E8(&gUnknown_02023284[i * 0x3c], (u8 *)p + i * 0x3c + 0x14, 0x3c);
    for (i = 0; i < 4; i++)
        for (j = 0; j < 51; j++)
            gUnknown_02022684[i * 64 + j] = p->unk0188[i * 51 + j];
    for (i = 0; i < 16; i++)
        gUnknown_02028360[i] = p->unk0d28[i];
    sub_080456B8(p->unk0da8);
}
