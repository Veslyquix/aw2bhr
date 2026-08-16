	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078440
sub_08078440: @ 0x08078440
	push {lr}
	adds r1, r0, #0
	ldr r0, _08078450 @ =gUnknown_08615984
	bl sub_08074AAC
	pop {r0}
	bx r0
	.align 2, 0
_08078450: .4byte gUnknown_08615984

