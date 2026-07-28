#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080012DC.
 * sub_080012DC @ 0x080012DC
 */

/* A pure lookup: 26 live cases out of a 137-entry jump table, and nothing else.
 *
 * The case bodies are laid out in SOURCE order, not in case-value order, so the
 * grouping is readable straight off the ROM and it is not the grouping the
 * jump table suggests: five runs of five keys 32 apart (6/38/70/102/134,
 * 8/40/72/104/136, 10/42/74/106/138, 11/43/75/107/139, 14/46/78/110/142) whose
 * results also step by 5, then a lone case 17. The key is therefore
 * `something * 32 + kind` and the result `base + something * 5`, which is why
 * the values interleave in the table and read consecutively down the function.
 *
 * `int r = 0;` before the switch rather than `return` in each arm: the ROM sets
 * r2 to 0 ahead of the range check and every arm falls into one shared
 * `adds r0, r2, #0; bx lr`. The 0xe1/0xe6-style `movs; lsls #1` pairs are just
 * how agbcc builds an even constant above 255 -- the odd ones next to them get
 * a pool word instead.
 */

int sub_080012DC(int a)
{
    int r;

    r = 0;

    switch (a) {
    case 6:   r = 0x1c2; break;
    case 38:  r = 0x1c7; break;
    case 70:  r = 0x1cc; break;
    case 102: r = 0x1d1; break;
    case 134: r = 0x1d6; break;

    case 8:   r = 0x1c0; break;
    case 40:  r = 0x1c5; break;
    case 72:  r = 0x1ca; break;
    case 104: r = 0x1cf; break;
    case 136: r = 0x1d4; break;

    case 10:  r = 0x1c3; break;
    case 42:  r = 0x1c8; break;
    case 74:  r = 0x1cd; break;
    case 106: r = 0x1d2; break;
    case 138: r = 0x1d7; break;

    case 11:  r = 0x1c4; break;
    case 43:  r = 0x1c9; break;
    case 75:  r = 0x1ce; break;
    case 107: r = 0x1d3; break;
    case 139: r = 0x1d8; break;

    case 14:  r = 0x1c1; break;
    case 46:  r = 0x1c6; break;
    case 78:  r = 0x1cb; break;
    case 110: r = 0x1d0; break;
    case 142: r = 0x1d5; break;

    case 17:  r = 0x180; break;
    }

    return r;
}
