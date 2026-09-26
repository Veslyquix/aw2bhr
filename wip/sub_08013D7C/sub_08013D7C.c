#include "global.h"

/* WAVE 78 (W78-A): configured baseline reverified at 624/628 (-4), 73.1%.
 * A block-local `i2 = i * 2` with an empty-asm anchor was the new mechanism
 * tried for the missing pair. A read/write anchor was optimized back to this
 * baseline; an input-only anchor changed allocation globally and regressed to
 * 620/628 (15.1%). The readable baseline is retained. */

/* Wave 77 (W77-C): configured baseline reverified at 624/628 (-4), 73.1%.
 *
 * THE -4 IS ONE INSTRUCTION PAIR AND THE DIFF NAMES IT. Reading the diff with
 * branch lines KEPT (they are needed -- the arms all end in `b`), the ROM's
 * `tiles = gUnknown_0808F380[1]` arm emits `mov r2, r8; lsls r4, r2, #1`
 * (i * 2) of its own before its `b`, and the candidate branches straight out.
 * That pair is the whole 4 bytes.
 *
 * The same fact shows up size-neutrally in three more places, and it is ONE
 * fact: the ROM computes `i * 2` BEFORE `base * 2` in the `g[2]` arm, in the
 * table-scan arm and in the 'M' block, and the candidate computes `base * 2`
 * first. The shared tail then differs only in commutative operand order,
 * `adds r3, r4, r3` against `adds r3, r3, r4`, and likewise `adds r2, r2, r0`
 * against `adds r2, r0, r2` for `q = idx + tiles`. C cannot reach the second
 * of those: `pointer_int_sum` builds `PLUS_EXPR (ptr, int)` whichever order the
 * source writes, so `idx + tiles` and `tiles + idx` are the same tree.
 *
 * RULED OUT this wave, no byte changed: fresh `e2`/`n2` locals in the second
 * 'C' arm (wave 54's fresh-name-per-site rule). The two arms are disjoint, the
 * live ranges coalesce, and the output is byte-identical at 624/628, 73.1%.
 * That was the first of the three candidates the wave-66 note listed; it is
 * now spent. */
