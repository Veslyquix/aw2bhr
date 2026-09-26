#include "global.h"
#include "proc.h"
#define true 1
#define CONCAT11(a, b) ((((u16)(u8)(a)) << 8) | (u8)(b))
#define CONCAT44(a, b) (((u64)(a) << 32) | (u32)(b))
#include "global.h"

/*
 * calls: Interpolate, Proc_End, sub_080135A4
 */
/* sub_08071B9C @ 0x08071B9C, 232 bytes, THUMB.
 * No prototype exists for this one. 1 argument register(s) are read
 * before being written, so it takes at least that many -- but the
 * count is a floor, not the answer: a struct passed by value occupies
 * two consecutive registers and looks like two arguments here, and
 * anything past r3 arrives on the stack as ldr rN, [sp, #...].
 */
int sub_08071B9C(int a1)
{
u16 uVar1;
  u16 uVar2;
  u16 uVar3;
  u16 uVar4;
  int iVar5;
  int iVar6;

  int local_2c;
  u16 *local_24;
  
  iVar5 = *(int *)(a1 + 0x2c);
  iVar6 = *(int *)(iVar5 + 0x20);
  local_24 = *(u16 **)(iVar5 + 0x24);
  if ((*(u16 *)(iVar5 + 0x28) == *(u16 *)(iVar5 + 0x2c)) ||
     (*(u16 *)(iVar5 + 0x2a) < *(u16 *)(iVar5 + 0x28))) {
    Proc_End((ProcPtr)a1);
  }
  else {
    local_2c = 0;
    do {
      uVar4 = *(u16 *)(local_2c * 2 + iVar5);
      uVar1 = *(u16 *)(local_2c * 2 + iVar6);
      uVar2 = Interpolate(0,uVar4 & 0x1f,uVar1 & 0x1f,
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x28),
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x2a));
      uVar3 = Interpolate(0,uVar4 & 0x3e0,uVar1 & 0x3e0,
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x28),
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x2a));
      uVar4 = Interpolate(0,uVar4 & 0x7c00,uVar1 & 0x7c00,
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x28),
                          *(u16 *)(*(int *)(a1 + 0x2c) + 0x2a));
      *local_24 = (uVar4 & 0x7c00) | (uVar3 & 0x3e0) | (uVar2 & 0x1f);
      local_24 = local_24 + 1;
      local_2c = local_2c + 1;
    } while (local_2c < 0x10);
    sub_080135A4();
    *(s16 *)(*(int *)(a1 + 0x2c) + 0x28) = *(s16 *)(*(int *)(a1 + 0x2c) + 0x28) + 1;
  }
  return 0;
}
