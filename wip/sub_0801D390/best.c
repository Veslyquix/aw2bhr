#include "global.h"

/* The byte at +0x31 of the gUnknown_0200E438 record -- byte 1 of the eight-byte
 * `struct UnkVec unk30`, i.e. bit 12 of its first word.  The ROM tests it with
 * `ldrb; lsls #0x1b; cmp #0; bge`, which is a SIGNED one-bit bitfield at bit 12
 * and nothing else: a plain `& 0x10` costs an extra `movs`+`ands` pair and a
 * `>> 4 & 1` costs two more.  Wave 56, W56-H. */
struct Unk0801D390Bits
{
    u32 unk00_0:12;
    s32 unk00_c:1;
};

void sub_0801D390(int a1, int a2)
{
    struct Unk0200E438 *e;
    u16 *p;
    u16 v;
    int n;
    int end;
    int t;
    u32 *q;

    gUnknown_03003040 = a1;
    e = &gUnknown_0200E438[a1];
    p = (u16 *)e->unk08;

    if (p == NULL)
        return;
    do
    {
        end = 0;
        v = *p;
        switch (v & ~0xFFF)
        {
        case 0x0000:
            if (a2 == 0)
                return;
            if ((s16)e->unk1c != 0)
                e->unk1c = e->unk1c - 1;
            else
                e->unk1c = (v & 0xFFF) - 1;
            if ((s16)e->unk1c != 0)
                return;
            e->unk08 = (u32)(p + 1);
            e->unk02 = 0;
            return;
        case 0x2000:
            n = v & 0xFFF;
            p = (u16 *)e->unk04 + n;
            break;
        case 0x1000:
            e->unk24 = v & 0xFF;
            p++;
            if (a2 == 0)
            {
                q = (u32 *)e->unk20;
                q += e->unk24;
                if (((struct Unk0801D390Bits *)&e->unk30)->unk00_c == 0)
                    sub_0801D348(e->unk26, (e->unk14 + e->unk0c) / 256,
                                 (e->unk18 + e->unk10) / 256, *q,
                                 e->unk1e, e->unk28,
                                 *(long long *)&e->unk30, e->unk38);
            }
            break;
        case 0x5000:
            n = v & 0xFFF;
            p++;
            if (n != 0)
            {
                if (e->unk02 & 8)
                {
                    p++;
                    break;
                }
                e->unk02 |= 8;
                sub_0801E294(e->unk28, n, *(s16 *)p++);
            }
            else
            {
                if (e->unk02 & 4)
                {
                    p++;
                    break;
                }
                e->unk02 |= 4;
                sub_0801E264(e->unk28, *(s16 *)p++);
            }
            break;
        case 0x6000:
            n = v & 0xFFF;
            p++;
            t = *(s16 *)p++;
            if (n != 0)
            {
                if (e->unk02 & 0x20)
                {
                    p++;
                    break;
                }
                e->unk02 |= 0x20;
                sub_0801E27C(e->unk28, n, t * 0x100 / 100,
                             *(s16 *)p++ * 0x100 / 100);
            }
            else
            {
                if (e->unk02 & 0x10)
                {
                    p++;
                    break;
                }
                e->unk02 |= 0x10;
                sub_0801E248(e->unk28, t * 0x100 / 100,
                             *(s16 *)p++ * 0x100 / 100);
            }
            break;
        case 0xE000:
            e->unk2c = v & 0xFFF;
            p++;
            e->unk08 = (u32)p;
            break;
        case 0xD000:
            e->unk26 = v & 0xFFF;
            p++;
            break;
        case 0xF000:
            switch (v & 0xF00)
            {
            case 0xF00:
                e->unk08 = (u32)p;
                if (a2 != 0)
                    return;
                q = (u32 *)e->unk20;
                q += e->unk24;
                if (((struct Unk0801D390Bits *)&e->unk30)->unk00_c == 0)
                    sub_0801D348(e->unk26, (e->unk14 + e->unk0c) / 256,
                                 (e->unk18 + e->unk10) / 256, *q,
                                 e->unk1e, e->unk28,
                                 *(long long *)&e->unk30, e->unk38);
                return;
            case 0xE00:
                if (a2 != 0)
                    sub_0801D81C(a1);
                return;
            case 0xA00:
                e->unk1e = v;
                p++;
                break;
            case 0x900:
                e->unk08 = (u32)p++;
                e->unk08 += 2;
                break;
            }
            break;
        }
        if (end != 0)
            break;
    } while (p != NULL);
}
