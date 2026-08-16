	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071FC4
sub_08071FC4: @ 0x08071FC4
	push {lr}
	movs r0, #0x40
	bl sub_0801156C
	pop {r0}
	bx r0

