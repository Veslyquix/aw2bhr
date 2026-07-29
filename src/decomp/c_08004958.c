#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004958.
 * sub_08004958 @ 0x08004958
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004958.
 * sub_08004958 @ 0x08004958
 */


/* Family F011: `push {lr}; bl f; ldr r0,=g; movs r1,#N; bl h; pop {r0}; bx r0`.
 * Two statements and NOT a nest -- r0 is overwritten by the pool `ldr` between
 * the two calls, so nothing can survive from the first one. `pop {r0}` is the
 * void epilogue.
 *
 * sub_0801A168 is nullary and its result is discarded. gUnknown_0848721C is a
 * gUnknown_03001470 script blob handed to the standard sub_080152EC installer
 * on tree 0. */
void sub_08004958(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848721C, 0);
}
