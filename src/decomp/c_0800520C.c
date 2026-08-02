#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800520C.
 * sub_0800520C @ 0x0800520C, sub_080052D8 @ 0x080052D8, sub_080053A8 @ 0x080053A8, sub_08005474 @ 0x08005474
 */

void sub_0800520C(void)
{
    gUnknown_0200B0B0->unk00 &= 0xFEFF;
    gUnknown_0200B0B0->unk10 = 0;
    if (sub_0803CCB8(gUnknown_0200B0B0->unk10, gUnknown_0200B204) != 1)
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0x9FE]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488164);
        }
        else
        {
            sub_080193B0(gUnknown_084882E4);
        }
    }
    else
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0x9FE]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488224);
        }
        else
        {
            sub_080193B0(gUnknown_08488394);
        }
    }
}

void sub_080052D8(void)
{
    gUnknown_0200B0B0->unk00 &= 0xFEFF;
    gUnknown_0200B0B0->unk10 = 1;
    if (sub_0803CCB8(gUnknown_0200B0B0->unk10, gUnknown_0200B204) != 1)
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0x9FF]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488164);
        }
        else
        {
            sub_080193B0(gUnknown_084882E4);
        }
    }
    else
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0x9FF]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488224);
        }
        else
        {
            sub_080193B0(gUnknown_08488394);
        }
    }
}

void sub_080053A8(void)
{
    gUnknown_0200B0B0->unk00 &= 0xFEFF;
    gUnknown_0200B0B0->unk10 = 2;
    if (sub_0803CCB8(gUnknown_0200B0B0->unk10, gUnknown_0200B204) != 1)
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0xA00]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488164);
        }
        else
        {
            sub_080193B0(gUnknown_084882E4);
        }
    }
    else
    {
        if (!sub_080051EC((const char *)&gUnknown_0200B0B0->unk9c))
        {
            sub_08004E38((char *)&gUnknown_0200B0B0->unk9c, (const char *)gUnknown_08610A38[0xA00]);
            gUnknown_0200B0B0->unk00 |= 0x100;
            sub_080193B0(gUnknown_08488224);
        }
        else
        {
            sub_080193B0(gUnknown_08488394);
        }
    }
}

/* `movs r3, #0` appears at the TOP OF EACH ARM, not once before the branch, so
 * the returned 0 is assigned inside both arms rather than at the declaration.
 * That is what frees r4 to hold the 0x200/0x400/0x800 mask; with a single
 * `int result = 0;` initialiser agbcc keeps r3 live across the whole body and
 * the masks land in r3 instead (measured with compile_probe, -4 bytes). */
int sub_08005474(int a1)
{
    int result;

    if (sub_0803CCB8((u8)a1, gUnknown_0200B204) == 1)
    {
        result = 0;
        switch (a1)
        {
        case 0:
            gUnknown_0200B0B0->unk00 |= 0x200;
            break;
        case 1:
            gUnknown_0200B0B0->unk00 |= 0x400;
            break;
        case 2:
            gUnknown_0200B0B0->unk00 |= 0x800;
            break;
        }
    }
    else
    {
        result = 0;
        switch (a1)
        {
        case 0:
            gUnknown_0200B0B0->unk00 &= 0xFDFF;
            break;
        case 1:
            gUnknown_0200B0B0->unk00 &= 0xFBFF;
            break;
        case 2:
            gUnknown_0200B0B0->unk00 &= 0xF7FF;
            break;
        }
    }
    return result;
}
