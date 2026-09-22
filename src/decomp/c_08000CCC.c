#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08000CCC.
 * SetSelectedTile @ 0x08000CCC
 */

/* Wave 37 (W37-E). PARKED at 97.6% -- SIZE EXACT (208 bytes), 5 bytes differ,
 * and the difference is PURELY which register three instructions land in:
 *
 *     original:   movs r1,#192 / ands r1,r4 / movs r0,#63 / ands r0,r2
 *                 orrs r0,r1   / strh r0,[r3,#36]
 *     candidate:  movs r0,#192 / ands r4,r0 / movs r0,#63 / ands r2,r0
 *                 orrs r2,r4   / strh r2,[r3,#36]
 *
 * Same instructions, same order, same count. The ROM gives BOTH `&` results a
 * fresh register and clobbers neither a1 (r4) nor the loaded element (r2);
 * agbcc coalesces each result into its dying operand instead.
 *
 * Ruled out by measurement, all with the rest of the function byte-exact:
 *   - operand order `(b & 0x3F) | (a1 & 0xC0)`: emits the 0x3f mask first, so
 *     the ORDER breaks as well (attempt 1);
 *   - binding `c = a1 & 0xC0` to a local: fixes the 0xC0 half (fresh register,
 *     r4 preserved) and leaves the 0x3f half coalescing;
 *   - binding BOTH halves to locals and spelling the or as `d | c`: same, the
 *     0x3f half still coalesces into the element's register;
 *   - decomp-permuter, 21,468 iterations over 300 s from this draft: nothing.
 *
 * Everything else was derived and is byte-exact, including:
 *   - `a = sub_08001D24(a1); a -= 4;` -- the `adds rD,rS,#0; subs rD,#K` pair is
 *     NOT two statements, it is forced whenever K > 7 (THUMB's 3-operand SUB
 *     takes imm3 only); `a` and `b` are two locals because the ROM holds them in
 *     r1 and r2 at once.
 *   - `b = gUnknown_0200B0D0[b].unk04;` as its OWN statement. Inlined into the
 *     store, the element load lands in the wrong register in both arms. */


/* Wave 80 (W80-F). The two AND results are constant-tied local temporaries
 * in the ROM because the OR is assigned back into `b` and `b` is what gets
 * stored: `b = (a1 & 0xC0) | (b & 0x3F); unk24 = b;`. Measured in one probe
 * sweep: dead `v = a1;` after the store and `((v = a1) & 0xC0) | ((w = b) &
 * 0x3F)` are byte-identical to the old draft (flow deletes both before
 * anything counts); `a = a1 & 0xC0;` as its own statement frees the 0xC0
 * half only; `b = b & 0x3F;`, `b |= a`, an `int r` for the OR and `a = <or>`
 * all leave the 0x3F half coalescing into r2. Only the reuse of `b` for the
 * OR result gives both halves the ROM's constant-tied registers. */

void SetSelectedTile(int a1)
{
    int a;
    int b;

    if (gActiveMap->unk07 == 0)
    {
        a = sub_08001D24(a1);
        a -= 4;
        if (a < 0)
            a += 0x11;
        gActiveMap->unk36 = a;
        sub_080073F8(gActiveMap->unk07, a1);
        b = gActiveMap->unk3a + 4;
        if (b > 9)
            b = gActiveMap->unk3a - 6;
        b = gUnknown_0200B0D0[b].unk04;
        gActiveMap->selectedTerrain = b;
    }
    else
    {
        if (a1 != 0x19)
            gActiveMap->unk2f = (a1 >> 6) + 1;
        a = sub_08001D24(a1);
        a -= 3;
        if (a < 0)
            a += 0x14;
        gActiveMap->unk38 = a;
        sub_080073F8(gActiveMap->unk07, a1);
        b = gActiveMap->unk3a + 3;
        if (b > 7)
            b = gActiveMap->unk3a - 5;
        b = gUnknown_0200B0D0[b].unk04;
        b = (a1 & 0xC0) | (b & 0x3F);
        gActiveMap->unk24 = b;
    }

    sub_08011E54(gUnknown_0808D8AC, (void *)0x06014D40, 0x8C << 3);
}

asm(".global sub_08000CCC\n.thumb_set sub_08000CCC, SetSelectedTile\n");
