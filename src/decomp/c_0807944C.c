#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807944C.
 * sub_0807944C @ 0x0807944C
 */

void sub_0807944C(void)
{
    sub_08043BA4(gPlayers[sub_0807A908()].co, 0, 11);
}
