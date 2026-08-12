#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800EB5C.
 * sub_0800EB5C @ 0x0800EB5C
 */

/* sub_0800EB5C @ 0x0800EB5C, 160 bytes. Wave 56 (W56-S): MATCHED, first attempt.
 *
 * Places a 3x3 block of tiles when the terrain cell at (x, y) reads 4. The two
 * map reads use the local-struct idiom that include/unknown-globals.h documents
 * for gUnknown_08499590 (wave 34, W34-F): the SYMBOL stays `u8 *`, but the byte
 * arithmetic is written through a struct declared locally here and cast onto it,
 * because only a COMPONENT_REF preserves the ROM's `(map + K) + idx`
 * association. Written flat as `*(u16 *)(gUnknown_08499590 + 0x417A + y * 2)`,
 * fold's associate path reorders it to `(map + y * 2) + 0x417A` and the match is
 * lost; binding a `u16 *rows` local fixes the association but moves the pool.
 *
 * Both planes are reached from the one `map` binding, so gUnknown_08499590 is
 * loaded once -- matching the ROM's single `ldr r1, [r0]`. The pool order
 * (0x417A before 0x1432) falls out of source order: the row table is read first.
 */

struct MapEB5C
{
    u8 filler0[0x1432];
    u8 terrain[0x2D48];
    u16 rowOffset[1];
};

void sub_0800EB5C(int x, int y)
{
    struct MapEB5C *map = (struct MapEB5C *)gUnknown_08499590;

    if (map->terrain[map->rowOffset[y] + x] == 4) {
        sub_0800EBFC(x, y, 0x25);
        sub_0800EBFC(x, y + 1, 0x45);
        sub_0800EBFC(x, y + 2, 0x65);
        sub_08001158(x + 1, y, 0x26);
        sub_08001158(x + 2, y, 0x27);
        sub_08001158(x + 1, y + 1, 0x46);
        sub_08001158(x + 2, y + 1, 0x47);
        sub_08001158(x + 1, y + 2, 0x66);
        sub_08001158(x + 2, y + 2, 0x67);
    }
}
