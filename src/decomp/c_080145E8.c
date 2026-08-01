#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080145E8.
 * sub_080145E8 @ 0x080145E8
 */

/* Copies the tail of the gUnknown_0200C020 record into another record of the
 * same type -- exactly the fields sub_080147B4 builds, in exactly the order
 * sub_080147B4 writes them (0x20, 0x24, 0x28, 0x2c, 0x2e, then 0x36/0x34,
 * 0x38, 0x30..0x33, 0x39, 0x3a, 0x3c, 0x40). That agreement is what let
 * struct Unk08014074's filler be replaced with real fields in wave 32.
 *
 * `d->unk34 = d->unk36 = src` and not two statements: one `ldrh` feeds two
 * `strh`s, and the 0x36 store comes FIRST, which is the inner assignment. */
void sub_080145E8(struct Unk08014074 *d)
{
    d->unk20 = gUnknown_0200C020.unk20;
    d->unk24 = gUnknown_0200C020.unk24;
    d->unk28 = gUnknown_0200C020.unk28;
    d->unk2c = gUnknown_0200C020.unk2c;
    d->unk2e = gUnknown_0200C020.unk2e;
    d->unk34 = d->unk36 = gUnknown_0200C020.unk34;
    d->unk38 = gUnknown_0200C020.unk38;
    d->unk30 = gUnknown_0200C020.unk30;
    d->unk31 = gUnknown_0200C020.unk31;
    d->unk32 = gUnknown_0200C020.unk32;
    d->unk33 = gUnknown_0200C020.unk33;
    d->unk39 = gUnknown_0200C020.unk39;
    d->unk3a = gUnknown_0200C020.unk3a;
    d->unk3c = gUnknown_0200C020.unk3c;
    d->unk40 = gUnknown_0200C020.unk40;
}
