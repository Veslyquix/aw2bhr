#include "global.h"

struct ListBlock {
  struct ListBlock *next;
  s32 count;
  void *items[32];
};

extern u8 *gUnknown_086173EC;
extern void *sub_08014E44(u32 size);

int sub_0808D680(void *item) {
  struct ListBlock **headSlot = (struct ListBlock **)(gUnknown_086173EC + 0x148);
  struct ListBlock *block = *headSlot;

  if (block == NULL) {
    block = (struct ListBlock *)(gUnknown_086173EC + 0x14C);
    *headSlot = block;
  }

  if (block->count > 0x1F) {
    block = sub_08014E44(0x88);
    if (block == NULL) {
      return -1;
    }
    block->count = 0;
    block->next = *(struct ListBlock **)(gUnknown_086173EC + 0x148);
    *(struct ListBlock **)(gUnknown_086173EC + 0x148) = block;
  }

  block->items[block->count] = item;
  block->count++;
  return 0;
}
