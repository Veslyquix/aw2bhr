#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0800EBFC.
 * sub_0800EBFC @ 0x0800EBFC
 */

/* Re-tile (x, y) twice: once with the caller's tile id, once with whatever
 * sub_080016D0 answers for the same cell.  THREE parameters -- r2 is never
 * written before the first `bl`, so it is passed straight through to
 * sub_08001158's int third argument, and sub_0800EAF4 sets it to a literal
 * 0x25 and 0x65 at its two call sites.
 *
 * The first call costs no argument setup at all: r0, r1 and r2 already hold
 * the three parameters.  `sub_08001158(x, y, sub_080016D0(x, y))` is the
 * genuine nesting c_08007D70.c documents -- sub_080016D0's result moves to r2
 * and becomes the third argument. */
void sub_0800EBFC(int x, int y, int t)
{
    sub_08001158(x, y, t);
    sub_08001158(x, y, sub_080016D0(x, y));
}
