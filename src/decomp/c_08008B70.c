#include "global.h"
#include "map.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08008B70.
 * sub_08008B70 @ 0x08008B70
 */

/* `int v` and not `u8 v`: the guard is `cmp r2, #0; ble`, and a u8 value
 * folds to `bne`.
 *
 * The element address has to be bound in a statement of its own. Both
 * `gUnknown_08499594[v].unk00` and `(gUnknown_08499594 + v)->unk00` put the
 * pointer global's deref *before* the index math; only splitting the address
 * out defers the `ldr r0, [r0]` past the stride multiply, which is what the
 * ROM has. See the pointer-global table in docs/agbcc-codegen.md. */
int sub_08008B70(int x, int y)
{
    int result = 0x19;
    struct Unk08499594 *e;
    int idx;
    int v;
    int hi;

    idx = gMap->rowOffset[y] + x;
    v = gMap->unk0012[idx];
    hi = v & 0xC0;

    if (v > 0)
    {
        e = &gUnknown_08499594[v];
        result = e->unk00 | hi;
    }

    return result;
}
