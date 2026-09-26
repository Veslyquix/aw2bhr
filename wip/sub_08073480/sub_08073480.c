/* WAVE 87 (W87-F) -- `do { } while (0)` TRANSFER TEST: NEGATIVE, 5 placements.
 * The residual (dst vs the chain temp, r1<->r3) is set by LOCAL-alloc inside a
 * call-free loop body, and this lever only reaches global.c allocnos. Every
 * placement that moved anything moved the four HIGH-register values
 * (0xff -> r8, gSinLut -> ip, unk34>>16 -> sl, unk2c>>16 -> sb) -- which the
 * BASELINE ALREADY HAS EXACTLY RIGHT, so all of them are regressions. The
 * wrapper around `dst = gUnknown_0202FDE4; dst += i * 2;` also grows the frame
 * to 8 and spills unk34>>16. Draft unchanged at 87.3%. See work/sub_08073480/W87-notes.md. */
/* PARKED at 87.3%, SIZE-EXACT at 244 bytes, 31 of 244 bytes differ, first
 * difference at +0x52. RE-MEASURED wave 77 (W77-K): the residual still holds.
 *
 * A per-scanline sine wobble: advance two phase accumulators, then for each of
 * the 0xA0 scanlines write a BG3HOFS/BG3VOFS pair into gUnknown_0202F8DC and
 * DMA the table at HBlank.
 *
 * *** WAVE 77 VERDICT: THE RESIDUAL IS A TWO-REGISTER PERMUTATION AND NO
 * *** SOURCE EXPRESSION REACHES IT. r1 AND r3 ARE SWAPPED THROUGHOUT THE LOOP
 * *** BODY AND NOTHING ELSE DIFFERS.
 *      ROM     dst -> r3,  multiply/chain temp -> r1
 *      draft   dst -> r1,  multiply/chain temp -> r3
 * with the consequential `movs r7,#0` / `movs r3,#0` and `ldr r7,[pc,#104]` /
 * `ldr r3,[pc,#104]` scratch choices following from it. Same opcodes, same
 * order, same count, same relocations, size exact. There is no constant, no
 * operand order, no width and no statement position left in it.
 *
 * MEASURED THIS WAVE, do not repeat:
 *
 *  - GIVING THE SECOND STORE'S PRODUCT ITS OWN DEAD VARIABLE IS A STRONG
 *    NEGATIVE. W73-G left the open question "the lever wanted is one that
 *    gives the product its own pseudo while still blocking coalescing", and
 *    the obvious answer -- assign dst[1]'s product to `a` (dead after its own
 *    read in that expression) instead of to `b` -- is 87.3% -> 45.9%. It
 *    destroys the ROM's `adds r2,r0,#0` copy in front of `a`'s ACCUMULATOR
 *    multiply (`a = ((i + proc->unk44) * proc->unk30) >> 8`), which the ROM
 *    has and `b`'s accumulator multiply does not. So `a` must keep a SINGLE
 *    set: its own multiply copy depends on it. The two accumulators are not
 *    symmetric and must not be spelled symmetrically.
 *
 *  - THE POINTER-ADD OPERAND ORDER IS REACHABLE AND IS NOT THE LEVER. The ROM
 *    computes the row pointer as `lsls r3,r5,#2; adds r3,r3,r1` -- the INDEX
 *    owns the destination and the base is added to it -- while the draft emits
 *    `lsls r0,r5,#2; adds r1,r1,r0`, base-owns. Splitting the base into its
 *    own local and adding in integer space,
 *        base = gUnknown_0202FDE4;
 *        dst = (u16 *)(i * 4);
 *        dst = (u16 *)((int)dst + (int)base);
 *    reproduces the ROM's operand order EXACTLY and keeps the `ldr` in the
 *    ROM's position -- and scores 86.9%, one byte WORSE than the draft. dst
 *    still lands in r1. This refutes the natural reading of W73-G's note that
 *    `c`'s pointer_int_sum makes source operand order unreachable: it is
 *    reachable through two statements in integer space (one statement is not:
 *    `dst = (u16 *)(i * 4 + (int)dst)` is byte-identical to the draft, as
 *    W73-G measured). It simply does not decide which register dst gets.
 *
 * SETTLED (do not re-derive):
 *  - The head reaches gUnknown_0202FDE4 through agbcc's own -fforce-addr
 *    .rodata word at 0x081CC024 while the loop and the DMA tail use a plain
 *    inline pool word. PROMOTION MUST CARRY "rodata": ["0x081CC024"].
 *  - `dst = gUnknown_0202FDE4; dst += i * 2;` as two statements is required.
 *  - `*((b & 0xff) + gSinLut)` rather than `gSinLut[b & 0xff]`: the index-first
 *    spelling creates the 0xff pseudo before gSinLut's, which is what decides
 *    that 0xff wins r8 and gSinLut gets ip.
 *  - The `b = ...` assignments inside BOTH stores' expressions are the W73-D
 *    lever and are worth 11 points each. `b` is dead at both points. DO NOT
 *    FOLD THEM AWAY. A fresh variable does not work (W73-G) and neither does a
 *    named local for the sin value -- agbcc coalesces both.
 *  - REG_DMA0DAD is `&REG_BG3HOFS` and the transfer is one 32-bit unit.
 *
 * RULED OUT: toolchain (no override in 0x08073; sub_08073714 matched on the
 * default). Reordering the three addends so the global comes first (46.7%,
 * first difference moves backwards to +0x28). `dst -= -(i * 2)` (spills).
 * decomp-permuter, THREE runs: 50.4% -> 76.2%, then nothing from 76.2%, then
 * only semantically invalid bodies from 87.3% that reused `i`, the loop
 * counter, as a temporary.
 *
 * *** work/sub_08073480/best.json AND best.c READ 91.4% AND THAT NUMBER IS NOT
 * *** REACHABLE FROM ANY DRAFT. best.c holds permute.py's raw cpp-expanded
 * output, and the expanded unit compiles differently from the same text behind
 * `#include "global.h"`. Compare permuter candidates on the SPLICED number
 * only. This misled two agents in wave 73 and it is still misleading the
 * `best so far:` line trymatch prints for this function today. */

