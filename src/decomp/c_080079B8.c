#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080079B8.
 * sub_080079B8 @ 0x080079B8
 */

/* MATCHED, wave 59 (W59-A). 84 bytes, byte-for-byte, relocs match.
 *
 * THE ROM'S DEAD COMPUTATION IS KEPT BY A LOOP WHOSE BODY IS DEAD.
 * `(s8)p->unk36 + 4` / `(s8)p->unk38 + 3` is never read -- r0 is overwritten by
 * `lsls r0,r2,#3` at the join -- yet the ROM emits all five instructions of
 * each arm. Waves 52 and 57 ruled out a plain dead local (flow deletes it) and
 * `volatile` (keeps the MEM and the control flow, nothing downstream).
 *
 * THE MECHANISM. agbcc runs its only dead-code elimination inside `flow`, which
 * is BEFORE combine and before the post-reload jump pass, and it never runs
 * again. So a computation survives into the output iff BOTH hold:
 *   1. it still has a live use when flow runs, and
 *   2. that use is destroyed by a LATER pass, which cannot then collect it.
 * A dead local fails (1). `volatile` fails (1) for everything except the MEM.
 *
 * THE VEHICLE. `while (m == 0) m = 1;` satisfies both. loop.c has already built
 * the loop before flow runs; flow deletes only the dead body `m = 1`; the loop
 * is provably one-trip so nothing survives of it; and the post-reload jump pass
 * drops the now-pointless branch, orphaning the chain that fed it. It must be a
 * LOOP: `if (m == 0) dummy = 1;` deletes the whole thing, chain included
 * (measured this wave -- flow removes the arm and the if goes with it).
 *
 * WHY THE COMPARAND MUST BE 0 *HERE*, AND MUST NOT BE IN sub_080077EC.
 * Thumb has `cmn rn, rm` but NO `cmn rn, #imm`. This function's addends are the
 * immediates 4 and 3, so combine cannot form a compare-against-negated-
 * immediate and must instead use the flag-setting `adds` pattern -- which HAS a
 * destination and therefore survives the branch's deletion. That is exactly why
 * each ROM arm ends in a bare `adds r0,#4` and carries no `cmp`.
 * sub_080077EC's addend is a REGISTER (`adds r0,r0,r3`); there combine folds
 * add+compare into a destination-less `cmn` and the add dies with the branch,
 * so that function needs a NON-zero comparand. Same vehicle, opposite
 * comparand, and the discriminator is whether the addend is an immediate.
 * A comparand too big for `cmp #imm8` is wrong in both: it leaves the
 * constant's own `ldr` and a pool word behind (measured with 0x7FFFFFFF).
 *
 * `c = p->unk07;` before `i = n + 3;` is load-bearing for ORDER only: the ROM
 * emits `movs r3,#7; ldrsb r3,[r0,r3]` ahead of `adds r2,r1,#3`, and without
 * the binding the `adds` is emitted first. The register-offset `ldrsb` (rather
 * than `ldrb; lsls; asrs`) comes for free from unk07 having two uses -- wave 57
 * saw this and correctly called it a consequence, not an independent axis.
 *
 * Settled earlier and confirmed unchanged: the wrap is `if (i > 9) i -= 10;`;
 * unk07/unk36/unk38 are s8, unk3a is s16, gUnknown_0200B0D0 has stride 0x1c
 * with u16 unk04 at +4. Nothing needed declaring.
 *
 * The `while` is a VEHICLE, not a claim about the original source: it is the
 * cheapest construct satisfying (1) and (2). What the original wrote is not
 * recoverable from the bytes -- any construct whose use dies between flow and
 * reload emits the same code.
 */

void sub_080079B8(int a1)
{
    struct Unk0200B0B0 *p;
    int n;
    int c;
    int i;
    int m;

    p = gUnknown_0200B0B0;
    n = p->unk3a;
    c = p->unk07;
    i = n + 3;
    if (c == 0)
        i = n + 4;
    if (i > 9)
        i -= 10;
    if (c == 0)
        m = (s8)p->unk36 + 4;
    else
        m = (s8)p->unk38 + 3;
    while (m == 0)
        m = 1;
    gUnknown_0200B0D0[i].unk04 = a1;
}
