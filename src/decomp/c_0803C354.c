#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803C354.
 * sub_0803C354 @ 0x0803C354, sub_0803C37C @ 0x0803C37C, sub_0803C3A4 @ 0x0803C3A4, sub_0803C3CC @ 0x0803C3CC, sub_0803C3F4 @ 0x0803C3F4, sub_0803C40C @ 0x0803C40C, sub_0803C434 @ 0x0803C434, sub_0803C45C @ 0x0803C45C, sub_0803C474 @ 0x0803C474, sub_0803C48C @ 0x0803C48C, sub_0803C4B4 @ 0x0803C4B4, sub_0803C4DC @ 0x0803C4DC, sub_0803C504 @ 0x0803C504, sub_0803C52C @ 0x0803C52C, sub_0803C574 @ 0x0803C574, sub_0803C580 @ 0x0803C580, sub_0803C58C @ 0x0803C58C, sub_0803C598 @ 0x0803C598, sub_0803C5C0 @ 0x0803C5C0, sub_0803C5E8 @ 0x0803C5E8, sub_0803C614 @ 0x0803C614, sub_0803C620 @ 0x0803C620, sub_0803C62C @ 0x0803C62C, sub_0803C638 @ 0x0803C638, sub_0803C644 @ 0x0803C644
 */

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C354(u32 id)
{
    if (sub_0803CA70(id))
        return -1;
    if (!sub_0803CA9C(5))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C37C(u32 id)
{
    if (sub_0803CA70(id))
        return -1;
    if (!sub_0803CA9C(7))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C3A4(u32 id)
{
    if (sub_0803CA70(id))
        return -1;
    if (!sub_0803CA9C(2))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C3CC(u32 id)
{
    if (sub_0803CA70(id))
        return -1;
    if (!sub_0803CA9C(3))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C3F4(u32 id)
{
    if (sub_0803CA70(id))
        return -1;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C40C(void)
{
    if (sub_0803CBD8(0x20))
        return -1;
    if (!sub_0803CBD8(0x21))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C434(void)
{
    if (sub_0803CBD8(0x28))
        return -1;
    if (!sub_0803CBD8(0x21))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C45C(u32 id)
{
    if (sub_0803CA9C(id))
        return -1;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C474(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C48C(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x23))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C4B4(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x24))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C4DC(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x25))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C504(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x26))
        return 0;
    return 1;
}

/* The shared body behind sub_0803C574 / sub_0803C580 / sub_0803C58C, which
 * call it with n = 3, 4 and 5. Reads as "is this thing available at rank n":
 * -1 while gUnknown_02028030.unk2a already has the bit set, 0 when unlock 0x21
 * is not held or the rank is below n, and 1 otherwise.
 *
 * `n` is signed: the compare against sub_08037DA4's result is `blt`.
 * sub_0803CBD8's result is tested with a bare `cmp r0, #0` while
 * sub_0803CAB8's needs `lsls r0, r0, #0x18` -- the two return widths side by
 * side in one function, which is the control the note on those prototypes in
 * unknown-functions.h cites.
 *
 * sub_08037DA4 is called TWICE on the same unk10, with the store to
 * gUnknown_030040D4 in between; the second `ldrh` is a genuine reload (the
 * store can alias), so this is two source expressions and not one CSE'd value.
 */

int sub_0803C52C(u32 id, int n)
{
    if (sub_0803CAB8(id))
        return -1;

    if (sub_0803CBD8(0x21))
    {
        gUnknown_030040D4 = sub_08037DA4(gUnknown_0200C420.unk10);

        if (sub_08037DA4(gUnknown_0200C420.unk10) >= n)
            return 1;
    }

    return 0;
}

/* `return sub_0803C52C(id, 3);` -- the incoming r0 passes straight through as
 * the first argument and the constant goes in r1. The epilogue is
 * `pop {r1}; bx r1`, NOT `pop {r0}; bx r0`, so the callee's result is live and
 * the `return` is load-bearing; and there is no `lsls #24; lsrs #24` after the
 * `bl`, which fixes sub_0803C52C's return at int width. */

int sub_0803C574(u32 id)
{
    return sub_0803C52C(id, 3);
}

/* `return sub_0803C52C(id, 4);` -- the incoming r0 passes straight through as
 * the first argument and the constant goes in r1. The epilogue is
 * `pop {r1}; bx r1`, NOT `pop {r0}; bx r0`, so the callee's result is live and
 * the `return` is load-bearing; and there is no `lsls #24; lsrs #24` after the
 * `bl`, which fixes sub_0803C52C's return at int width. */

int sub_0803C580(u32 id)
{
    return sub_0803C52C(id, 4);
}

/* `return sub_0803C52C(id, 5);` -- the incoming r0 passes straight through as
 * the first argument and the constant goes in r1. The epilogue is
 * `pop {r1}; bx r1`, NOT `pop {r0}; bx r0`, so the callee's result is live and
 * the `return` is load-bearing; and there is no `lsls #24; lsrs #24` after the
 * `bl`, which fixes sub_0803C52C's return at int width. */

int sub_0803C58C(u32 id)
{
    return sub_0803C52C(id, 5);
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C598(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x21))
        return 0;
    return 1;
}

/* One of the 0x0803C354-0x0803C670 tri-state predicates: -1 (blocked),
 * 1 (satisfied) or 0 (not yet). See the comment on sub_0803CA9C in
 * include/unknown-functions.h for why the bit readers return `u8`.
 */

int sub_0803C5C0(u32 id)
{
    if (sub_0803CAB8(id))
        return -1;
    if (!sub_0803CBD8(0x22))
        return 0;
    return 1;
}

/* The shared body behind the five byte-identical wrappers at
 * 0x0803C614/620/62C/638/644.
 *
 * Two things are read straight off the assembly and neither is optional.
 * The `lsls r0, r0, #0x18` after each `bl` is the eight-bit return type of the
 * gUnknown_02028030 bit readers (see the comment on sub_0803CAB8 in
 * unknown-functions.h); an `int` return emits no shift.
 * And the SECOND test's polarity is inverted from the natural spelling: the
 * ROM's `beq` jumps to the `movs r0, #0` block and falls through into
 * `movs r0, #1`, so per the branch-polarity rule the first `return` in the
 * source is the ZERO. Writing the obvious `if (sub_0803CAB8(id)) return 1;
 * return 0;` swaps those two blocks and misses at the same length.
 */

int sub_0803C5E8(u32 id)
{
    if (sub_0803CAD4(id))
        return -1;

    if (!sub_0803CAB8(id))
        return 0;

    return 1;
}

/* `return sub_0803C5E8(id);` -- one of five byte-identical forwarders at
 * 0x0803C614/620/62C/638/644. Nothing sets up an argument register, so the
 * incoming r0 is passed through unchanged, and `pop {r1}; bx r1` says the
 * result is returned rather than discarded. */

int sub_0803C614(u32 id)
{
    return sub_0803C5E8(id);
}

/* `return sub_0803C5E8(id);` -- one of five byte-identical forwarders at
 * 0x0803C614/620/62C/638/644. Nothing sets up an argument register, so the
 * incoming r0 is passed through unchanged, and `pop {r1}; bx r1` says the
 * result is returned rather than discarded. */

int sub_0803C620(u32 id)
{
    return sub_0803C5E8(id);
}

/* `return sub_0803C5E8(id);` -- one of five byte-identical forwarders at
 * 0x0803C614/620/62C/638/644. Nothing sets up an argument register, so the
 * incoming r0 is passed through unchanged, and `pop {r1}; bx r1` says the
 * result is returned rather than discarded. */

int sub_0803C62C(u32 id)
{
    return sub_0803C5E8(id);
}

/* `return sub_0803C5E8(id);` -- one of five byte-identical forwarders at
 * 0x0803C614/620/62C/638/644. Nothing sets up an argument register, so the
 * incoming r0 is passed through unchanged, and `pop {r1}; bx r1` says the
 * result is returned rather than discarded. */

int sub_0803C638(u32 id)
{
    return sub_0803C5E8(id);
}

/* `return sub_0803C5E8(id);` -- one of five byte-identical forwarders at
 * 0x0803C614/620/62C/638/644. Nothing sets up an argument register, so the
 * incoming r0 is passed through unchanged, and `pop {r1}; bx r1` says the
 * result is returned rather than discarded. */

int sub_0803C644(u32 id)
{
    return sub_0803C5E8(id);
}
