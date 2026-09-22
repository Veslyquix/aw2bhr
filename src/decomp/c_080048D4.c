#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080048D4.
 * sub_080048D4 @ 0x080048D4
 */

/* Copies the up-to-19-byte NUL-terminated name at gActiveMap->designName
 * into the current gUnknown_03001470 slot at +0x1e, then hands the source to
 * sub_0804B10C. sub_0800487C (already promoted) strcmps the same two
 * addresses, which corroborates both as strings.
 *
 * THE 0x9c NAME FIELD IS AN ARRAY IN THE ORIGINAL SOURCE, and that is a
 * measured claim, not a guess: the ROM computes `g + 0x9c` and THEN adds `i`,
 * which is the ARRAY_REF tree. The old scalar-plus-padding declaration instead
 * reassociated the address as `g + i + 0x9c` and missed by one swapped pair.
 * The extent is exact rather than assumed: 0x9c..0xae is the 0x13 bytes this
 * loop copies. The shared declaration now records that measured array.
 *
 * struct Unk03001470 has the same problem at the destination end and is also
 * left alone: 0x1e is typed `s16 unk1e` (a frame counter measured from
 * sub_0803B118's signed compare) and 0x20/0x22/0x24 are s16 indices with
 * independent `ldrsh` evidence, yet this loop writes 0x1e..0x30 as bytes across
 * all of them. Both readings have evidence, so the slot is a UNION -- wave 40's
 * W40-F reaches the same conclusion from the other side, calling its layout
 * `struct Unk8019A60` a gUnknown_03001470 slot OVERLAY.
 *
 * gActiveMap IS NAMED EXACTLY TWICE and both mentions are load-bearing:
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
        d[i] = gActiveMap->designName[i];
        q = gActiveMap->designName;
        if (q[i] == 0)
            break;
        i++;
    } while (i <= 0x12);

    sub_0804B10C((int)q, 8);
}
