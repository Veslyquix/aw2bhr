#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08066A20.
 * sub_08066A20 @ 0x08066A20
 */

#include "hardware.h"

/* gUnknown_0816E154 is NOT a global: it is a -fforce-addr pool word whose ROM
 * contents are 0x08580934, i.e. &gUnknown_08580934. Same for gUnknown_0816E140
 * and gUnknown_0816E150 in the neighbouring functions -- eight of the thirteen
 * words in that pool run hold the identical address. Hence the doubled
 * `ldr r0,[r1]; ldr r0,[r0]` at every read of the global.
 *
 * gUnknown_03002040 is the three-slot struct KeySt array c_08064410.c fills;
 * the 0x14 stride of the loop's induction variable is sizeof(struct KeySt). */
void sub_08066A20(void)
{
    int i;
    int cnt;

    cnt = 0;
    gUnknown_08580934->unk32 = gUnknown_08580934->unk25 * 2;

    for (i = 0; i < gUnknown_08580934->unk08; i++)
    {
        if (((struct KeySt *)&gUnknown_03002040)[i].held & 2)
            cnt++;

        if ((s8)gUnknown_08580934->unk70[i] == -1)
        {
            cnt = 0;
            break;
        }
    }

    if (cnt != 0)
    {
        sub_08063A30(sub_08063A3C(), gUnknown_08580D90);
        sub_08063A00(gUnknown_08580AF0, sub_08065F68);
        sub_08063A00(gUnknown_08580B90, sub_08065F68);
        sub_08063A00(gUnknown_08580BC8, sub_08065F68);
        sub_0806377C(gUnknown_08580D0C);
    }
    else
    {
        sub_08065E5C();
        sub_080665D4();

        if ((s8)gUnknown_08580934->unk70[gUnknown_08580934->unk25] == 0)
            sub_08065EF4();

        for (i = 0; i < gUnknown_08580934->unk08; i++)
            if ((s8)gUnknown_08580934->unk70[i] == 0)
                break;

        if (i == gUnknown_08580934->unk08)
            sub_080152EC(gUnknown_08580D3C, 4);
    }
}
