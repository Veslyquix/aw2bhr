	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E574
sub_0806E574: @ 0x0806E574
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	movs r1, #0x90
	lsls r1, r1, #1
	bl sub_08043BC8
	ldrh r0, [r4, #0x34]
	movs r1, #0x10
	bl sub_08043AA0
	pop {r4}
	pop {r0}
	bx r0

