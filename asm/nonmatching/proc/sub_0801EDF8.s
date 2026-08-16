	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EDF8
sub_0801EDF8: @ 0x0801EDF8
	push {lr}
	sub sp, #8
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp]
	bl sub_0801ED80
	add sp, #8
	pop {r1}
	bx r1

