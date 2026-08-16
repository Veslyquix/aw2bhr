	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C0E8
sub_0804C0E8: @ 0x0804C0E8
	push {lr}
	movs r0, #0
	bl sub_0804FF44
	movs r0, #1
	bl sub_0804FF44
	pop {r0}
	bx r0
	.align 2, 0

