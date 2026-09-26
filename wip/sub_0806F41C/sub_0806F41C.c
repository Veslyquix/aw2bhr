#include "global.h"
#include "proc.h"
#include "hardware.h"
#define true 1
#define CONCAT11(a, b) ((((u16)(u8)(a)) << 8) | (u8)(b))
#define CONCAT44(a, b) (((u64)(a) << 32) | (u32)(b))
#include "global.h"
#include "proc.h"
#include "hardware.h"

/*
 * calls: ApplyPaletteExt, CpuFastSet, Decompress, Proc_EndEach, Proc_Goto, Proc_Start, sub_08012358, sub_08013AEC, sub_08013C00, sub_0803CBD8, sub_0806AEC4, sub_0806E210
 * touches: gDispIo, gUnknown_03002B6C, gUnknown_0816E808, gUnknown_08499578, gUnknown_08582AF4, gUnknown_08582CAC
 */
/* sub_0806F41C @ 0x0806F41C, 308 bytes, THUMB.
 * No prototype exists for this one. 1 argument register(s) are read
 * before being written, so it takes at least that many -- but the
 * count is a floor, not the answer: a struct passed by value occupies
 * two consecutive registers and looks like two arguments here, and
 * anything past r3 arrives on the stack as ldr rN, [sp, #...].
 */
int sub_0806F41C(int a1)
{
int *piVar1;
  u32 uVar2;
  u32 uVar3;
  s8 *pcVar4;
  int iVar5;
  int iVar6;

  int local_18;

  *(u8 *)((u32)&REG_DISPCNT + 1) = *(u8 *)((u32)&REG_DISPCNT + 1) & 0x1f;
  sub_08012358();
  uVar3 = IsCampaignCompletionFlagSet(0x22);
  iVar6 = -((int)(-uVar3 | uVar3) >> 0x1f);
  Proc_EndEach(gUnknown_08582AF4);
  sub_0806E210((int)*(s8 *)(a1 + 0x38),(void *)a1);
  piVar1 = (int *)gUnknown_0816E808;
  if (*(s8 *)(*(s8 *)(a1 + 0x38) * 0x10 + (u32)gUnknown_0816E808 + 0xd) == '\x01') {
    gUnknown_03002B6C.raw |= 0x80;
  }
  else {
    gUnknown_03002B6C.raw &= 0x7f;
  }
  uVar2 = ((u32)&gUnknown_08582CAC);
  iVar5 = *piVar1;
  pcVar4 = (s8 *)(a1 + 0x38);
  if ((*(s16 *)(*pcVar4 * 0x10 + iVar5 + 0xe) == 0) || (iVar6 != 0)) {
    Proc_EndEach(gUnknown_08582CAC);
    uVar3 = *(u32 *)(*pcVar4 * 0x10 + iVar5);
    if (uVar3 < 0x12) {
      sub_0806AEC4((int)*pcVar4);
    }
    else {
      Decompress((u8 *)uVar3,(void *)0x06000000);
      Decompress((u8 *)*(u32 *)(*pcVar4 * 0x10 + iVar5 + 4),(void *)gUnknown_08499578);
      ApplyPaletteExt((u16 *)*(u32 *)(*pcVar4 * 0x10 + iVar5 + 8),0,
                      (u32)*(u8 *)(*pcVar4 * 0x10 + iVar5 + 0xc) << 5);
    }
  }
  else {
    Proc_EndEach(gUnknown_08582CAC);
    Proc_Start((const struct ProcCmd *)uVar2,(ProcPtr)a1);
    local_18 = iVar6;
    CpuFastSet(&local_18,(void *)0x06000000,0x01000010);
    sub_08013C00();
    Proc_Goto((ProcPtr)a1,1);
  }
  sub_08013AEC();
  return 0;
}
