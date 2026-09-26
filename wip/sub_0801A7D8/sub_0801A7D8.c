#include "global.h"

/* PARKED at 18.6% / +16 bytes -- wave 56, W56-F. The SHAPE is derived and is
 * believed complete; what is left is address materialisation and register
 * allocation. Do not re-derive the control flow, and do not read the
 * percentage: the candidate is +16 bytes so every later byte is shifted.
 *
 * SETTLED, read out of the assembly and confirmed by the diff shrinking each
 * time one was applied:
 *
 *   - `a2` IS DEAD. r1 is overwritten by the sub_0801B598 argument setup before
 *     anything reads it. The prototype keeps three parameters because
 *     src/decomp/c_0801ABF8.c already calls it with three.
 *   - `a1` and `a3` are the loop variables themselves, not copies. Writing
 *     `size = a3;` costs a stack slot and pushes a1 out of r4 (measured: +8).
 *   - The retry dispatch is a SWITCH over {0, 4} with case 4 falling through
 *     into case 0, not `if (retry == 0 || retry == 4)`. The `||` spelling emits
 *     a third `cmp #4` that jump threading does not remove because `retry` is
 *     in memory and gets reloaded; the switch emits agbcc's two-case chain
 *     `cmp #0/beq low; cmp #4/bne default` exactly. Worth 8 bytes.
 *   - `list[n] = i; n++;` as two statements, not `list[n++] = i;` -- the
 *     compound form increments before storing, the ROM stores first.
 *   - `gUnknown_0200CC88[16 + x]` is WRONG and `(&gUnknown_0200CC88.slotGeneration[0])[x]` is
 *     right: the first keeps `16 + x` as an integer and emits `adds #16; lsls
 *     #2`, the second folds &g[16] into the address constant asm/ prints as
 *     gUnknown_0200CCC8 and leaves `lsls #2; add base`. Worth ~12 bytes.
 *
 * THE TWO REMAINING DEFECTS:
 *
 * (1) The 0x02002000 ADDRESS HUB. The ROM materialises the buffer base as
 *     `ldr =gUnknown_02002050; subs #0x50` and reaches byte 0xfff as
 *     `base + 0xFFF` with 0xFFF loaded as a plain pool constant. This
 *     candidate folds &gUnknown_02002000[0xfff] into its own address constant
 *     0x02002FFF and then derives the base back from it as
 *     `0x02002FFF + (-0xFFF)`, which costs an extra pool word and an extra
 *     insn. Both are legal agbcc output for the same source; which one you get
 *     depends on which folded address constant CSE picks as the hub, and the
 *     hub is picked by reference count and creation order. NOTE that folding
 *     IS correct at the same offset in sub_0801ADC8 (`ldr =gUnknown_02002FFF`),
 *     so this is not a spelling rule -- do not "fix" it by making the index
 *     non-constant.
 *
 * (2) Wave 65 corrected the old reading of `orrs r0, r7`: r7 is NOT zero. It
 *     is defined by `lsls r7, r6, #4` with r6 = idx and is also used to build
 *     BUF[0xc]. The honest expression is therefore `| (idx << 4)`. This is
 *     distinct from sub_0801ADC8's genuinely zero third operand. Writing that
 *     expression directly was measured in wave 65: it widens the OR/mask to
 *     SImode (`movs #5; negs`) and regresses +16/18.56% to +24/17.71%. The
 *     source therefore needs a narrow binding that reuses the already-created
 *     `idx << 4` pseudo; the direct spelling is not retained below.
 *
 * Everything else in the diff is spill-slot numbering, which follows from those
 * two.
 *
 * WAVE 71: a `u8 tag` first defined inside the byte-0xc expression and reused
 * in the success OR is a positive result.  Writing
 * `(tag = idx << 4) + nc - 1` and later `| tag` improves the configured draft
 * from 1072/1056 (+16, 18.6%) to 1068/1056 (+12, 20.0%).  `u16 tag` regresses
 * to +16 and `int tag` to +24.  The narrow mode and definition at the first
 * store are both load-bearing; the remaining residual still includes the
 * 0x02002000 address-hub choice and its spill/allocation knock-on. */

