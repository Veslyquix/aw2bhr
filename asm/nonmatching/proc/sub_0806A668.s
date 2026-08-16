	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A668
sub_0806A668: @ 0x0806A668
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl sub_08013928
	adds r4, #0x44
	movs r0, #8
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

