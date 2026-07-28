#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807F8C0.
 * sub_0807F8C0 @ 0x0807F8C0
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0807F8C0.
 * sub_0807F8C0 @ 0x0807F8C0
 */

#include "proc.h"

/* One of family F000's 16-byte forwarders: `push {lr}; ldr r0,=script;
 * bl Proc_EndEach; pop {r0}; bx r0`. `pop {r0}` fixes it as void, so the call
 * is a bare statement and nothing is forwarded. The script is ROM data reached
 * only as an address; see the evidence for gUnknown_08616638 in
 * include/unknown-globals.h.
 */

void sub_0807F8C0(void)
{
    Proc_EndEach(gUnknown_08616638);
}
