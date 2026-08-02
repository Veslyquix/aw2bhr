#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080135A4.
 * sub_080135A4 @ 0x080135A4
 */

#include "hardware.h"

/* The palette-upload half of sub_08013580's pair. During forced blank the
 * shadow goes straight out with the CpuSet blitter; otherwise it is queued
 * once through sub_08011E54 and the dirty latch gUnknown_03000048 is raised so
 * sub_08013580 does not queue it again. sub_08011E54's s16 result is dropped.
 *
 * The two `movs`/`lsls` pairs are agbcc materialising PLTT (0x05000000) and
 * PLTT_SIZE (0x400) -- neither constant has low bits, so the shift form beats
 * a pool word, exactly as in sub_08013580.
 */
void sub_080135A4(void)
{
    if (gDispIo.disp_ct.forced_blank != 0)
    {
        sub_08011C68(gPal, (void *)PLTT, PLTT_SIZE);
    }
    else if (gUnknown_03000048 == 0)
    {
        sub_08011E54(gPal, (void *)PLTT, PLTT_SIZE);
        gUnknown_03000048 = 1;
    }
}
