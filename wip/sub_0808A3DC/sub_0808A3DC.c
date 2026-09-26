#include "global.h"
#include "hardware.h"

/* WAVE 88 (W88-A). MEASURED UNDER THE FLASH BLOCK'S OWN CONFIGURATION.
 *
 * All sixteen flash-block entries in data/compiler-overrides.json are
 * `cflags_remove ["-O2","-fforce-addr"], cflags_add ["-O1"]`, i.e. the
 * `o1-no-force` profile -- NOT `o1`, which keeps -fforce-addr. Both were
 * measured on this body this wave and they are IDENTICAL here:
 *
 *     o1           160 bytes SIZE-EXACT, 71 of 160 differ, 55.6%, first at +0x0
 *     o1-no-force  160 bytes SIZE-EXACT, 71 of 160 differ, 55.6%, first at +0x0
 *
 * The wave-88 brief quoted 60.0% for this draft at -O1; the real figure is
 * 55.6%. Re-measure, never quote.
 *
 * THE RESIDUAL IS ONE FACT AND IT IS NOT A SPELLING: THE ADDRESS-CONSTANT
 * INDIRECTION. The ROM reaches both globals through the two .rodata words at
 * 0x081D9478/0x081D947C:
 *
 *     ROM        ldr r6,=0x081D9478 ; ldr r4,[r6] ; ldr r1,[r4]   (THREE loads)
 *     candidate  ldr r4,=gUnknown_0849957C ; ldr r1,[r4]          (TWO loads)
 *
 * so the ROM holds the two CONSTANT addresses in callee-saved registers for the
 * whole body (`push {r4,r5,r6,r7,lr}`) and the candidate holds the two OBJECT
 * addresses (`push {r4,r5,lr}`). Everything else -- both bitfield reads, both
 * Decompress calls, the CpuSet mode word, the loop bound, the pool word ORDER
 * and every pool value -- is already the ROM.
 *
 * WAVE 88 REFUTES THE STANDING NOTE IN include/unknown-globals.h (wave 60,
 * W60-I) THAT SAYS "NAMING THE REAL GLOBALS DOES NOT REBUILD THE BLOCK".
 * agbcc DOES build the block, under every spelling tried: the emitted .s
 * always carries
 *     .section .rodata
 *     .LC0: .word gUnknown_0849957C
 *     .LC1: .word gUnknown_03001FE8
 * The words are BUILT and left DEAD -- the instructions reference the inline
 * minipool (.L8) instead, which duplicates them. So the open question is not
 * "how do I make agbcc create the block" but "how do I make the code REFERENCE
 * it", and that is decided by ONE rule, read off the two promoted functions in
 * src/decomp/c_0803CF04.c, which are byte-for-byte matches on both sides of it
 * and which were re-compiled this wave to confirm they still reproduce:
 *
 *   sub_0803CF04 names gUnknown_02000000 TWICE  -> .L4: .word .LC1 ; ldr r4,.L4+4
 *                                                  ldr r1,[r4] at each use
 *   sub_0803CF3C names gUnknown_02000000 ONCE   -> .L7: .word gUnknown_02000000
 *
 * THE DISCRIMINATOR IS NOT THE USE COUNT ALONE -- it is the KIND of use. In
 * c_0803CF04 the symbol's address is an address VALUE (a call argument). Here it
 * is only ever the BASE OF A LOAD, at four sites and two sites, and no number of
 * load-base uses triggers the indirection. Measured this wave:
 *
 *   *(u16 **)&gUnknown_0849957C at all four sites (address written as an
 *      explicit ADDR_EXPR, cast so the front end cannot fold `*&`)
 *      -> still one level; but it DOES reproduce the ROM's pool word order
 *         exactly (buf, 0x1000400, 0823E7A0, bgcnt, 0x6000400, 0823E684,
 *         0x3ff, 0x6000800) and the ROM's tail shape `ldr r0,.L8; ldr r0,[r0]`
 *   u16 **q = &gUnknown_0849957C; union BgCntBuf *b = &gUnknown_03001FE8;
 *      then *q / b->bits at every site
 *      -> 156 bytes (-4), 22.5% under o1.  REGRESSION, do not re-run. It buys
 *         the ROM's register discipline (`push {r4,r5,r6,lr}`, both addresses
 *         held callee-saved across the body, tail reloading from them) at the
 *         cost of one instruction, and is still one indirection short.
 *
 * NOTE FOR THE NEXT AGENT: because this block builds with -fforce-addr REMOVED
 * and the ROM still has the two-level chain, calling those two words "agbcc's
 * -fforce-addr address-constant pool" (as unknown-globals.h does) is not
 * established. Whatever produces them here survives without the flag.
 *
 * WAVE 88 (W88-D) SETTLED THAT, AND CLOSED THE REMAINING AXIS.
 *
 * They ARE this function's own compiler-generated address-constant block, and
 * the evidence is data/promoted.json, not doctrine: c_08089C14.c carves
 * 0x081D946C/70/74 and c_0808A978.c carves 0x081D9480, so OUR two words
 * (0x081D9478, 0x081D947C) are exactly the gap between two MATCHED neighbours'
 * own carved blocks, in this same flash block, all built with -fforce-addr
 * removed. Seven promoted owners share the run 0x081D943C-0x081D9480, one
 * block per function. So declaring them as `u16 **` variables -- which WOULD
 * reproduce the ROM's three loads -- stays wrong: the data would then be owned
 * by data/rodata.s instead of emitted by this unit, unlike every neighbour.
 *
 * THE MIXED-SPELLING LEVER IS REFUTED HERE. docs/agbcc-codegen.md (W86-G)
 * says the two-level word "survives only while at least one reference is still
 * spelled as the plain global", and the ROM has exactly that shape -- three
 * references through a held register r4, the TAIL re-derived from r6. W88-A
 * only ever tested UNIFORM spellings. Wave 88 tested the mixed one (a bound
 * `u16 **q` at the first three sites, the plain global at the tail; and again
 * with a bound local for the BgCnt object). It emits `.LC0: .word
 * gUnknown_0849957C` into .rodata and IGNORES it, exactly like the other four
 * spellings. THE MIXED RULE IS A PRESERVATION RULE, NOT A CREATION RULE -- it
 * stops an existing two-level word collapsing; it cannot promote a one-level
 * baseline. Five spelling families across waves 60/88 have now failed.
 *
 * The mixed form is nonetheless the closest shape yet: it holds
 * &gUnknown_0849957C in ONE callee-saved register across the body, uses it at
 * the first three sites and re-derives the tail from the pool -- the ROM's
 * register discipline exactly, one indirection short. It was NOT installed
 * because it loads the address once where this draft loads it twice, making it
 * one instruction shorter than this size-exact body.
 *
 * Every documented instance of the two-level word (W86-F sub_080790D0, W87-A
 * sub_08026290, the matched c_0808A978.c OAM blob) attaches to a symbol whose
 * ADDRESS is the value wanted. This object is a pointer VARIABLE being read,
 * and its address is only ever a load base. DO NOT SPEND MORE PROBES ON LOAD
 * SPELLINGS OR ON BIND/UN-BIND.
 *
 * The 0x1020 hoist (agbcc puts `movs #129; lsls #5; adds r4` in the preheader,
 * the ROM builds it in the loop body) is byte-NEUTRAL -- four instructions
 * either way -- and is downstream of the register the indirection frees. It is
 * not a second fact to chase.
 *
 * ---- older, still-true notes ----
 *
 * TWO LEVERS ARE LOAD-BEARING; keep them.
 *
 * 1. The loop's element access is cast to `vu16`. Without it agbcc reorders the
 *    body to `ldrh r6; adds r0,r3,r6` (constant first) AND needs a register
 *    across the loop for the hoisted constant, which evicts the pool pointer to
 *    r8 and costs `mov r7,r8 / push {r7} / pop {r3} / mov r8,r3` -- 172 bytes
 *    against 160. gUnknown_0849957C's own declaration is NOT volatile and must
 *    stay that way -- other matched functions read it -- so the qualifier
 *    belongs at this use.
 *
 * 2. `fill` is `vu16`, not `u16`. With a plain `u16` agbcc materialises `&fill`
 *    ONCE and shares it between the store and CpuSet's argument. The ROM
 *    computes sp into r1 for the store and again into r0 for the argument.
 *
 * Do not start from work/sub_0808A3DC/best.c: it is the variant with a plain
 * `u16 fill`, and it scores higher only because a second error cancels part of
 * the difference.
 */

void sub_0808A3DC(void)
{
    vu16 fill;
    int i;

    fill = 0;
    CpuSet((void *)&fill, gUnknown_0849957C, 0x01000400);

    Decompress(gUnknown_0823E7A0,
               (void *)(0x06000400 + gUnknown_03001FE8.bits.chr_block * 0x4000));
    Decompress(gUnknown_0823E684, gUnknown_0849957C + 0x200);

    for (i = 0; i <= 0x3FF; i++)
        ((vu16 *)gUnknown_0849957C)[i] += 0x1020;

    sub_0802D5CC(3, 1);

    CpuFastSet(gUnknown_0849957C,
               (void *)(0x06000800 + gUnknown_03001FE8.bits.tm_block * 0x800),
               0x200);
}
