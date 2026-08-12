#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08011CAC.
 * Decompress @ 0x08011CAC
 */

/* Decompress @ 0x08011CAC, 100 bytes. Wave 56 (W56-S): MATCHED.
 *
 * Dispatches to a per-format decompressor, or falls back to a straight
 * CpuFastSet copy when the table slot is NULL. gUnknown_08489314 is declared in
 * include/unknown-globals.h with the evidence for its element type.
 *
 * Three things here were each worth an attempt, and all three are ORDERING or
 * CODEGEN-SHAPE facts rather than semantics -- the size matched from the second
 * attempt onward while the byte score sat at 76%, exactly the case the brief's
 * size-delta rule describes.
 *
 * 1. THE 0/1 FLAG. The ROM emits `movs r2,#1 / cmp / bhi L / movs r2,#0 / L:`.
 *    Getting this required matching BOTH the position of the preset and its
 *    polarity, and the two pull in opposite directions:
 *      - `notVram = <comparison>;` as an rvalue, or `? 0 : 1` (which folds to
 *        the same tree), presets 0 and branches `bls` -- right position, wrong
 *        polarity.
 *      - `notVram = 1; if (...) notVram = 0;` presets 1 but emits the store at
 *        the top of the function, before the comparison's operands are even
 *        materialised -- right polarity, wrong position.
 *      - an if/else gets both right, because the arms are emitted after the
 *        condition's operands. THE RULE, measured over four attempts here:
 *        agbcc presets the ELSE arm's value and branches on !cond to skip the
 *        THEN arm's store. So to obtain `preset 1 / bhi / store 0` the else arm
 *        must be 1 and the condition must be the `<=` one. Writing the test in
 *        its "natural" polarity gives the mirror image and costs 12 bytes.
 *
 * 2. THE TABLE SUBSCRIPT MUST BE ITS OWN STATEMENT. With the index written
 *    inline in the subscript, agbcc hoists the base's pool `ldr` to the TOP of
 *    the block the if/else merges into -- ahead of the `ldrb` that starts the
 *    index computation. Binding the index to `idx` first moves the whole
 *    address computation (pool ldr, `lsls #2`, add, load) to the assignment
 *    statement, which is where the ROM has it. That one change was 88% -> match
 *    and was the last defect.
 *
 * 3. THE SIZE FIELD IS SPLIT AROUND THE TYPE NIBBLE. The count is
 *    `(src[0] & 0xF) | ((header & 0xFFFFFF00) >> 4)`, i.e. the header word with
 *    the type nibble at bits 4-7 DELETED and the two remaining pieces closed up
 *    -- a 28-bit byte count -- then `>> 2` for CpuFastSet's word count. Write
 *    the high half as `& 0xFFFFFF00) >> 4` and not as `(header >> 8) << 4`:
 *    they are arithmetically equal but agbcc 2.9 does NOT fold the second into
 *    the first, and leaves two shifts where the ROM has a mask and one shift.
 *    The `& 0x1FFFFF` is CpuFastSet's 21-bit count field; agbcc combines it
 *    with the `>> 2` into the `lsls #9 / lsrs #11` pair the ROM shows, so read
 *    that pair as `(x >> 2) & 0x1FFFFF` and not as a bitfield read.
 */

void Decompress(u8 * src, void * dst)
{
    void (*func)(const void *, void *);
    u32 notVram;
    u32 idx;

    if (((u32)dst - 0x06000000) <= 0x17FFF)
        notVram = 0;
    else
        notVram = 1;

    idx = notVram + ((src[0] & 0xF0) >> 3);
    func = gUnknown_08489314[idx];

    if (func == NULL)
        CpuFastSet(src, dst, (((src[0] & 0xF) | ((*(u32 *)src & 0xFFFFFF00) >> 4)) >> 2) & 0x1FFFFF);
    else
        func(src, dst);
}
