#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08072394.
 * sub_08072394 @ 0x08072394, sub_080723A8 @ 0x080723A8
 */

/* Resets the whole 0x10-entry palette-bias run and then clears the fade proc's
 * accumulator. 0x10 is the nominal fade rate this header's sub_080722B8 note
 * describes. The constant-argument twin of sub_080723A8. */
void sub_08072394(void)
{
    sub_08013780(0x10, 0x10, 0);
    sub_080723C0();
}

/* The parameterised twin of sub_08072394. Both arguments narrow with
 * `lsls #16; lsrs #16` at the call, which is the argument conversion into
 * sub_08013780's u16 parameters (its signature comes from the promoted
 * src/decomp/c_08013780.c) -- so this function's own parameters are `int`. Had
 * they been u16 themselves, PROMOTE_MODE would have delivered them already
 * zero-extended and the pairs would not be here. */
void sub_080723A8(int start, int count)
{
    sub_08013780(start, count, 0);
    sub_080723C0();
}
