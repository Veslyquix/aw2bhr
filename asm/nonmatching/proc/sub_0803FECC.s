	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803FECC
sub_0803FECC: @ 0x0803FECC
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl sub_0803FF48
	pop {r0}
	bx r0
	.align 2, 0

