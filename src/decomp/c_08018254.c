#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018254.
 * sub_08018254 @ 0x08018254
 */

#include "hardware.h"

/* MATCHED in Wave 72 under the configured profile (528/528 bytes). Changing
 * `raw` from u32 to u16 and deriving `t = (s16)raw` preserves the one raw ldrh
 * in r3 and emits the ROM's explicit sign extension into r2. The four
 * relocation-name differences resolve to the same .rodata addresses and need
 * pool placement at promotion.
 *
 * PARKED at 66.7%, SIZE EXACT (528/528 bytes), wave 37 (W37-G).
 * WAVE 66 ADDENDUM: one uninterrupted 300-second permuter run did not match,
 * but its best source exposed three useful hypotheses. Manually carrying the
 * raw unk08 halfword, splitting the true-arm store/add, and binding NULL moved
 * the configured active draft to SIZE EXACT 83.0% (90/528 bytes differ; first
 * difference +0xb8). The remaining span is the raw-halfword/sign-extension
 * allocation: the ROM keeps raw in r3 and signed t in r2, while this draft
 * reloaded t with ldrsh and later re-extended raw. With `raw` still typed u32,
 * changing only the use to `t = (s16)raw` regressed to 532 bytes/60.4%; Wave
 * 72 showed that changing the local itself to u16 at the same time is the
 * missing discriminator and matches.
 *
 *
 * What is settled and should not be re-derived:
 *  - gUnknown_03001FC8 and gUnknown_030024E0 are `union BgCntBuf` and
 *    gUnknown_03002004 is a NEW `union DispCntBuf`; all three were `extern u16`
 *    in unknown-globals.h and are now in include/hardware.h (see the notes
 *    there). The 3-bit `mode` (`and ~7` in ONE instruction) and the four
 *    separate bg-enable bit ops at byte 1 are what identify 0x03002004 as the
 *    DISPCNT shadow rather than a fourth BgCnt or a BlendCnt.
 *    src/decomp/c_0801258C.c and work/sub_0801258C/ were updated to `.raw` and
 *    BOTH re-verified byte-exact after the retype.
 *  - The four 0x0808E56C..0x0808E578 words are agbcc -fforce-addr .rodata
 *    address constants, not globals: dereferenced in baserom.gba they hold
 *    0x03002F90, 0x0200C528, 0x03002F08 and 0x0849958C. The honest spellings
 *    below reproduce all four, and promotion must carry rodata entries for
 *    0x0808E56C / 0x0808E570 / 0x0808E574 / 0x0808E578.
 *  - The store `gUnknown_03002F90 = gUnknown_0200C528[a].unk04->unk0c;` must be
 *    written WITHOUT the `node` local, because agbcc expands a store's
 *    DESTINATION address first and that is what puts 0x0808E56C ahead of
 *    0x0808E570 in the literal pool. With `node` bound first the two pool words
 *    swap. Same fact for `i = t & 0x7fff`: as its own statement ahead of the
 *    unk0a block it puts 0x00007FFF ahead of 0xFFFF0000 in the pool, which is
 *    the ROM order.
 *  - Wave 66 correctly established that `t` itself must be int, but its claim
 *    that a u16 raw local could not work was context-bound. Wave 72's exact
 *    spelling is `u16 raw; raw = node->unk08; t = (s16)raw;`: it emits the raw
 *    ldrh/copy plus the explicit sign extension and keeps the ROM's else-arm
 *    reuse. The earlier differently ordered `u16 w` probe parked raw in ip.
 *
 * WAVE 66 HISTORICAL REMAINING DIFF (closed by the u16 raw spelling above;
 * three residues were inside the 0x08018326..0x080183A4 span;
 * everything before 0x08018326 and after 0x080183A4 is byte-identical):
 *  1. the else arm RELOADS `node->unk08` (`ldrh r0,[r6,#8]; strh r0,[r1,#2]`)
 *     where the ROM re-uses a CSE copy made at the original load
 *     (`adds r3,r0,#0` up at the ldrh, then a bare `strh r3,[r0,#2]`). Needs
 *     the raw halfword kept in a LOW register; every spelling tried either
 *     reloads it or parks it in ip.
 *  2. `mov sb,r4` is one `mov` in the ROM at that point and two here
 *     (`mov r8,r5; mov r9,r4`) -- the ROM copies the 0x0808E56C pool address
 *     into r8 immediately after its `ldr`, this draft defers it.
 *  3. `v * 24 + gUnknown_08499598[i].unk1d` evaluates the multiply first here
 *     and the array address first in the ROM (same instruction count).
 * All three are the same register-allocation residual: one value too many is
 * live across 0x08018326. Size is already exact, so this is an allocation
 * problem and NOT a statement-order or type problem.
 *
 * AXES RULED OUT: bitfield container width (probed -- BgCntBuf's own note
 * records it is byte-neutral); `v` as u16 rather than s16 (the `lsls #16;
 * asrs #16` before the multiply is decisive); binding the sub_08499598 record
 * to a pointer local; `w` as a separate u16 local; `s16 t`. Next thing to try
 * is decomp-permuter on the allocation, per the >256-byte rule in the brief.
 */
