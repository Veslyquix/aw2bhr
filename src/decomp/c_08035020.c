#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08035020.
 * sub_08035020 @ 0x08035020, sub_0803504C @ 0x0803504C, sub_08035064 @ 0x08035064
 */

void sub_08035020(u16 a)
{
    sub_0803F5E4(a, 0x48);
    ApplyPaletteExt(gUnknown_0849BD20[a].unk00, 0, 0x100);
}

void sub_0803504C(struct Unk03001470 *p)
{
    gUnknown_03003FC0.unk2c = p->unk20;
    sub_08035020(gUnknown_03003FC0.unk2c);
}

/* Named per Xenesis's AW2 Subroutine List: "Code that retrieves the Sound
 * Effects for weather change IDs". The old sub_08035064 symbol is kept as a
 * linker alias below so every other unit keeps resolving it unchanged. */
void PlayWeatherChangeSound(struct Unk03001470 *p)
{
    sub_0803B4DC(gUnknown_0849BD20[p->unk20].unk04);
}

asm(".global sub_08035064\n.thumb_set sub_08035064, PlayWeatherChangeSound\n");
