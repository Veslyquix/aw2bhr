#include "global.h"

/* Wave 74 (W74-C): configured fixpoint is now 512/512 with 35 differing bytes
 * (93.2%), first difference +0x57.  A 180-second clean `--current` permuter
 * run improved 46 -> 41 bytes by splitting the fourth loop's `e` live range
 * into `new_var`; the independently reproduced source below is semantically
 * identical.  A chained 120-second run improved 41 -> 35 by binding the third
 * loop's descending `j` to `new_var2` inside a zero-trip do/while wrapper;
 * that source was also independently reproduced and is retained.  Neither
 * run matched.  Declaration order (`i,j` vs `j,i`, split declarations, and
 * moving `e`) was byte-neutral.  Deleted `i = i` / `j = j` assignments after
 * or inside the first loop were byte-neutral.  Making either counter unsigned
 * collapses the descending loops and produces only 324 bytes, so signedness is
 * settled.  The remaining diff is still the r4/r5 allocation swap across the
 * first, fourth, 512-entry, and closing loops; instruction count/order stays
 * exact.
 *
 * Wave 72 (W72-C): swapping the fourth loop's counter roles and writing its
 * inner clear as ascending source produces both ROM loop shapes and makes the
 * unit size-exact (512/512, 91.0%).  The remaining 46 byte differences are a
 * pure r4/r5 allocation swap propagated through the shared i/j loop allocnos.
 * A separate block-scoped counter instead flips both unk12c loops and grows
 * the unit to 516; fixed-register locals add entry guards and are worse. */

/* Wave 65 (W65-O): one final narrow-cast probe tested the remaining mechanism
 * directly.  Using `(u16)i` only in the second outer-loop subscript disables
 * its unwanted strength reduction, but emits an `lsls #16; lsrs #16` pair,
 * grows 508/512 to 516/512, and still leaves the inner loop in reg+reg form.
 * The original 508-byte fixpoint below remains the closest candidate.
 *
 * Wave 62 (W62-A): remeasured at 508/512 (-4).  Replacing only the second
 * outer `for` with a hand-written goto loop disables the wanted lowering too
 * broadly and grows the candidate to 520 (+8); do not repeat.  -O1 and
 * no-force profiles also diverge globally.
 *
 * Wave 49 (W49-F).  NOT MATCHED: 508 bytes against the ROM's 512.  Every
 * instruction outside the fourth loop (the one over unk12c[32..47]) is
 * byte-exact, including the prologue clears, the four-army loop, the 128-entry
 * loop, the unk12c[0..31] loop, the gUnknown_02025818 walk and the closing
 * gUnknown_02025C18 loop.  The whole residual is 2 instructions in that one
 * loop -- see "REMAINING DIFF" at the bottom.
 *
 * What this function settled, all recorded in include/unknown-globals.h:
 *   - struct Unk0849B018 gains three members carved out of filler, no named
 *     member touched: volatile u16 unk0e[4] (0x0e), volatile u8 unk1a (0x1a),
 *     volatile u16 unk2c[128] (0x2c).  unk2c's extent is exact -- 0x2c + 256
 *     lands on unk12c.
 *   - unk16[] is VOLATILE.  This is the first WRITE of it in the tree, which
 *     is the evidence c_08030C54.c's note said it was waiting for.
 *   - gUnknown_0300410C is VOLATILE and gUnknown_030040CC is not: the closing
 *     `gUnknown_030040CC = gUnknown_0300410C = 0;` stores 0, RE-READS 0410C
 *     and stores that -- one instruction a plain cell does not emit -- while
 *     040CC takes no dead load of its own.
 *   - gUnknown_02025C18 is VOLATILE, on the dead-`ldrh`-before-`strh` tell in
 *     the closing loop.
 *   - gUnknown_02025818 (new, volatile u16, >= 512 entries) and
 *     gUnknown_0300333C (new, plain u32 -- its `str` carries NO dead load,
 *     which is what says it is not volatile) are declared.
 *
 * The pair of statements at unk08[64][i] / unk208[i] is NOT a typo and NOT a
 * guess.  The ROM emits `ldrh; orrs; strh` and then `ldrh; ldrh; strh` at the
 * SAME address, base + 0x208 + 2i.  Three instructions for the `|=` is the
 * NON-volatile shape (c_08030178's note records unk08 as the one plain member
 * of that record); three for the self-assign is the VOLATILE shape.  A single
 * declared member cannot be both, so the first access is reaching 0x208
 * through unk08 -- one row past its declared 64 -- and only the second is
 * unk208.  Spelled `unk208[i] |= 0xffff` the first group grows a fourth
 * instruction and the function is 2 bytes long; that is the discriminating
 * measurement, not a preference.
 *
 * The record pointer is deliberately NOT bound to a local, which is the
 * opposite of what c_08033638.c needs.  Every member above 0x1f is reached by
 * `adds rB,rB,rN` rather than a load displacement, so the pointer register is
 * clobbered and the ROM re-`ldr`s it from gUnknown_0849B018 at each statement.
 * A named local caches it and loses eight `ldr`s.
 *
 * REMAINING DIFF -- the unk12c[32..47] loop, 2 instructions (4 bytes) short:
 *   ROM:   outer NOT strength-reduced (`lsls r0,r5,#4; adds r0,r0,r5;
 *          lsls r0,#3` recomputing 0x88*i each iteration), the biv i kept live
 *          in a temp (`adds r3,r5,#1` ... `adds r5,r3,#0`), and the inner
 *          128-byte clear running on a DESCENDING giv (`strb r3,[r0];
 *          subs r0,#1`) initialised at `adds r0,#0x85`.
 *   this:  outer strength-reduced to a `adds r2,#0x88` giv with a dbra
 *          countdown, and the inner clear in reg+reg form
 *          (`adds r0,r1,r4; strb r3,[r0]`).
 * The unk12c[0..31] loop directly above wants the OPPOSITE combination and
 * gets it right here -- ROM and this draft agree on it exactly -- so the two
 * loops differ from each other in the original, and this is not one global
 * knob.  Ruled out by probe, all in the full-function context (isolated
 * probes invert the answer and must not be trusted here):
 *   - `unk12c[32 + k]`, `unk12c[i] + 32`, `&unk12c[32]` then `e += k`, and
 *     `for (i = 32; i < 48; i++)`: all four produce the SAME reduced outer.
 *   - a separate pointer local for the second loop, and a separate index
 *     variable for it: both flip BOTH loops to the unreduced form at once,
 *     which trades a 4-byte deficit for a 2-byte surplus.  Adding any local
 *     at all moves them together, so the lever is not register pressure.
 *   - authoring the descending pointer (`q = &e->unk06[127]; *q-- = 0;`)
 *     produces the right inner instructions but puts the giv init BEFORE the
 *     counter init, where the ROM has counter first -- which per the wave
 *     brief's preheader rule proves the pointer is strength_reduce's own giv
 *     and must not be written in the source.  The inner loop below is
 *     therefore the correct spelling and only its lowering differs.
 * Not tried: the permuter, which cannot add the two missing instructions. */

