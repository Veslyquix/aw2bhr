#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08010EC4.
 * sub_08010EC4 @ 0x08010EC4
 */

/* Two unrelated statements. The 0x3d-byte copy runs the WRONG way for a save:
 * sub_0808B6E8's first parameter is the destination, and here it is
 * gUnknown_08489200, an address inside the cartridge window. The store is
 * inert on hardware and nothing in the tree reads it back -- recorded rather
 * than explained.
 *
 * gUnknown_03007FFC is the BIOS interrupt-vector word, so the parameter is a
 * handler address; nothing narrows or calls it here, hence void *. */
void sub_08010EC4(void *handler)
{
    sub_0808B6E8(gUnknown_08489200, gUnknown_03003050, 0x3D);
    gUnknown_03007FFC = handler;
}
