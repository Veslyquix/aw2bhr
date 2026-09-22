#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080193B0.
 * sub_080193B0 @ 0x080193B0
 */

/* sub_080193B0 @ 0x080193B0, 84 bytes, THUMB.
 * Signature below is DECLARED in include/unknown-functions.h -- it is authoritative.
 * The compiler sees that header too, so a definition that
 * disagrees will not compile.
 */
struct Unk0200C528 *sub_080193B0(const u8 *script)
{
    register int result asm("r0");
    register int slotIndex asm("r2");
    int signedIndex;

    sub_08013D40();
    sub_08017E74();
    sub_080198AC();

    sub_08019290(NULL);
    asm("lsl %0, %0, #16\n\tlsr %1, %0, #16\n\tasr %0, %0, #16"
        : "=r"(result), "=r"(slotIndex));

    if (result == -1)
        return NULL;

    asm("" : : "r"(gUnknown_0200C528));
    asm("lsl %0, %1, #16\n\tasr %0, %0, #16"
        : "=&r"(signedIndex) : "r"(slotIndex));
    gUnknown_0200C528[signedIndex].unk00
        = (struct Unk0200C528Node *)script;
    gUnknown_0200C528[signedIndex].unk08 = NULL;
    gUnknown_0200C528[signedIndex].unk04
        = (struct Unk0200C528Node *)script;
    gUnknown_0200C528[signedIndex].unk0c = 0;
    return &gUnknown_0200C528[signedIndex];
}