int sub_0801A7D8(u8 a1, void *a2, int a3)
{
    int lens[16];
    int offs[16];
    u8 list[16];
    u8 flags[16];
    int cur;
    u8 n;
    int i;
    int j;
    int k;
    int nc;
    int off;
    int idx;
    u8 retry;
    u8 sum;
    u8 tag;

    sub_0801B598(gUnknown_0200CC30, (void (**)(void))gUnknown_0200CC34);

    cur = 0;
    n = 0;

    for (i = 0; i < 16; i++)
    {
        if (gUnknown_0200CC38.unk00[i] == a1 || gUnknown_0200CC38.unk00[i] == 0)
            gUnknown_0200CC38.unk10[i] = 0xff;
        else if (gUnknown_0200CC38.unk00[i] == 0xff)
        {
            list[n] = i;
            n++;
        }

        flags[i] = 0;
    }

    for (j = 0; j < n - 1; j++)
    {
        for (k = j + 1; k < n; k++)
        {
            if ((&gUnknown_0200CC88.slotGeneration[0])[list[j]] < (&gUnknown_0200CC88.slotGeneration[0])[list[k]])
            {
                u8 t;

                t = list[k];
                list[k] = list[j];
                list[j] = t;
            }
        }
    }

    for (;;)
    {
        off = 0;
        nc = 0;

        if (a3 != 0)
        {
            do
            {
                int len;

                len = 0xFAD;
                if (nc == 0 && a1 == 0)
                    len = 0xF9D;
                if (len > a3)
                    len = a3;
                a3 -= len;
                lens[nc] = len;
                offs[nc] = off;
                off += len;
                nc++;
            } while (a3 != 0);
        }

        retry = 0;

        for (idx = nc - 1; idx >= 0; )
        {
            switch (retry)
            {
            case 4:
                gUnknown_0200CC38.unk20[cur] |= 2;
                retry = 0;
                /* fallthrough */

            case 0:
                if (n == 0)
                {
                    for (i = 0; i < 16; i++)
                        gUnknown_0200CC38.unk10[i] = gUnknown_0200CC38.unk00[i];

                    return 1;
                }

                n--;
                cur = list[n];
                break;
            }

            retry++;

            if ((&gUnknown_0200CC88.slotGeneration[0])[cur] != -1)
                (&gUnknown_0200CC88.slotGeneration[0])[cur]++;

            gUnknown_0200CC38.unk10[cur] = a1;

            for (i = 0; i <= 0xfff; i++)
                gUnknown_02002000[i] |= 0xff;

            *(u32 *)gUnknown_02002000 = 0x73726132;

            if (gUnknown_0200CC38.unk40[cur] == 0x55)
            {
                gUnknown_02002000[4] = 0x55;
                gUnknown_02002000[0xfff] = 0xaa;
            }
            else
            {
                gUnknown_02002000[4] = 0xaa;
                gUnknown_02002000[0xfff] = 0x55;
            }

            gUnknown_02002000[5] = 0xf;
            gUnknown_02002000[6] = 0;
            gUnknown_02002000[7] = 0xff;
            *(u32 *)(gUnknown_02002000 + 8) = gUnknown_0200CD08;
            gUnknown_02002000[0xc] = (tag = idx << 4) + nc - 1;
            gUnknown_02002000[0xd] = a1;
            *(u16 *)(gUnknown_02002000 + 0xe) = offs[idx];

            for (i = 0; i < 16; i++)
                ((u32 *)(gUnknown_02002000 + 0x10))[i] = (&gUnknown_0200CC88.slotGeneration[0])[i];

            *(u16 *)(gUnknown_02002000 + 0x50) = lens[idx];

            for (j = 0; j < lens[idx]; j++)
                gUnknown_02002000[0x52 + j] = *(u8 *)(gUnknown_0200CC2C + offs[idx] + j);

            if (idx == 0 && a1 == 0)
            {
                for (i = 0; i < 16; i++)
                    gUnknown_0200CC38.unk00[i] = gUnknown_0200CC38.unk10[i];

                if (gUnknown_0200CD08 == 0)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (flags[i] == 0 && i != cur)
                            gUnknown_02002000[0xfef + i] |= 0xff;
                        else
                            gUnknown_02002000[0xfef + i] = gUnknown_0200CC38.unk00[i];
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                        gUnknown_02002000[0xfef + i] = gUnknown_0200CC38.unk00[i];
                }
            }

            sum = 0;

            for (i = 0; i <= 0xfff; i++)
                sum += gUnknown_02002000[i];

            gUnknown_02002000[6] = sum;
            gUnknown_02002000[7] = ~sum;

            sub_0801B618(cur, (int)gUnknown_02002000);

            if (sub_0801B648(cur, (int)gUnknown_02002000) == 0)
            {
                gUnknown_0200CC38.unk20[cur] = (gUnknown_0200CC38.unk20[cur] | 8 | tag) & 0xfb;
                gUnknown_0200CC38.unk30[cur] = gUnknown_02002000[0xc];
                gUnknown_0200CC38.unk40[cur] = gUnknown_02002000[0xfff];
                (&gUnknown_0200CC88.slotGeneration[0])[cur] = *(u32 *)(gUnknown_02002000 + 8);
                retry = 0;
                flags[cur] = 1;
                idx--;
            }
            else
            {
                gUnknown_0200CC38.unk10[cur] = 0xff;
                gUnknown_0200CC38.unk40[cur] = gUnknown_02002000[0xfff];
                retry++;
            }
        }

        if (gUnknown_0200CD08 <= 0xfffffffe)
            gUnknown_0200CD08++;

        if (a1 == 0)
            return 0;

        a1 = 0;
        a3 = ((int (*)(int))gUnknown_0200CC24)(gUnknown_0200CC2C);
    }
}








