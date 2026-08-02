#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080185D0.
 * sub_080185D0 @ 0x080185D0, sub_08018694 @ 0x08018694
 */

/* A gUnknown_0200C528 list-script handler, and sub_08018694's near-twin: it
 * checks the tileset the current node names, seeds gUnknown_03002514, and
 * unless that came back 1 allocates the gUnknown_03001470 slot sub_08018758
 * next door allocates -- same six arguments, same unk3c/unk38 arming, same
 * sub_080185BC installed in the script's unk08 -- then advances the cursor and
 * reports whether it is done.
 *
 * The asm's gUnknown_0808E580 and gUnknown_0808E584 are NOT objects. Both are
 * agbcc -fforce-addr .rodata words, holding 0x0200C528 and 0x03002514
 * (dereferenced in baserom.gba); sub_08018694 has its own private pair at
 * 0x0808E588/_8C holding the SAME two addresses. The honest spelling is what
 * is written here, and the force-addr level appears exactly on the two
 * addresses named more than once -- gUnknown_08610A38, gUnknown_08499588 and
 * gUnknown_03002F08 are named once each and get ordinary direct pool words.
 *
 * `*(s16 *)&...->unk08` and not a retype: the SAME node member is read signed
 * here (`movs r1,#8; ldrsh`, an index into gUnknown_08610A38) and unsigned
 * three statements later (`ldrh`, sub_08014740's u16 fourth argument). The
 * member is `u16` on four promoted files' evidence, so the signed site takes a
 * pointer cast, which emits nothing; an `(s16)` value cast would add
 * `lsls #0x10; asrs #0x10`.
 *
 * The result is a single variable set in both arms rather than two returns:
 * `movs r3,#0` / `movs r3,#1` split across a `b` into one `adds r0,r3,#0`,
 * with the shared unk04 advance after the merge. */
bool8 sub_080185D0(s16 a)
{
    struct Unk03001470 *s;
    bool8 result;

    if (sub_08014004(gUnknown_08610A38[*(s16 *)&gUnknown_0200C528[a].unk04->unk08]) == 0)
        gUnknown_03002514 = 2;

    if (gUnknown_03002514 != 1)
    {
        s = sub_08014740(7, 1, gUnknown_08499588, gUnknown_0200C528[a].unk04->unk08,
                         gUnknown_03002F08.unk00 * 0x1000, 0x100);
        s->unk3c = sub_080185A0;
        *(u8 *)&s->unk38 = 1;
        gUnknown_0200C528[a].unk08 = (struct Unk0200C528Node *)sub_080185BC;
        result = FALSE;
    }
    else
    {
        result = TRUE;
    }

    gUnknown_0200C528[a].unk04++;
    return result;
}

/* sub_080185D0's twin, three constants apart: the gUnknown_08499578 tilemap
 * buffer instead of gUnknown_08499588, palette 0xf instead of 1, and
 * sub_08013AEC installed as the slot callback instead of sub_080185A0.
 * Everything else -- the signed/unsigned split on the node's unk08, the
 * force-addr pair (0x0808E588 and 0x0808E58C hold 0x0200C528 and 0x03002514,
 * the same two addresses sub_080185D0's own pair holds), the single-variable
 * result and the shared unk04 advance -- is the same. See c_080185D0.c. */
bool8 sub_08018694(s16 a)
{
    struct Unk03001470 *s;
    bool8 result;

    if (sub_08014004(gUnknown_08610A38[*(s16 *)&gUnknown_0200C528[a].unk04->unk08]) == 0)
        gUnknown_03002514 = 2;

    if (gUnknown_03002514 != 1)
    {
        s = sub_08014740(7, 0xf, gUnknown_08499578, gUnknown_0200C528[a].unk04->unk08,
                         gUnknown_03002F08.unk00 * 0x1000, 0x100);
        s->unk3c = sub_08013AEC;
        *(u8 *)&s->unk38 = 1;
        gUnknown_0200C528[a].unk08 = (struct Unk0200C528Node *)sub_080185BC;
        result = FALSE;
    }
    else
    {
        result = TRUE;
    }

    gUnknown_0200C528[a].unk04++;
    return result;
}
