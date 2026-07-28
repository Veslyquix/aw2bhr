#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08037678.
 * sub_08037678 @ 0x08037678
 */

/* Two independent statements, not a nest: no argument register is set up in
 * front of the second `bl`, and sub_08037628 takes nothing.
 *
 * The cast on sub_08037790 is not cosmetic. sub_08011B5C's parameter is
 * `void *` (that is how src/decomp/c_08011B34.c defines the insert half of the
 * same list), so registering a FUNCTION by address needs the explicit cast --
 * the same convention the note on sub_08011AAC in include/unknown-functions.h
 * records. It is what makes the pool word relocate against sub_08037790
 * instead of becoming a plain constant.
 */
void sub_08037678(void)
{
    sub_08011B5C((void *)sub_08037790);
    sub_08037628();
}
