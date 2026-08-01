#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08017C4C.
 * sub_08017C4C @ 0x08017C4C, sub_08017C70 @ 0x08017C70, sub_08017CB0 @ 0x08017CB0, sub_08017CF0 @ 0x08017CF0, sub_08017D30 @ 0x08017D30
 */

/* sub_08017C70 and sub_08017CB0's callback, and sub_08017ABC's twin: clear the
 * slot's callback once gUnknown_0849A00C is no longer live. The `(s32)` cast is
 * the spelling every other sub_08015BD0 caller in src/decomp already uses. */
void sub_08017C4C(struct Unk0200C528 *slot)
{
    if (sub_08015BD0((s32)gUnknown_0849A00C) == -1)
        slot->unk08 = NULL;
}

/* The node's unk08/unk0a are declared `u16` but read `ldrsh` here, so they are
 * cast -- the same treatment unk0c gets in sub_08017DD4, where the declared
 * type is `u32` and an `ldrsh` can only be a cast. Byte-neutral against
 * retyping the members, so the header is left alone. */
bool8 sub_08017C70(s16 a)
{
    struct Unk0200C528Node *p = gUnknown_0200C528[a].unk04;

    sub_08029088((s16)p->unk08, (s16)p->unk0a);
    gUnknown_0200C528[a].unk08 = (struct Unk0200C528Node *)sub_08017C4C;
    gUnknown_0200C528[a].unk04++;
    return FALSE;
}

/* sub_08017C70's twin, differing only in the callee. */
bool8 sub_08017CB0(s16 a)
{
    struct Unk0200C528Node *p = gUnknown_0200C528[a].unk04;

    sub_0802909C((s16)p->unk08, (s16)p->unk0a);
    gUnknown_0200C528[a].unk08 = (struct Unk0200C528Node *)sub_08017C4C;
    gUnknown_0200C528[a].unk04++;
    return FALSE;
}

/* The arms are written inverted relative to the ROM's block order on purpose.
 * When BOTH arms of an if/else end in `return`, agbcc emits the ELSE inline and
 * branches to the THEN on the condition being true -- so the source that
 * produces the ROM's `bne` over an inline cursor-advance is
 * `if (g != 1) <call>; else <advance>`. Writing it the natural way round, with
 * or without an explicit `else`, swaps the two blocks (measured with
 * compile_probe, wave 26). */
s16 sub_08017CF0(s16 a)
{
    if (gUnknown_03002514 != 1)
        return sub_08017A80(a);
    else
    {
        gUnknown_0200C528[a].unk04++;
        return TRUE;
    }
}

/* sub_08017CF0's twin over sub_08017A58, and the function that settles the
 * handler family's return type: it returns sub_08017A58's result unconverted
 * and the ROM narrows it `lsls #0x10; asrs #0x10`, which a `bool8` callee
 * cannot produce. See the note in unknown-functions.h. Same inverted-arm
 * spelling as sub_08017CF0. */
s16 sub_08017D30(s16 a)
{
    if (gUnknown_03002514 != 1)
        return sub_08017A58(a);
    else
    {
        gUnknown_0200C528[a].unk04++;
        return TRUE;
    }
}
