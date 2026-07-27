#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08063A3C.
 * sub_08063A3C @ 0x08063A3C
 */

struct UnkBar
{
    u32 unk00;
    u8 filler_04[0x22];
    u16 unk26;
    u8 filler_28[0x38];
};
extern struct UnkBar gUnknown_03001470[];
extern s16 gUnknown_03001FBC;

struct UnkBar *sub_08063A3C(void)
{
    return &gUnknown_03001470[gUnknown_03001FBC];
}
