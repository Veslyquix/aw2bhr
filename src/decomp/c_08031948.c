#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08031948.
 * sub_08031948 @ 0x08031948
 */

/* The army loop clears gUnknown_0849B018->unk0a[i] only for armies
 * sub_0802F460 reports as gone, but clears gUnknown_0300449C[i] for all four.
 * Both stores carry the dead-`ldrb`-before-`strb` volatile tell; the store to
 * the non-volatile gUnknown_03003F1C two lines above does not, which is what
 * fixes that global as NOT volatile (see the park note on sub_080319AC).
 *
 * The `strb r2` reusing sub_0802F460's returned zero rather than a fresh
 * `movs` is cse propagating the known value inside the `== 0` arm; the
 * gUnknown_0300449C store sits at the merge, where it is not known, and
 * materialises its own 0. Both are plain `= 0` in the source. */
void sub_08031948(void)
{
    int i;

    gUnknown_03003F1C = 0;

    for (i = 0; i < 4; i++)
    {
        if (!sub_0802F460(i))
            gUnknown_0849B018->unk0a[i] = 0;

        gUnknown_0300449C[i] = 0;
    }

    sub_08031824();

    gUnknown_0849B060->unk00 = sub_080315E8(gUnknown_0849B060->unk00, 3, 2);
}
