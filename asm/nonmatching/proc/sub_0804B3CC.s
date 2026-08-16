	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B3CC
sub_0804B3CC: @ 0x0804B3CC
	push {lr}
	movs r0, #0
	bl sub_0804B3E0
	movs r0, #1
	bl sub_0804B3E0
	pop {r0}
	bx r0
	.align 2, 0

