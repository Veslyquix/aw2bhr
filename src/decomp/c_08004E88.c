#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004E88.
 * sub_08004E88 @ 0x08004E88
 */

void sub_08004E88(void)
{
    sub_0803CEB8(gActiveMap->unk10, gDesignRoomName);
    sub_0800CB30(1, sub_0800CAA0());
    sub_08004E38((char *)&gActiveMap->unk9c, (const char *)gDesignRoomName);
    RecountArmyProperties();
    RegisterArmyHqs();
    gActiveMap->propertyCount = CountProperties();
    gActiveMap->unk00 &= 0xEFFF;
}
