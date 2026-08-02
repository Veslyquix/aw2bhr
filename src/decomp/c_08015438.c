#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08015438.
 * sub_08015438 @ 0x08015438
 */

/* Allocates a gUnknown_03001470 slot and a gUnknown_0200E438 sprite, links
 * them both ways and installs the script. sub_08015410 is the pure forwarder
 * that swaps arguments 3 and 4 into this one.
 *
 * The two result locals are DIFFERENT types and both readouts are in the
 * epilogue. `i` is `s8`: the ROM keeps the zero-extended copy in sl and
 * re-signs it at the return (`lsls #0x18; asrs #0x18`), which is PROMOTE_MODE
 * on an s8 local. `j` is `int`: it gets ONE `lsls #0x18; asrs #0x18` -- the
 * call-site re-narrowing of sub_0801DC04's s8 return into a wide local -- and
 * every later use, including `return j`, reads that register with no further
 * extension. Declaring `j` as `s8` adds a second pair.
 *
 * Parameter 4 arrives as `void *` from the already-promoted sub_08015410 and
 * its only use here is `lsls #0x10; asrs #0x10`, so the cast chain is written
 * out rather than retyping the parameter -- the declaration in
 * unknown-functions.h is byte-identical either way and sub_08015410 is matched
 * against the `void *` spelling. Parameter 5 is the stack argument: the
 * prologue pushes eight words, so it lands at [sp, #0x20].
 */
s8 sub_08015438(void *a, int b, void *c, void *d, int e)
{
    s8 i;
    int j;

    i = sub_08015BD0(0);

    if (i != -1)
    {
        j = sub_0801DC04(c, (s16)(int)d, (s16)e);

        if (j == -1)
            return j;

        gUnknown_03001470[i].unk26 = j;
        sub_08015224(a, i, (u8)b);
        gUnknown_03001470[i].unk12 |= 2;
        gUnknown_0200E438[j].unk38 = i;
    }

    return i;
}
