#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08018BAC.
 * sub_08018BAC @ 0x08018BAC
 */

/* RETYPED in wave 28 (W28-A) from `bool8` to `int`, and re-verified: the body
 * is `movs r0, #1` at every return width, so it never was evidence. Its three
 * callers are -- sub_08018BCC, sub_08018F34 and sub_08018F74 each end
 * `bl sub_08018BAC; lsls r0, #0x10; asrs r0, #0x10`, which is an INT result
 * converted to those functions' own `s16` return type. A `bool8` result would
 * have been re-narrowed `lsls #0x18; lsrs #0x18` instead, and an `s16` one
 * needs no conversion at all. See the note in include/unknown-functions.h. */
int sub_08018BAC(s16 a)
{
    gUnknown_0200C528[a].unk04 = gUnknown_0200C528[a].unk04->unk04;
    return TRUE;
}