void sub_0802F03C(void)
{
    struct Unk08090CD8Entry *new_var;
    struct Unk08090CD8Entry *e;
    int i, j;
    int new_var2;

    gUnknown_0300333C = 0;
    gUnknown_0849B018->unk20 = 0;
    gUnknown_0849B018->unk22 = 0;
    gUnknown_0849B018->unk1aac = 0;
    gUnknown_0849B018->unk1aad = 0;
    gUnknown_0849B018->unk1aae = 0;
    gUnknown_0849B018->unk1aaf = 0;
    gUnknown_0849B018->unk1a = 0;
    gUnknown_0849B018->unk1b = 0;
    gUnknown_0849B018->unk1f = 0;

    for (i = 0; i < 4; i++)
    {
        gUnknown_0849B018->unk0a[i] = 0;
        gUnknown_0849B018->unk16[i] = 0;
        gUnknown_0849B018->unk0e[i] = 0;
        gUnknown_0849B018->unk24[i] = 0;
        for (j = 0; j < 64; j++)
            gUnknown_0849B01C->unk08[j][i] |= 0xffff;
        gUnknown_0849B01C->unk08[64][i] |= 0xffff;
        gUnknown_0849B01C->unk208[i] = gUnknown_0849B01C->unk208[i];
        gUnknown_0300449C[i] = 0;
    }

    for (i = 0; i < 128; i++)
    {
        gUnknown_03004400[i] = 0;
        gUnknown_0849B018->unk2c[i] = 0;
    }

    for (i = 0; i < 32; i++)
    {
        e = &gUnknown_0849B018->unk12c[i];
        e->unk00 = 0;
        for (j = 127; j >= 0; j--)
        {
            new_var2 = j;
            do { } while (0);
            e->unk06[new_var2] = 0;
        }
    }

    for (j = 0; j < 16; j++)
    {
        e = &gUnknown_0849B018->unk12c[32 + j];
        new_var = e;
        e->unk00 = 0;
        for (i = 0; i < 128; i++)
            new_var->unk06[i] = 0;
    }

    gUnknown_030040CC = gUnknown_0300410C = 0;

    for (i = 0; i < 0x200; i++)
        gUnknown_02025818[i] = 0;

    for (i = 0; i < 4; i++)
    {
        gUnknown_03003128[i] = gUnknown_03003F48[i] = 0;
        for (j = 0; j <= 0x3ff; j++)
            gUnknown_02025C18[j][i] = 0;
    }
}



















