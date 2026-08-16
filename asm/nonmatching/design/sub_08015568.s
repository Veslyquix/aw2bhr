	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015568
sub_08015568: @ 0x08015568
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_0801D84C
	pop {r0}
	bx r0
	.align 2, 0

