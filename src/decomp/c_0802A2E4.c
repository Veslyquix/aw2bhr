#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0802A2E4.
 * sub_0802A2E4 @ 0x0802A2E4
 */

/* MATCHED. Byte-for-byte the same function as sub_08029D1C -- identical
 * instruction stream and identical pool words. One C body, two
 * addresses; read that one for the derivation. */
int sub_0802A2E4(void *p)
{
    return sub_08029978(p, 0) + sub_08029A48(p, 0);
}
