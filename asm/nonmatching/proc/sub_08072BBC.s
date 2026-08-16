	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072BBC
sub_08072BBC: @ 0x08072BBC
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0

