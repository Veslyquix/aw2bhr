	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074598
sub_08074598: @ 0x08074598
	push {lr}
	movs r0, #1
	bl sub_0804423C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

