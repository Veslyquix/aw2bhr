#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019A60.
 * sub_08019A60 @ 0x08019A60
 */

#include "hardware.h"
/* MATCHED, wave 42 (W42-E), by decomp-permuter after three waves of hand
 * attempts. Byte-for-byte identical, relocs match.
 *
 * THE TOOL WAS THE BLOCKER, NOT THE DECOMPILATION -- this is the part worth
 * carrying forward. Wave 40 ended with "NEXT THING TO TRY: decomp-permuter"
 * and that run had never actually been able to start: wave 40's best.c carried
 * its own copies of `struct Unk8019A60Item` and `struct Unk8019A60`, both of
 * which are ALREADY in include/unknown-globals.h (and the header's versions are
 * strictly fuller -- unk04, unk1c, unk41, unk48, unk4a). trymatch tolerates
 * such a duplicate; decomp-permuter expands headers, so every run died
 * instantly with `redefinition of struct Unk8019A60Item`. Deleting the two
 * local definitions was the whole fix, and the function then fell in one
 * 600 s run at score 0.
 *   GENERAL LESSON: a local struct definition duplicating a header one is
 * INVISIBLE to trymatch and FATAL to the permuter. Grep the bare tag before
 * defining it even when the draft already compiles and scores -- and if a
 * permuter run dies at once, read its error before concluding anything about
 * the function.
 *
 * TWO SOURCE LEVERS, both needed, both measured:
 *   - DO NOT COPY THE PARAMETER INTO A LOCAL. `struct Unk8019A60 *p = arg;`
 *     costs an entire register: agbcc keeps both pseudos live and emits
 *     `adds r5,r0,#0; adds r7,r5,#0`, two callee-saved registers holding the
 *     same pointer, which pushes a fifth value into r8 and costs the
 *     `mov r7,r8; push {r7}` pair. The `#define P` cast removes it.
 *   - `new_var` -- binding `*idx` to a local before the sub_08074410 guard --
 *     is what the permuter found, and it is the difference between 248 bytes
 *     and 240. It frees the ROM's allocation: p->r6, &unk42->r5, &unk31->r4,
 *     &unk24->r7, with the idx VALUE reusing r5 once the address dies, k in
 *     scratch r3 and fn in r4. That allocation also earns the +4 the size diff
 *     looked like a second cause: branch 2's tail then uses the same registers
 *     as branch 1's, so jump.c cross-jumps the two
 *     `ldrb r2,[r0]; adds r0,r3,#0; adds r1,r5,#0; bl _call_via_r4` tails into
 *     one block -- that is the `b _08019AFC` at the end of branch 1, which
 *     jumps INTO branch 2. The +8 was always ONE fact with two consequences.
 *
 * CORRECTION TO THE WAVE-40 NOTE: `&P->unk24` does NOT need a source local.
 * agbcc binds it across the two sub_0803B4DC calls on its own. Wave 40 read
 * the ROM's r7 as evidence of a bound local; it is not, and adding one only
 * makes the fifth register explicit. Binding `&unk42` and `&unk31` (`idx` and
 * `tbl`) IS load-bearing -- without them branch 2 recomputes both addresses
 * the way branches 1 and 3 do, which is not what the ROM has.
 *
 * The `do { } while (0)` around the last call is the permuter's and is kept
 * because it was not re-derived; it is byte-neutral as far as was tested. */

#define P ((struct Unk8019A60 *)arg)

void sub_08019A60(void *arg)
{
    long new_var;
    void (*fn)(u8, u8, u8);

    if (gpKeySt->held & 4)
    {
        fn = P->unk20[P->unk31[P->unk42]].unk10;

        if (fn != 0)
            fn(P->unk31[P->unk42], P->unk42,
               P->unk24[P->unk31[P->unk42]]);
    }
    else if (gpKeySt->held & 1)
    {
        u8 *idx;
        u8 *tbl;

        idx = &P->unk42;
        new_var = *idx;
        tbl = P->unk31;

        if (sub_08074410(P->unk20[tbl[new_var]].unk00, 0) == 0)
        {
            if (P->unk24[tbl[*idx]] & 2)
                sub_0803B4DC(0x68);
            else
                sub_0803B4DC(0x65);

            fn = P->unk20[tbl[*idx]].unk14;

            if (fn != 0)
            {
                do { fn(tbl[*idx], *idx, P->unk24[tbl[*idx]]); } while (0);
            }
        }
    }
    else if (gpKeySt->held & 2)
    {
        sub_0801537C(gUnknown_08489568);

        fn = P->unk20[P->unk31[P->unk42]].unk18;

        if (fn != 0)
            fn(P->unk31[P->unk42], P->unk42,
               P->unk24[P->unk31[P->unk42]]);

        sub_0803B4DC(0x66);
    }
}
