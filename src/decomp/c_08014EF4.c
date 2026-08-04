#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08014EF4.
 * sub_08014EF4 @ 0x08014EF4, sub_08014FB0 @ 0x08014FB0
 */

/* realloc for the gUnknown_03000050 arena, alongside sub_08014E44 (alloc),
 * sub_08014ED4 (free) and sub_08014DCC / sub_08014E68 one level down. The
 * block header layout and the `((struct MemBlock *)ptr)[-1].member` idiom are
 * the ones src/decomp/c_08014E68.c already established.
 *
 * gUnknown_0300004C IS REACHED THROUGH agbcc's -fforce-addr ADDRESS-CONSTANT
 * POOL, not through a global called gUnknown_0808E52C. The splitter invented
 * that name for the pool word at 0x0808E52C; the ROM word THERE holds
 * 0x0300004C, and its neighbours at +/-4 hold 0x030030E0 and 0x03000050, i.e.
 * it sits in a run of address constants. Naming the global directly is the
 * honest spelling and is what produces the ROM's `ldr r1, <pool>; ldr r7, [r1]`
 * plus the `mov ip, r1` / `mov r0, ip` shuffle. PROMOTION MUST CARRY THE POOL
 * WORD: add "rodata": ["0x0808E52C"] to this function's data/promoted.json
 * entry, then re-run tools/split_rodata.py and tools/gen_lds.py.
 *
 * THE `do { } while (0)` IS LOAD-BEARING and is the last thing that closed the
 * function (found by decomp-permuter, confirmed by try_match). Without it the
 * output is size-exact at 188/188 and 92.0% identical, with EVERY differing
 * byte being the same swap: `blk` takes r3 and `avail` takes r4, where the ROM
 * has blk in r4 and avail in r3. Same instructions, same order, two pseudos in
 * each other's slots -- the case docs/agbcc-codegen.md gives the permuter.
 * Declaration order does NOT move it (probed both orders, byte-identical).
 *
 * The separate `t` is load-bearing for a different reason and is NOT part of
 * that: writing the merge as `avail += 0x10; avail += next->size;` updates
 * avail in place (`add r3, r3, #0x10`, one instruction) where the ROM computes
 * into a fresh register (`adds r1, r3, #0; adds r1, #0x10`, two). The fresh
 * register is what clobbers the pool address in r1 and forces the ROM's
 * `mov ip, r1` / `mov r0, ip` pair, so all three instructions stand or fall
 * together.
 *
 * The split arm reaches the new block as `q[1]` off `q = ptr + size` rather
 * than through its own pointer: that is what puts the member offsets in the
 * load displacements (`str r2, [r1, #0x10]`) while `q + 1` is CSE'd into the
 * one register the two pointer stores share. Note the new header lands at
 * ptr + size + 0x10, one header FURTHER on than sub_08014DCC places its split
 * block (best + size + 0x10, i.e. ptr + size); that asymmetry is in the ROM,
 * not in this transcription. */
struct MemBlock
{
    /* 0x00 */ struct MemBlock *next;
    /* 0x04 */ u32 size;
    /* 0x08 */ u32 used;
    /* 0x0c */ u32 filler_0c;
};
/* 0x0300004C has no symbol in upstream's aw2bhr.lds (the IWRAM table jumps
 * 0x48 -> 0x50), and gen_lds.py passes that table through verbatim, so an
 * `extern gUnknown_0300004C` can never link in the split build. Spell it as
 * an offset into the covering symbol instead: the reloc becomes
 * gUnknown_03000048+4, which resolves to the same address and the same pool
 * word. Wave 42, replacing the unlinkable extern proto_check.py flagged. */
#define gUnknown_0300004C (*(void **)((u8 *)&gUnknown_03000048 + 4))

void *sub_08014EF4(void *ptr, u32 size)
{
    struct MemBlock *blk;
    struct MemBlock *next;
    struct MemBlock *q;
    void *newptr;
    u32 avail;

    if (ptr == NULL)
        return sub_08014E44(size);

    if (size == 0)
    {
        sub_08014ED4(ptr);
        return NULL;
    }

    size = (size + 0xf) & ~0xf;
    blk = &((struct MemBlock *)ptr)[-1];
    gUnknown_0300004C = blk;

    if (((struct MemBlock *)ptr)[-1].used == 0)
        return NULL;

    next = blk->next;
    avail = ((struct MemBlock *)ptr)[-1].size;
    gUnknown_0300004C = next;

    if (next != NULL && next->used == 0)
    {
        u32 t;

        t = avail + 0x10;
        do { avail = t + next->size; } while (0);
        next = next->next;
    }

    gUnknown_0300004C = blk;

    if (size > avail)
    {
        newptr = sub_08014E44(size);
        if (newptr == NULL)
            return NULL;
        sub_0808B6E8(newptr, ptr, size);
        sub_08014ED4(ptr);
        return newptr;
    }

    if (size + 0x20 < avail)
    {
        q = (struct MemBlock *)((u8 *)ptr + size);
        blk->next = q + 1;
        blk->size = size;
        gUnknown_0300004C = q + 1;
        q[1].next = next;
        q[1].size = avail - size - 0x10;
        q[1].used = 0;
    }
    else
    {
        blk->next = next;
        blk->size = avail;
    }

    return ptr;
}

/* calloc for the gUnknown_03000050 arena: n * size bytes from sub_08014E44,
 * then zeroed a byte at a time.
 *
 * `i` MUST be a local distinct from `total`. Decrementing `total` in place
 * (`while (total-- != 0)`) makes the loop counter the same pseudo as the
 * malloc argument, which is already parked in a callee-saved register because
 * it is live across the `bl` -- the counter then stays in r4, the returned
 * pointer stays in r0, and the ROM's `adds r2, r0, #0` / `adds r0, r2, #0`
 * pair disappears (-4 bytes, measured). With a separate `i`, `total` dies at
 * `subs r0, r4, #1` and r4 is free to hold the zero byte, which is what the
 * ROM does.
 *
 * `while (i-- != 0)` and not a `for`: the post-decrement is what makes the
 * exit test `!= -1` rather than `!= 0`, and that -1 is CSE'd with the one the
 * gUnknown_03000050 guard already materialised in r5 (hence r5 surviving the
 * call). */
void *sub_08014FB0(int n, int size)
{
    u8 *q;
    void *p;
    int total;
    int i;

    if (gUnknown_03000050 == -1)
        return NULL;

    total = n * size;
    p = sub_08014E44(total);
    if (p == NULL)
        return NULL;

    q = p;
    i = total;
    while (i-- != 0)
        *q++ = 0;

    return p;
}
