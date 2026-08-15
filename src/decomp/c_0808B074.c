#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808B074.
 * sub_0808B074 @ 0x0808B074, sub_0808B0E8 @ 0x0808B0E8
 */

#include "hardware.h"

u16 sub_0808B074(void)
{
    u16 buffer[0x20];
    u16 result;

    REG_WAITCNT = (REG_WAITCNT & 0xfffc) | gUnknown_03005C78->unk10;

    *(volatile u8 *)0x0E005555 = 0xAA;
    *(volatile u8 *)0x0E002AAA = 0x55;
    *(volatile u8 *)0x0E005555 = 0x80;
    *(volatile u8 *)0x0E005555 = 0xAA;
    *(volatile u8 *)0x0E002AAA = 0x55;
    *(volatile u8 *)0x0E005555 = 0x10;

    sub_0808AD6C(buffer);

    result = gUnknown_03005C70(3, (u8 *)0x0E000000, 0xFF);

    REG_WAITCNT = (REG_WAITCNT & 0xfffc) | 3;

    return result;
}

u16 sub_0808B0E8(u16 sector)
{
    u16 buffer[0x20];
    u8 *addr;
    u16 result;

    if (sector > 0xF)
        return 0x80FF;

    REG_WAITCNT = (REG_WAITCNT & 0xfffc) | gUnknown_03005C78->unk10;

    addr = (u8 *)((sector << gUnknown_03005C78->unk08) + 0x0E000000);

    *(volatile u8 *)0x0E005555 = 0xAA;
    *(volatile u8 *)0x0E002AAA = 0x55;
    *(volatile u8 *)0x0E005555 = 0x80;
    *(volatile u8 *)0x0E005555 = 0xAA;
    *(volatile u8 *)0x0E002AAA = 0x55;
    *addr = 0x30;

    sub_0808AD6C(buffer);

    result = gUnknown_03005C70(2, addr, 0xFF);

    REG_WAITCNT = (REG_WAITCNT & 0xfffc) | 3;

    return result;
}
