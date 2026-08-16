	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078454
sub_08078454: @ 0x08078454
	push {lr}
	adds r1, r0, #0
	ldr r0, _08078464 @ =gUnknown_08615988
	bl sub_08074AAC
	pop {r0}
	bx r0
	.align 2, 0
_08078464: .4byte gUnknown_08615988

