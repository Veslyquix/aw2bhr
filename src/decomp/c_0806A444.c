#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A444.
 * sub_0806A444 @ 0x0806A444
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0806A444.
 * sub_0806A444 @ 0x0806A444
 */

#include "proc.h"

/* Breaks every proc running gUnknown_08580F24. sub_08067504 is Proc_BreakEach
 * open-coded over sProcArray rather than the proc tree; `pop {r0}; bx r0` makes
 * this void, so the call is a bare statement.
 */

void sub_0806A444(void)
{
    sub_08067504(gUnknown_08580F24);
}
