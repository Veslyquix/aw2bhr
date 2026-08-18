#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0801A6C0.
 * sub_0801A6C0 @ 0x0801A6C0
 */

/* PARKED at 98.4% -- ONE byte, at +0x2a. Everything else is exact: size,
 * instruction selection, instruction order, pool words, relocations, the
 * `pop {r1}` epilogue.
 *
 *   ROM       ... str r2,[r1,#4] ; strh r2,[r1] ; ldr r1,[r5] ; str r2,[r1,#4]
 *   this      ... str r2,[r1,#4] ; strh r3,[r1] ; ldr r1,[r5] ; str r2,[r1,#4]
 *
 * The whole function turns on ONE allocator tie-break: which of the two values
 * live across the loop -- the base pointer `p` and the stored zero -- gets r3
 * and which gets r4. The ROM has base=r4, zero=r3. Written the obvious way (no
 * `v`, `p[i].unk00 = 0`) agbcc gives base=r3, zero=r4, which costs four bytes
 * in the loop instead of one in the tail. The only lever found that flips it is
 * giving the zero a THIRD reference, and the only place to put one is one of
 * the three tail stores -- whichever one takes it then uses r3 where the ROM
 * uses r2. Three placements, three near-misses: `.unk00` (here) is 1 byte off,
 * `.unk04` is 2, `(*pp)->unk04` is 4.
 *
 * Ruled out, all still base=r3 (each one probed; none is worth re-running):
 *   - every statement order for `i = 0`, `pp = &g`, `p = *pp` and `v = 0`,
 *     including `p = *(pp = &g)` and initialiser vs assignment;
 *   - `for` / `while` / `do-while`, and `p[i]` vs `(*pp)[i]` vs `p++`;
 *   - a dead trailing statement to extend the zero's live range -- `i = v`,
 *     `p = (void *)v`, and a redundant store overwritten on the next line are
 *     all deleted before liveness is computed, unlike the m4a `ident` case in
 *     docs/agbcc-codegen.md;
 *   - `register`, `u16`/`u32`/pointer types for the zero, a `u32 *` base with
 *     `p[i * 3]`, an unused parameter, and a pointer local for the
 *     gUnknown_030020A8 tail;
 *   - decomp-permuter, 106,936 iterations over 600s: nothing scored better
 *     than this starting point.
 *
 * Also settled while getting here, so nobody re-derives it:
 *   - The function is declared non-void and has NO return statement. r0 is
 *     never written and the epilogue is `pop {r1}` -- the sub_08017704 tell.
 *     Its three callers all discard the result.
 *   - `pp` is not decoration. Naming gUnknown_0808E5C8 both inside the loop and
 *     after it triggers the -fforce-addr `.rodata` indirection; binding &g to a
 *     local and reaching the global through `*pp` afterwards is what removes
 *     it. `const`, a one-member struct wrapper and a `T *g[1]` array wrapper
 *     were all probed and none of them suppress it. See the -fforce-addr
 *     section of docs/agbcc-codegen.md.
 *
 * The axis that is missing is whatever makes agbcc prefer r4 for a pointer that
 * is live across a loop when a hoisted constant is live alongside it. It is not
 * reachable by rearranging this AST.
 *
 * Wave 10 ruled out the build configuration as the cause, which is the axis
 * that unparked the other three functions of this batch. None of these is the
 * answer:
 *   - `old_agbcc` (the binary that matches m4a): allocates the whole body out
 *     of r0-r4 with a `push {r4, lr}` frame -- a different function, not a
 *     near miss.
 *   - `-fno-force-addr`: hoists gUnknown_030020A8's pool `ldr` above the loop
 *     and costs a third callee-saved register, `push {r4, r5, r6, lr}`. So the
 *     ROM's `-fforce-addr` behaviour is confirmed correct for this file, and
 *     `pp` stays load-bearing.
 *   - eleven other agbcc options toggled one at a time on the minimal spelling
 *     (`-fno-cse-follow-jumps`, `-fno-expensive-optimizations`, `-fno-regmove`,
 *     `-fno-strength-reduce`, `-fno-thread-jumps`, `-fcaller-saves`,
 *     `-fno-peephole`, `-fno-gcse`, `-funroll-loops`, `-fno-function-cse`,
 *     `-funroll-loops`): every one leaves the pair exactly as it is.
 *     `-fno-rerun-cse-after-loop` changes it, into something much worse.
 *
 * Also established, and it sharpens the statement of the problem. Write the
 * function with NO zero local at all --
 *
 *     i = 0; pp = &gUnknown_0808E5C8; p = *pp;
 *     for (; i <= 0x80; i++) p[i].unk00 = 0;
 *     gUnknown_030020A8.unk04 = NULL; gUnknown_030020A8.unk00 = 0;
 *     (*pp)->unk04 = NULL;
 *
 * -- and every instruction, the `push {r4, r5, lr}`, the instruction order and
 * both pool words are the ROM's, including the tail's own `movs r2, #0` shared
 * by all three tail stores. Only r3 and r4 are swapped against each other. So
 * the single question is which of the two loop-carried values gets r3.
 *
 * The one thing found that flips it is the hoisted zero being live PAST the
 * loop, and only that: neither the number of references before the loop nor
 * their order does anything. Probed under agbcc, all still base=r3:
 * `u32 v` declared before the pointers (pseudo/declaration order is not the
 * tie-break), `v = 0` as the first statement, `i = v`, `for (i = v; ...)`, a
 * duplicated store in the loop body, and `v = 0` before vs after `p = *pp`
 * (that last one moves where the `mov` is emitted, per the source-statement
 * order rule, and leaves the registers alone).
 *
 * That is why this is stuck. The flip needs a use of the zero after the loop;
 * the only three statements after the loop are the three tail stores; and the
 * ROM gives all three r2. Whichever one takes `v` shows up as r3 -- `.unk00`
 * (this draft) 1 byte, `.unk04` 2, `(*pp)->unk04` 4. A post-loop use that
 * emits no instruction would do it, and none exists: dead stores and dead
 * assignments are deleted before liveness, `volatile` forces a stack slot, and
 * `return v` costs a `mov`.
 *
 * Wave 10 tried the one lever this file did not know about, and it does not
 * work here. `do { ... } while (0)` around a loop body raises the loop depth of
 * everything inside it and so flips exactly this r3/r4 tie-break for free, with
 * no post-loop reference -- see the Register-allocation section of
 * docs/agbcc-codegen.md and sub_0806DDF4, which it took from 94.1% to a match.
 * It cannot reach this function because the flip needs the two competing values
 * to sit on OPPOSITE sides of the inner loop, and here one store uses both.
 * Three placements, none better than this draft:
 *   - `do { p[i].unk00 = 0; } while (0);`   both values inside: unchanged, 2
 *     bytes (r3/r4 still swapped, plus the freed `v`).
 *   - `q = &p[i].unk00;` outside, `do { *q = 0; } while (0);` inside: 96.9%.
 *   - `e = &p[i];` outside, `do { e->unk00 = 0; } while (0);` inside: 96.9%.
 * Splitting the address out is what costs the two bytes; the tie-break itself
 * does move. So the axis is right and the room to apply it is what is missing.
 *
 */
bool8 sub_0801A6C0(void)
{
    struct Unk0808E5C8 **pp;
    struct Unk0808E5C8 *p;
    s16 i;
    u32 v;

    i = 0;
    pp = &gUnknown_0808E5C8;
    p = *pp;
    v = 0;

    for (; i <= 0x80; i++)
        p[i].unk00 = v;

    asm("" : : "r"(v));
    gUnknown_030020A8.unk04 = NULL;
    gUnknown_030020A8.unk00 = 0;
    (*pp)->unk04 = NULL;
}
