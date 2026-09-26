#include "global.h"

/* m4aSoundVSync.
 *
 * PARKED, AND THE REASON IS NOT THE C -- IT IS THE LITERAL POOL, WHICH MAKES
 * THIS FUNCTION UNMATCHABLE AS A STANDALONE UNIT.
 *
 * The ROM's first two `ldr`s are `ldr r0, _08070044` and `ldr r2, _08070048`,
 * i.e. PC+680, while the function itself ends at 0x0806FDE4. Those two pool
 * words live 600+ bytes past the end of the function, inside a later
 * function's pool -- and this function ALSO carries a local pool
 * (_0806FDDC/_0806FDE0) for the two constants its tail uses. A function
 * compiled on its own can only emit its own pool, so the `ldr rN, [pc, #680]`
 * encodings cannot be reproduced at any spelling: the differing bytes are the
 * PC offset, not the code. Check every pool word's address against the
 * function's extent before spending attempts; if one is outside, the function
 * is blocked until its region is promoted as a whole file.
 *
 * WAVE 47 (W47-C) -- I TESTED THE `volatile` CONTRADICTION THIS FILE AND
 * include/unknown-globals.h HAVE RECORDED SINCE WAVE 33, AND MY OWN
 * HYPOTHESIS FOR DISSOLVING IT IS REFUTED. The contradiction is that
 * SoundInfo::pcmDmaCounter is declared `vu8` on sub_08070AF8's dead-load
 * evidence, while the ROM here decrements it with ONE load
 * (`ldrb; subs; strb; bgt`), which `--p->pcmDmaCounter > 0` cannot produce
 * under the qualifier. I expected a local temp to rescue it, since that
 * spelling reads the volatile lvalue exactly once:
 *
 *     t = p->pcmDmaCounter - 1;  p->pcmDmaCounter = t;  if (t > 0) return;
 *
 * It does not. Measured by compile_probe with `vu8`: the local form still
 * emits a DEAD `ldrb r1,[r2,#4]` between the `subs` and the `strb` -- the
 * same "load of the store's own address whose destination is never read"
 * artefact that was the original evidence FOR the qualifier on
 * sub_08070AF8. So it is four instructions, not three, and the two functions
 * genuinely disagree: only one of them can be right, and the discriminating
 * test remains whether sub_08070AF8 still matches with a plain `u8`. Not
 * changed here -- sub_08070AF8 is matched and promoted, and this function is
 * blocked by the pool either way. Whoever promotes this region as a whole
 * file should settle it then. (For the record the `--p->...` spelling is
 * worse still: THREE loads.)
 *
 * WAVE 47 (W47-H) -- THE TOOLCHAIN AXIS IS NOW CLOSED ON THIS FUNCTION, AND
 * W47-C'S `vu8` SUSPICION IS CONFIRMED BY DIRECT MEASUREMENT.
 *
 * The orchestrator's standing hypothesis was that the `subs`-feeding-a-branch
 * with no `cmp` came from the other compiler, m4a being an old_agbcc block
 * (sub_08070BAC, W47-F). It does not. All three configurations, same C:
 *
 *     default agbcc -O2   100 bytes (+24)   <- baseline
 *     old_agbcc -O2        100 bytes (+24)   BIT-IDENTICAL to the default
 *     agbcc -O1            104 bytes (+28)   worse; loses the mask CSE
 *
 * old_agbcc is not "worse" here, it is a no-op -- the two binaries emit the
 * same instruction stream for this function, `cmp r0, #0` included. So the
 * missing `cmp` is not a build-configuration fact and the four spellings the
 * orchestrator refuted at -O2 were not refuted for the wrong reason.
 *
 * What IS a real defect is the qualifier. Restating SoundInfo's first 12
 * bytes locally with a PLAIN `u8` pcmDmaCounter, changing nothing else:
 *
 *     vu8   ldrb r0,[r1,#4] ; subs r0,#1 ; ldrb r1,[r1,#4] ; strb r0,[r1,#4]
 *     u8    ldrb r0,[r1,#4] ; subs r0,#1 ;                   strb r0,[r1,#4]
 *     ROM   ldrb r1,[r0,#4] ; subs r1,#1 ;                   strb r1,[r0,#4]
 *
 * Both dead loads disappear, the function goes 100 -> 96 bytes, and the
 * decrement becomes the ROM's sequence EXACTLY, plus one `cmp r0,#0` before
 * the `bgt`. So the residual on this statement is now a single instruction,
 * and `vu8` was costing 4 of the 24 bytes. The shared struct is deliberately
 * NOT changed -- see the note in the header, and sub_08070AF8 is the function
 * that has to be re-run to settle it.
 *
 * The remaining +20 is three things, none of them the decrement:
 *   - the ident compare: ours `ldr =0x978C92AD; adds` against the ROM's
 *     `ldr =0x68736D53; subs` -- W47-C's finding below, same instruction
 *     count, different pool word;
 *   - the two DMA bit tests: the ROM has `lsls r1,r1,#7; bcc`, TWO
 *     instructions testing bit 25 by shifting it into the carry, where agbcc
 *     emits the mask form (`movs; lsls; ands; cmp; beq`) at every spelling
 *     tried. This is the largest single chunk and is worth a chapter to
 *     whoever cracks it;
 *   - `movs r2,#128; lsls r2,r2,#3; adds r0,r2,#0` against the ROM's
 *     `movs r1,#4; lsls r1,r1,#8` -- ours materialises 0x400 into a scratch
 *     and copies, the ROM builds it straight into the store register.
 *
 * A SECOND WAVE-47 FINDING (W47-C), and it generalises beyond this function.
 * The ROM loads the ident constant POSITIVE (`.4byte 0x68736D53`) and
 * SUBTRACTS it (`ldr r2,=0x68736D53; ldr r3,[r0]; subs r3,r3,r2`). The honest
 * spelling `p->ident - MPLAY_ID_NUMBER` does NOT produce that: agbcc
 * canonicalises subtract-a-constant into add-the-negative and pools
 * `-0x68736D53`, giving `ldr r1,=0x978C92AD; adds r0,r0,r1`. A positive pool
 * word plus a register `subs` means the constant reached the expression from
 * a REGISTER, i.e. the source held it in a variable. That is the same idiom
 * as the 0xFFFF mask in sub_08070CD0 (see work/sub_08070CD0 and
 * docs/agbcc-codegen.md), and this m4a block appears to use it repeatedly.
 * W47-H confirms this is not compiler-dependent either: old_agbcc pools
 * 0x978C92AD too.
 *
 * The C below is otherwise believed right. 0x040000BC is &DMA1SAD, so the
 * ROM's +8/+0xa/+0x14/+0x16 displacements are DMA1CNT / DMA1CNT_H / DMA2CNT /
 * DMA2CNT_H off ONE base with the 12-byte DMA stride; hardware.h's separate
 * REG_DMA1CNT/REG_DMA2CNT macros CSE to 0x040000C4 and 0x040000D0 instead,
 * which is why the struct below is used to reproduce the single base.
 *
 * Three readings of the assembly that are settled and should not be
 * re-derived:
 *   - `subs r3,r3,r2; cmp r3,#1; bhi` is ONE unsigned expression,
 *     `(ident - MPLAY_ID_NUMBER) > 1`, not two equality tests.
 *   - the store to pcmDmaCounter happens BEFORE the branch, and the branch
 *     tests the 32-bit subtract result, not the truncated byte.
 *   - `ldr r1,[r2,#8]; lsls r1,r1,#7; blo` is a single-bit test of bit 25
 *     shifted into the carry; `blo` is carry-clear, so the store runs when
 *     the bit is SET. Author the natural `if (x & (1 << 25))`.
 */

struct DmaRegs
{
    /* 0x00 */ const void *src;
    /* 0x04 */ void *dst;
    /* 0x08 */ vu32 cnt;
};

void sub_0806FD98(void)
{
    struct SoundInfo *p;
    struct DmaRegs *dma;
    s32 t;

    p = gUnknown_03007FF0;

    if (p->ident - MPLAY_ID_NUMBER > 1)
        return;

    t = p->pcmDmaCounter - 1;
    p->pcmDmaCounter = t;

    if (t > 0)
        return;

    p->pcmDmaCounter = p->pcmDmaPeriod;

    dma = (struct DmaRegs *)0x040000BC;

    if (dma[0].cnt & (1 << 25))
        dma[0].cnt = 0x84400004;

    if (dma[1].cnt & (1 << 25))
        dma[1].cnt = 0x84400004;

    *(vu16 *)((u8 *)dma + 0x0a) = 0x0400;
    *(vu16 *)((u8 *)dma + 0x16) = 0x0400;
    *(vu16 *)((u8 *)dma + 0x0a) = 0xB600;
    *(vu16 *)((u8 *)dma + 0x16) = 0xB600;
}
