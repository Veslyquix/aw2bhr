#include "global.h"

extern u32 gUnknown_03001FD4;
// Get next RN?
u32 sub_080129E0(void) {
  u32 s = gUnknown_03001FD4 << 2;
  u32 result = s + 2;
  u32 tmp = s + 3;
  result *= tmp;
  result >>= 2;
  gUnknown_03001FD4 = result;
  return result;
}
