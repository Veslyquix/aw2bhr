	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805DB50
sub_0805DB50: @ 0x0805DB50
	push {lr}
	bl sub_0805E5AC
	bl sub_0805E718
	bl sub_0805F4CC
	pop {r0}
	bx r0
	.align 2, 0

