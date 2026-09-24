# Notes for `src/design-panels.c`

Source: [`src/design-panels.c`](../../src/design-panels.c). These comments were moved verbatim from the C file; line numbers refer to the version before extraction.

## Note 1 — original line 5

````c
/* Design-room code at 0x080030BC..0x080032EB; grouped at a literal-pool boundary. */
````

## Note 2 — original line 7

````c
/* MATCHED first attempt, wave 36 (W36-I). PROMOTION NEEDS THE POOL WORD PLACED:
 *     "rodata": ["0x0808D75C"]
 * 0x0808D75C holds &gActiveMap (checked in baserom.gba). The neighbour
 * 0x0808D754 immediately in front of it is NOT such a word -- it is the real
 * eight-byte table `01 03 05 07 03 01 07 05` this function memcpys to the
 * stack, which is why it is passed to sub_0808B6E8 without a deref.
 *
 * unk72/unk7a/unk82 are four-entry ARRAYS indexed by the lane parameter (see
 * include/unknown-globals.h); sub_08003088 calls this with lanes 0..3. The two
 * switches are one state machine run twice per frame:
 *   0 -> 0xA -> 0x14 -> 0x1E -> 0x32 -> 0x3C -> 0x46 -> 0x50 -> 0x32
 * with unk82 eased toward a target by `v += (K - v) >> 3` and unk7a counting
 * frames down. a2 and a3 are declared by the header and never read.
 *
 * 0xFD80 is written as an unsigned literal because the ROM's pool word is
 * `.4byte 0x0000FD80`, while the -640 and -928 in the case 0x50 arm are full
 * negative ints (`0xFFFFFD80`, `0xFFFFFC60`) -- the same constant appearing
 * both ways is the tell for which spelling the source used where. */
````
