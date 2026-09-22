#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004BD8.
 * sub_08004BD8 @ 0x08004BD8, sub_08004C10 @ 0x08004C10, sub_08004C34 @ 0x08004C34, sub_08004C5C @ 0x08004C5C
 */

/* One `bl` with a selected argument, not two calls in two arms: the
 * unconditional `b` past the second `ldr` is the `?:` tell, and it also
 * explains why the literal pool splits in two here -- gUnknown_08487B64 sits in
 * the block after the `b`, gUnknown_08487AC4 in the one after the call. */
void sub_08004BD8(void)
{
    sub_0801A168();
    sub_0800056C(9);
    sub_080193B0((gActiveMap->flags & 0x1000) ? gUnknown_08487B64
                                                     : gUnknown_08487AC4);
}

void sub_08004C10(void)
{
    sub_080037AC();
    gActiveMap->state = 2;
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x18;
}

void sub_08004C34(void)
{
    sub_0801A614();
    sub_0801A168();
    sub_08024268();
    sub_0801A148(gUnknown_08487C04, 2, 3, 0);
    sub_08004C10();
}

/* The pointer global is RELOADED between the first two stores even though no
 * call separates them (`ldr r1,[r4]` twice) -- a store through the pointer can
 * alias the pointer itself, so agbcc will not cache it. That is the ordinary
 * separate-statement shape and not a lever. */
void sub_08004C5C(void)
{
    gActiveMap->stateChanged = 0;
    gActiveMap->state = 1;
    sub_08003704();
    gActiveMap->menuCursorX = 0x15;
    gActiveMap->menuCursorY = 0x10;
    sub_0801B780(0x70);
    sub_08022AD0(0x10, 0x10);
    sub_08001D9C();
    sub_08003948();
}