void sub_08018254(s16 a)
{
    struct Unk0200C528Node *node;
    int t;
    int i;
    s16 v;
    u16 raw;
    void *null;

    gUnknown_03001FC8.raw = 0;
    gUnknown_030024E0.raw = 0;
    gUnknown_03001FC8.bits.chr_block = gUnknown_03002B6C.bits.chr_block;
    gUnknown_03001FC8.bits.tm_block = 0xd;
    gUnknown_030024E0.bits.chr_block = gUnknown_030030B4.bits.chr_block;
    gUnknown_030024E0.bits.tm_block = 0x1c;
    gUnknown_03002004.raw = 0;
    gUnknown_03002004.bits.mode = 0;
    gUnknown_03002004.bits.obj_mapping = 1;
    gUnknown_03002004.bits.bg0_enable = 1;
    gUnknown_03002004.bits.bg1_enable = 1;
    gUnknown_03002004.bits.bg2_enable = 0;
    gUnknown_03002004.bits.bg3_enable = 0;
    gUnknown_03002004.bits.hblank_interval_free = 1;
    gUnknown_03002B48 = 0;
    gUnknown_03001FC0 = 0;
    gUnknown_030030D8 = 0;
    gUnknown_0300303C = 0;
    gUnknown_03002F90 = gUnknown_0200C528[a].unk04->unk0c;
    node = gUnknown_0200C528[a].unk04;
    raw = node->unk08;
    t = (s16)raw;
    i = t & 0x7fff;
    v = node->unk0a;
    if ((s16)node->unk0a == 0)
        v = 1;
    v--;
    if (t != -1)
    {
        if (((s16)raw & 0x8000) != 0)
        {
            gUnknown_03002F08.unk02 = gUnknown_08499598[i].unk1d;
            gUnknown_03002F08.unk02 += v * 24;
        }
        else
            gUnknown_03002F08.unk02 = raw;
    }
    sub_08012A54(gUnknown_0848A370[(s16)gUnknown_03002F90]);
    null = NULL;
    if (gUnknown_03002F20 != null)
        gUnknown_03002F20();
    else
        sub_08071948(gUnknown_0849958C, 0, 0, gUnknown_080D445C,
                     (u16)((gUnknown_03002F08.unk00 << 12) | 0x360));
    sub_08011E54(gUnknown_0849958C, (void *)0x0600E000, 0x200);
    sub_080179AC();
    sub_08018194(gUnknown_03002F08.unk02);
    gUnknown_0200C528[a].unk0e = 0x2f;
    gUnknown_03001420 = 0x2f;
    sub_08011AAC((void *)sub_08017EEC);
    gUnknown_0200C528[a].unk08 = (void *)sub_0801820C;
}
