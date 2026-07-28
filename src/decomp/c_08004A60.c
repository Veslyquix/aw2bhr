#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A60.
 * sub_08004A60 @ 0x08004A60, sub_08004A6C @ 0x08004A6C, sub_08004A78 @ 0x08004A78, sub_08004A84 @ 0x08004A84, sub_08004A90 @ 0x08004A90, sub_08004AA0 @ 0x08004AA0, sub_08004ABC @ 0x08004ABC, sub_08004AD8 @ 0x08004AD8, sub_08004AF4 @ 0x08004AF4, sub_08004B10 @ 0x08004B10, sub_08004B2C @ 0x08004B2C, sub_08004B3C @ 0x08004B3C, sub_08004B4C @ 0x08004B4C, sub_08004B5C @ 0x08004B5C, sub_08004B6C @ 0x08004B6C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A60.
 * sub_08004A60 @ 0x08004A60
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A6C.
 * sub_08004A6C @ 0x08004A6C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A78.
 * sub_08004A78 @ 0x08004A78
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A84.
 * sub_08004A84 @ 0x08004A84
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004A90.
 * sub_08004A90 @ 0x08004A90
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004AA0.
 * sub_08004AA0 @ 0x08004AA0
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004ABC.
 * sub_08004ABC @ 0x08004ABC
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004AD8.
 * sub_08004AD8 @ 0x08004AD8
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004AF4.
 * sub_08004AF4 @ 0x08004AF4
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B10.
 * sub_08004B10 @ 0x08004B10
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B2C.
 * sub_08004B2C @ 0x08004B2C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B3C.
 * sub_08004B3C @ 0x08004B3C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B4C.
 * sub_08004B4C @ 0x08004B4C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B5C.
 * sub_08004B5C @ 0x08004B5C
 */

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x08004B6C.
 * sub_08004B6C @ 0x08004B6C
 */


/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A60(void)
{
    sub_08004A30(7);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A6C(void)
{
    sub_08004A30(1);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A78(void)
{
    sub_08004A30(3);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A84(void)
{
    sub_08004A30(4);
}

/* One of five 12-16 byte forwarders (08004A60/6C/78/84/90) that pass a constant
 * to sub_08004A30. `pop {r0}; bx r0` fixes them as void, and the argument is
 * `int` rather than a narrow type: sub_08004A90 passes -1, and sub_08004A30's
 * own prologue saves r0 with a bare `adds r4, r0, #0` across three calls, which
 * PROMOTE_MODE would have narrowed for any sub-word parameter.
 * The five are the payloads of the five 0x48-byte ROM records the wrappers at
 * 08004AA0-08004B10 start: gUnknown_084873BC + 0x48*n holds &sub_08004A60 +
 * 0x0C*n at +0x10, with the THUMB bit set. See unknown-globals.h.
 */

void sub_08004A90(void)
{
    sub_08004A30(-1);
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AA0(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084873BC, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004ABC(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487404, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AD8(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_0848744C, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004AF4(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_08487494, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004AA0/ABC/AD8/AF4/B10) over one 0x48-stride
 * ROM table; only the table entry changes. Same three-statement shape as the
 * already-promoted sub_08042B70 / sub_08046764 / sub_080485AC, plus the
 * sub_0801A168 call in front and the sub_08000654 call behind. Nothing narrows
 * or forwards sub_080152EC's result, so the discard is free, and `pop {r0}`
 * makes this void.
 */

void sub_08004B10(void)
{
    sub_0801A168();
    sub_080152EC(gUnknown_084874DC, 0);
    sub_08000654();
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B2C(void)
{
    sub_080193B0(gUnknown_08487754);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B3C(void)
{
    sub_080193B0(gUnknown_084877F4);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B4C(void)
{
    sub_080193B0(gUnknown_08487894);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B5C(void)
{
    sub_080193B0(gUnknown_08487934);
}

/* One of five identical wrappers (08004B2C/B3C/B4C/B5C/B6C) over one 0xA0-stride
 * ROM table; only the table entry changes. sub_080193B0 takes the script as
 * `const u8 *` and returns a gUnknown_0200C528 slot, which every one of these
 * discards -- `pop {r0}; bx r0`, so void.
 */

void sub_08004B6C(void)
{
    sub_080193B0(gUnknown_084879D4);
}
