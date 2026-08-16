	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F2D8
sub_0803F2D8: @ 0x0803F2D8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #0x30]
	adds r1, #2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0802909C
	pop {r0}
	bx r0