/* WAVE 72 RERUN: configured remains 624/628 (-4), 73.1%. Moving the destination
 * calculation into each range arm does reproduce the ROM's duplicated shallow
 * setup, but drops the frame to 0x18 and rotates the general tail. A per-arm
 * u16 offset and a split base-plus-index destination were likewise worse, so
 * the measured 0x1c-frame fixpoint below is retained.
 *
 * WAVE 55 (W55-G) PARK, first attempt on this function, 4 try_match rounds.
 * WAVE 66 ADDENDUM: splitting the general block's destination into `d2`
 * supplied the missing long-lived pseudo and moved the active draft from
 * 608/628 (10.2%) to 624/628 (73.1%). The remaining -4-byte residual is the
 * shallow table arms sharing the `idx * 2` setup that the ROM duplicates;
 * moving `q = idx + tiles` into every arm regressed to 612 bytes/10.8%, and
 * swapping the final `d2`/`q` statements regressed to 71.7%.
 *
 * STRUCTURALLY COMPLETE: every statement, every branch polarity, the switch of
 * three range tests, the table scan and both tile stores read out of the ROM
 * and are reproduced. THE ENTIRE REMAINING DIFFERENCE IS ONE UNIT OF REGISTER
 * PRESSURE -- the ROM spills THREE values (x at [sp,#0x10], y at [sp,#0x14],
 * attr at [sp,#0x18], `sub sp,#0x1c`) and this draft spills only two
 * (`sub sp,#0x18`), so it has a spare low register and every downstream
 * allocation shifts.
 *
 * The knock-ons are all one fact, and they are worth recognising as a SET so
 * nobody chases them individually:
 *   - the ROM parks `i` in r8 (a HIGH register, so each use costs a `mov`) and
 *     `rc` in r7; this draft has `i` in r7 and `rc` in r4, which is a strictly
 *     better allocation and therefore the wrong one;
 *   - the ROM reloads the 'M' block's fourth constant from a THIRD pool word
 *     (0xffffa0b0, 0xffffa0b1, 0xffffa0b3, with 0xffffa0b2 derived as
 *     `adds r3,#2`), this draft derives two of them, because gcc only spends a
 *     pool word instead of a live register when it is short of registers.
 *     sub_08014084's case 9 is the same shape with 0xffff9fb4/b5/b7 and
 *     0xffff9fb6 derived -- THREE pool words plus one derivation is what this
 *     idiom looks like when the pressure is right.
 * So the pool-word count in the 'M' block is a free PRESSURE GAUGE for this
 * function: get it to three and the allocation is right.
 *
 * WHAT IS MISSING IS ONE LONG-LIVED PSEUDO. Ten values need a home in the ROM
 * (7 in r4-r7/r8-r10 plus 3 spilled); this draft has nine. Eight are live
 * across the `bl Div` in the C1/C2 arms -- dest, base, i, s, x, y, attr and e --
 * which is what forces the spilling in the first place. I could not identify
 * the tenth. RULED OUT by inspection, do not re-spend on these: a sixth
 * parameter (nothing reads [sp,#0x40]); `i` or `base` being `int` (both carry
 * the `lsls #16; lsrs #16` truncation of a u16 local); `x`/`y` being narrow
 * (both are stored with a full-word `str` at entry, unnarrowed); merging or
 * splitting `q` and `tiles`, which changes pressure the wrong way.
 * The most likely candidates left, in order: separate locals for `e`/`n` in the
 * two C arms; a local for `dest + base`; the general block's `d` being distinct
 * from the 'M' block's.
 *
 * FOUR READINGS THIS FUNCTION ESTABLISHED, each of which moved it, and all four
 * are transferable:
 *
 * 1. A 6-BYTE ROM RECORD CANNOT BE A STRUCT. agbcc inherits the old ARM APCS
 *    STRUCTURE_SIZE_BOUNDARY of 32 bits, so `struct { u16 a; u16 b[2]; }` has
 *    sizeof 8 and `p++` steps `adds r0,#8` where the ROM steps `adds r0,#6`.
 *    The table has to be a flat `u16[]` with a manual `p += 3`. This is not
 *    specific to this table -- any ROM record whose natural size is not a
 *    multiple of 4 is affected. Now in include/unknown-globals.h and
 *    docs/agbcc-codegen.md.
 *
 * 2. BRANCH POLARITY READS OFF WHICH ARM FALLS THROUGH. gcc emits the test with
 *    the branch to the ELSE label and falls through into the THEN arm. The ROM
 *    here does `cmp; bhi <deeper>` and falls through to `tiles = g[0]`, so the
 *    source is `if (c <= 0x823F) tiles = g[0]; else { ... }` -- NOT the
 *    `if (c > 0x823F) { ... } else` form, which produces `bls` and the opposite
 *    layout. Three nested tests, all three inverted, was worth ~30 bytes.
 *
 * 3. `c = s[1] | (s[0] << 8)` AND `c = (s[0] << 8) | s[1]` ARE DIFFERENT CODE.
 *    gcc evaluates the left operand of `|` first, so the ROM's `ldrb [r6,#1]`
 *    before `ldrb [r6,#0]` fixes the narrow term as the LEFT operand even
 *    though the shifted term is what you would write first. The companion
 *    `rc = s[0] | (s[1] << 8)` then reuses both loads in the ROM's order.
 *
 * 4. `tiles[idx]` and `tiles[idx + stride]` do NOT share the ROM's address CSE:
 *    they give `(idx + stride) * 2 + tiles`, while the ROM adds `stride * 2` to
 *    the already-computed `&tiles[idx]`. Binding `q = idx + tiles` and writing
 *    `q[0]` / `q[stride]` reproduces it.
 *
 * The type model came entirely from the neighbours and needed no new struct:
 * gUnknown_08499594's `unk04_0:7` bitfield is exactly the ROM's
 * `movs #0x7f; ands` zero-test plus `lsls #25; lsrs #25` value read, and
 * gUnknown_030040D8's `unk07[5]` supplies [r0,#7] and [r0,#8]. Three globals
 * were undeclared and are now in include/unknown-globals.h with their evidence:
 * gUnknown_0808F380 (a 3-element `u16 *` table -- the words dereference to
 * 0x0808F38C/0x0808F68C/0x0808F98C), gUnknown_0808FC8C and gUnknown_0809091C.
 *
 * SANDWICH-PROFILE NOTE FOR THE ORCHESTRATOR: reading the promoted neighbour
 * c_08013D4C.c was worth almost nothing here (it is two 3-line accessors on an
 * unrelated struct). What paid was the SHARED IDIOM -- the unk04_0/Div/
 * sub_0802216C sequence -- which appears verbatim in sub_08014084's case 10.
 * Proximity in the address space did not help; proximity in the CALL GRAPH did.
 */

