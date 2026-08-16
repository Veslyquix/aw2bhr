	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BD6C
sub_0806BD6C: @ 0x0806BD6C
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r0, #0x40
	adds r1, #1
	strh r1, [r0]
	bl sub_08013AEC
	pop {r0}
	bx r0
	.align 2, 0

