	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041DCC
sub_08041DCC: @ 0x08041DCC
	push {lr}
	bl sub_0803B774
	pop {r0}
	bx r0
	.align 2, 0