void sub_08013D7C(int x, int y, u16 *dest, u8 *s, u16 attr)
{
    u16 i;
    u16 base;
    u16 n;
    u16 c;
    u16 rc;
    u16 idx;
    int stride;
    u16 *tiles;
    u16 *q;
    u16 *d;
    u16 *d2;
    u16 *p;
    u8 *t;
    struct Unk08499594 *e;

    i = 0;
    base = x + y * 32;

    while (s[0] != 0)
    {
        if (s[0] == 0xa)
        {
            t = s + 1;
            if (s[1] == 0)
                break;
            s = t;
            continue;
        }

        if (s[0] == 0x43 && s[1] == 0x31)
        {
            e = &gUnknown_08499594[gUnknown_030040D8->unk07[0]];
            if (e->unk04_0 != 0)
                n = Div(e->unk04_0 - 1, 10) + 1;
            else
                n = 0;
            sub_0802216C(dest + (x + i) + y * 32, e->unk00, gUnknown_03003F2C,
                         e->unk07, 0, n, 0, 0);
            i += 2;
            s += 2;
        }
        else if (s[0] == 0x43 && s[1] == 0x32)
        {
            e = &gUnknown_08499594[gUnknown_030040D8->unk07[1]];
            if (e->unk04_0 != 0)
                n = Div(e->unk04_0 - 1, 10) + 1;
            else
                n = 0;
            sub_0802216C(dest + (x + i) + y * 32, e->unk00, gUnknown_03003F2C,
                         e->unk07, 0, n, 0, 0);
            i += 2;
            s += 2;
        }
        else if (s[0] == 0x4d)
        {
            d = dest + base + i;
            d[0] = s[1] * 4 - 0x5F50;
            d[1] = s[1] * 4 - 0x5F4F;
            d[0x20] = s[1] * 4 - 0x5F4E;
            d[0x21] = s[1] * 4 - 0x5F4D;
            i += 2;
            s += 2;
        }
        else
        {
            c = s[1] | (s[0] << 8);
            rc = s[0] | (s[1] << 8);
            s += 2;

            idx = (((c - 0x8140) & 0xFFF8) * 2) + (c & 7);
            stride = 8;
            if (c <= 0x823F)
            {
                tiles = gUnknown_0808F380[0];
            }
            else
            {
                idx -= 0x200;
                if (c <= 0x833F)
                {
                    tiles = gUnknown_0808F380[1];
                }
                else
                {
                    idx -= 0x200;
                    if (c <= 0x8397)
                    {
                        tiles = gUnknown_0808F380[2];
                    }
                    else
                    {
                        stride = 1;
                        p = gUnknown_0808FC8C;
                        do
                        {
                            if (rc == p[0])
                                break;
                            p += 3;
                        } while (p < gUnknown_0809091C);
                        tiles = p + 1;
                        idx = 0;
                    }
                }
            }

            d2 = dest + base + i;
            q = idx + tiles;
            d2[0] = q[0] | attr;
            d2[0x20] = q[stride] | attr;
            i += 1;
        }
    }
}









