#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08070620.
 * sub_08070620 @ 0x08070620
 */

/* m4aMPlayFadeOutTemporarily. See sub_080703B8 for why the trailing ident store
 * is needed even though it emits nothing.
 */
void sub_08070620(struct MusicPlayerInfo * mplayInfo, u16 speed)
{
    u32 ident = mplayInfo->ident;

    if (ident != MPLAY_ID_NUMBER)
        return;

    mplayInfo->fadeOC = speed;
    mplayInfo->fadeOI = speed;
    mplayInfo->fadeOV = (64 << FADE_VOL_SHIFT) | TEMPORARY_FADE;
    mplayInfo->ident = ident;
}
