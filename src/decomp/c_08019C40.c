#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08019C40.
 * sub_08019C40 @ 0x08019C40
 */

/* MATCHED wave 51 (W51-D).
 *
 * PROMOTION NEEDS A POOL WORD PLACED. gUnknown_08499578 is named twice, which
 * puts its address in this unit own .rodata; asm/ prints that slot as
 * gUnknown_0808E5BC, so this function data/promoted.json entry needs
 *   "rodata": ["0x0808E5BC"]
 * and split_rodata.py + gen_lds.py must be re-run before building.
 *
 * THE TWO FIXES, both against a ruled-out list that was accurate and complete
 * for what it covered (see docs/agbcc-codegen.md):
 *
 *   - Argument 2 is p->unk4a + (i * 2 + 1), NOT p->unk4a + 1 + i * 2.
 *     fold association block only fires when it finds more than two non-empty
 *     var/con/lit parts. (a + 1) + i*2 gives three (a, 1, i*2) and the constant
 *     migrates onto the multiply term; a + (i*2 + 1) gives two and the tree
 *     survives, so the ROM strictly-left-to-right
 *     ldrh / adds #1 / lsls / adds comes out. Eight spellings had been ruled
 *     out and this grouping was not among them.
 *   - The negation is its OWN statement. flag != 0 on a u8 local emits
 *     negs; lsrs #31 ADJACENT, at the use; the ROM has the negs with the flag
 *     truncation and the lsrs #31 thirteen instructions later at the store.
 *     Splitting it into neg = -flag; and (u32)neg >> 31 puts each half where
 *     the ROM has it. No pass separates that pair, so a separated pair is
 *     always two source statements.
 *
 * Settled, byte-exact, do not re-derive:
 *   - The opening is a CHAINED assignment, and both halves matter. Being the
 *     outer assignment target is what materialises gUnknown_03001FF8 address
 *     first (the ROM pool order), and gUnknown_03001418 being volatile is what
 *     makes agbcc re-read the halfword it just stored to get the inner
 *     assignment value. Written as two statements, CSE folds the read to the
 *     constant and the ldrh disappears; written non-volatile, same.
 *   - i is s16: the lsl/lsr and lsl/asr pairs around its ++ are agbcc storing
 *     a narrow local zero-extended and sign-extending it at each use.
 *   - flag != 0 on a u8 local is the only spelling that produces
 *     negs; lsrs #31 at all -- the same test written inline on the member
 *     becomes lsrs #1; ands #1, which the ROM does not have.
 *   - decomp-permuter was run on this function in wave 42 and produced nothing;
 *     the residual was an expression tree, which it cannot reshape.
 */
void sub_08019C40(struct Unk8019A60 *p)
{
    s16 i;

    gUnknown_03001FF8 = gUnknown_03001418 = 0;

    sub_08019C24();

    for (i = 0; i < p->unk41; i++)
    {
        u8 k;
        u8 flag;
        int neg;

        k = p->unk31[i];
        flag = p->unk24[k] & 2;
        neg = -flag;

        sub_08014A5C((s16)(p->unk48 + 1),
                     (s16)(p->unk4a + (i * 2 + 1)),
                     gUnknown_08499578,
                     p->unk20[k].unk1c,
                     0x8000,
                     (u32)neg >> 31);
    }

    sub_08011E54(gUnknown_08499578, (void *)0x06007000, 0x800);
}
