#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080048D4.
 * sub_080048D4 @ 0x080048D4
 */

/* Copies the up-to-19-byte NUL-terminated name at gUnknown_0200B0B0->unk9c
 * into the current gUnknown_03001470 slot at +0x1e, then hands the source to
 * sub_0804B10C. sub_0800487C (already promoted) strcmps the same two
 * addresses, which corroborates both as strings.
 *
 * THE 0x9c NAME FIELD IS AN ARRAY IN THE ORIGINAL SOURCE, and that is a
 * measured claim, not a guess: the ROM computes `g + 0x9c` and THEN adds `i`,
 * which is the ARRAY_REF tree. Spelling it `(&g->unk9c)[i]` on the scalar the
 * shared header declares gives `g + i` then `+ 0x9c` -- fold is free to
 * reassociate the two integer addends -- and that one swapped pair was the only
 * difference left in an otherwise byte-exact 88-byte candidate. The extent is
 * exact rather than assumed: 0x9c..0xae is the 0x13 bytes this loop copies.
 *   include/unknown-globals.h declares `u8 unk9c;` followed by
 * `filler_9d[0x11]` and a separately-named `unkae` that sub_0800492C writes, so
 * turning it into `u8 unk9c[0x13]` is a SHARED-STRUCT RESHAPE. It is flagged
 * there instead of made here; struct NameBlk is the local, non-invasive way to
 * get the same tree and is byte-identical to the array member.
 *
 * struct Unk03001470 has the same problem at the destination end and is also
 * left alone: 0x1e is typed `s16 unk1e` (a frame counter measured from
 * sub_0803B118's signed compare) and 0x20/0x22/0x24 are s16 indices with
 * independent `ldrsh` evidence, yet this loop writes 0x1e..0x30 as bytes across
 * all of them. Both readings have evidence, so the slot is a UNION -- wave 40's
 * W40-F reaches the same conclusion from the other side, calling its layout
 * `struct Unk8019A60` a gUnknown_03001470 slot OVERLAY.
 *
 * gUnknown_0200B0B0 IS NAMED EXACTLY TWICE and both mentions are load-bearing:
 * THREE mentions crosses agbcc's -fforce-addr threshold and buys a .rodata
 * indirection the ROM does not have (+20 bytes, measured); ONE mention, bound
 * at the TOP of the body, lets LICM hoist it and loses both reloads (-4 bytes,
 * measured). The reload survives only because `q` is assigned AFTER the `strb`,
 * which is what kills the invariance.
 *
 * DO/WHILE, NOT `for`. With two exits -- the NUL break and the counter -- the
 * `for` spelling makes agbcc rotate the loop and emit the i == 0 iteration a
 * second time ahead of it, with `d[0]` folded to a `strb [p,#30]`
 * displacement: +20 bytes, measured. */
struct Unk48D4Name
{
    /* 0x00 */ u8 nm[0x13];
};

void sub_080048D4(void)
{
    struct Unk03001470 *p;
    u8 *d;
    u8 *q;
    int i;

    sub_08011B18();
    p = &gUnknown_03001470[gUnknown_03001FBC];
    i = 0;
    d = (u8 *)&p->unk1e;

    do
    {
        d[i] = ((struct Unk48D4Name *)&gUnknown_0200B0B0->unk9c)->nm[i];
        q = &gUnknown_0200B0B0->unk9c;
        if (q[i] == 0)
            break;
        i++;
    } while (i <= 0x12);

    sub_0804B10C((int)q, 8);
}
