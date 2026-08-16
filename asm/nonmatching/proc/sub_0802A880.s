	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A880
sub_0802A880: @ 0x0802A880
	adds r2, r1, #0
	cmp r0, #8
	beq _0802A890
	ldr r1, _0802A88C @ =gUnknown_08104464
	subs r0, #1
	b _0802A896
	.align 2, 0
_0802A88C: .4byte gUnknown_08104464
_0802A890:
	ldr r1, _0802A8A4 @ =gUnknown_08104464
	adds r0, r2, #0
	adds r0, #0x1e
_0802A896:
	lsls r0, r0, #3
	ldr r2, _0802A8A8 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #5
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802A8A4: .4byte gUnknown_08104464
_0802A8A8: .4byte 0x000003FF

