#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0808AAA0.
 * BgAffineSet @ 0x0808AAA0, CpuFastSet @ 0x0808AAA4, CpuSet @ 0x0808AAA8, Div @ 0x0808AAAC, DivRem @ 0x0808AAB0, HuffUnComp @ 0x0808AAB8, LZ77UnCompVram @ 0x0808AABC, LZ77UnCompWram @ 0x0808AAC0, MultiBoot @ 0x0808AAC4, RLUnCompVram @ 0x0808AACC, RLUnCompWram @ 0x0808AAD0, SoftReset @ 0x0808AAD4, VBlankIntrWait @ 0x0808AAEC
 */

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dst, s32 count)
{
    asm("svc #0xe");
}

void CpuFastSet(const void *src, void *dst, u32 mode)
{
    asm("svc #0xc");
}

void CpuSet(const void *src, void *dst, u32 mode)
{
    asm("svc #0xb");
}

s32 Div(s32 num, s32 denom)
{
    asm("svc #6");
}

int DivRem(int num, int denom)
{
    asm("svc #6\n.short 0x1c08");
}

void HuffUnComp(const void *src, void *dst)
{
    asm("svc #0x13");
}

void LZ77UnCompVram(const void *src, void *dst)
{
    asm("svc #0x12");
}

void LZ77UnCompWram(const void *src, void *dst)
{
    asm("svc #0x11");
}

int MultiBoot(struct Unk08062FB8 *param)
{
    asm("movs r1, #1\nsvc #0x25");
}

void RLUnCompVram(const void *src, void *dst)
{
    asm("svc #0x15");
}

void RLUnCompWram(const void *src, void *dst)
{
    asm("svc #0x14");
}

void SoftReset(int flags) __attribute__((naked));
void SoftReset(int flags)
{
    asm(".short 0x4b03\n.short 0x2200\n.short 0x701a\n.short 0x4903\n.short 0x468d\n.short 0xdf01\n.short 0xdf00\n.short 0x0000\n.word 0x04000208\n.word gUnknown_03007F00");
}

void VBlankIntrWait(void)
{
    asm("movs r2, #0\nsvc #5");
}