#include "global.h"

#include "hardware.h"

struct Unk08073480Proc
{
    /* 0x00 */ u8 filler_00[0x2c];
    /* 0x2c */ int unk2c;
    /* 0x30 */ int unk30;
    /* 0x34 */ int unk34;
    /* 0x38 */ int unk38;
    /* 0x3c */ int unk3c;
    /* 0x40 */ int unk40;
    /* 0x44 */ int unk44;
    /* 0x48 */ int unk48;
};

void sub_08073480(struct Unk08073480Proc *proc)
{
  int i;
  int a;
  int b;
  u16 *dst;
  gUnknown_0202FDE4 = gUnknown_0202F8DC;
  proc->unk44 += proc->unk3c;
  proc->unk48 += proc->unk40;
  for (i = 0; i < 0xa0; i++)
  {
    a = ((i + proc->unk44) * proc->unk30) >> 8;
    b = ((i + proc->unk48) * proc->unk38) >> 8;
    dst = gUnknown_0202FDE4;
    dst += i * 2;
    dst[0] = (((b = (*((b & 0xff) + gSinLut)) * proc->unk34) >> 20) + (proc->unk34 >> 16)) + gUnknown_0300200C;
    dst[1] = (((b = (*((a & 0xff) + gSinLut)) * proc->unk2c) >> 20) + (proc->unk2c >> 16)) + gUnknown_03002000;
  }

  *((vu16 *) (0x04000000 + 0x0BA)) = 0;
  *((vu32 *) (0x04000000 + 0x0B0)) = (u32) gUnknown_0202FDE4;
  *((vu32 *) (0x04000000 + 0x0B4)) = (u32) (&(*((vu16 *) (0x04000000 + 0x01C))));
  *((vu16 *) (0x04000000 + 0x0B8)) = 1;
  *((vu16 *) (0x04000000 + 0x0BA)) = 0xA640;
}
