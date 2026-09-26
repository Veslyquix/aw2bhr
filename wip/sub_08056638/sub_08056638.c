#include "global.h"

/* Wave 52, W52-B.  PARKED at 95.8% (6 bytes, size-exact at 144).
 *
 * Shape, statement order and control flow are all byte-exact.  The ENTIRE
 * residual is which of the two 0x6c-record row symbols wins the callee-saved
 * high register:
 *   ROM  hoists gUnknown_02029822 into sb and rematerialises gUnknown_0202980A
 *        with one inline `ldr r2,[pc]` in the swap block.
 *   here the opposite -- gUnknown_0202980A lives in sb (`mov r2,sb`) and
 *        gUnknown_02029822 is rematerialised twice at the loop top
 *        (`ldr r3,[pc]` / `ldr r0,[pc]`).
 * Same instruction count either way, so the pool words come out swapped too;
 * that is ONE fact, not two.
 *
 * RULED OUT (each measured):
 *  - flat `j * 2 + side * 0x6c + (char *)g` for both arrays: 20.8%, +8.  fold
 *    pulls the `+ 2` of `(j + 1) * 2` onto the symbol and emits `adds r0,#2`.
 *  - binding `u16 (*keys)[54] = gUnknown_02029822;`: folds the pair into one
 *    base and turns the second read into an `ldrh [r1,#2]` displacement.
 *  - separate `t`/`u` temps for the payload swap: 38.2%, +4.  REUSING `a`/`b`
 *    (they are dead by then) is what removed the two extra copies -- that is
 *    the wave-37 "reuse an existing local" lever paying off here.
 *  - decomp-permuter, four runs, ~85k iterations total from three different
 *    starting points.  Best it found was the `do { } while (0)` below, worth
 *    2 bytes; it never flipped the register.
 *
 * NOT a twin of sub_080564B8 despite the shared exemplar and adjacency: 70
 * instructions against 64, different bodies. What they do share is the 0x6c
 * record, which include/unknown-globals.h already described in full (wave 48).
 * Wave 70, W70-B: configured re-verdict remains 144/144 with six differing
 * bytes. A zero-code `+= 0` on the payload row flips the held base to
 * gUnknown_02029822, but also keeps both row addresses in registers and loses
 * the required inline gUnknown_0202980A pool load (20.8%).
  *
 * WAVE 77, W77-L. Still 144/144, six bytes, three halfwords: +0x28 and +0x34
 * `mov rN,sb` vs `ldr rN,[pc]`, +0x56 `ldr r2,[pc]` vs `mov r2,sb`.
 * NEWLY RULED OUT:
 *  - whole payload swap moved INSIDE the do/while(0), so its base pseudo
 *    lives in one basic block: 14 bytes, 90.3%.
 *  - only the last payload store moved inside: byte-neutral, still 6.
 *  - do/while(0) DELETED: still 6 bytes, but the held base moves sb->sl and
 *    the outer counter takes sb. The do/while is load-bearing for the
 *    COUNTERS, not for the payload -- do not remove it.
 *  - byte-offset-first/base-last flat spelling of the PAYLOAD ONLY,
 *    `*(u16 *)(j * 2 + side * 0x6c + (u8 *)g)`: +4 bytes, 26.4%.
 * The wave-57 `a pseudo in TWO basic blocks leaves local_alloc` rule does
 * NOT explain this residual: the payload accesses were varied over 1, 2 and
 * 3 basic blocks and the held register never flipped. Both address constants
 * have 2 references and near-equal live ranges after LICM, so this is an
 * allocno TIE and no source-level lever in this project reaches a tie-break.
 */

/* WAVE 80 (W80-F). Dead-statement / creation-order transfer test, all by
 * compile_probe against the 144/144, 6-byte draft above; no try_match spent,
 * draft unchanged. None changes a byte unless stated:
 *  - dead `p = &gUnknown_02029822[side][j];` at the inner-loop top, and dead
 *    `p = gUnknown_02029822[side];` in the swap block: byte-identical. A dead
 *    statement whose pseudo cse cannot reuse is deleted by flow before any
 *    reference is counted, so it moves nothing.
 *  - dead `p = &gUnknown_0202980A[side][j];` created BEFORE the first
 *    gUnknown_02029822 use (and the [j + 1] form): byte-identical. That
 *    lowers gUnknown_0202980A's pseudo number below gUnknown_02029822's, so
 *    the allocno-number tie-break is NOT what decides this; the two symbols
 *    do not have equal priority.
 *  - a second `do { } while (0)` around both gUnknown_02029822 loads puts
 *    gUnknown_02029822 in sb (the ROM's choice) but drags side*0x6c into ip
 *    and spills the outer counter to [sp]; around the first load only, the
 *    same with the symbols swapped. A region raises the weight of every
 *    reference inside it, the counters' included, so it cannot be aimed at
 *    one symbol here.
 */

void sub_08056638(u16 side)
{
    u16 i;
    u16 a;
    u16 b;

    for (i = 0; i < 4; i++)
    {
        u16 j;

        for (j = 0; j < 4; j++)
        {
            a = gUnknown_02029822[side][j];
            b = gUnknown_02029822[side][j + 1];

            if (a != 0xff && b != 0xff)
            {
                if (a == b)
                {
                    gUnknown_02029822[side][j + 1] = b + 1;
                    b = gUnknown_02029822[side][j + 1];
                }

                if (a > b)
                {
                    gUnknown_02029822[side][j + 1] = a;
                    gUnknown_02029822[side][j] = b;
                    a = gUnknown_0202980A[side][j];
                    do
                    {
                        b = gUnknown_0202980A[side][j + 1];
                        gUnknown_0202980A[side][j + 1] = a;
                    } while (0);
                    gUnknown_0202980A[side][j] = b;
                }
            }
        }
    }
}
