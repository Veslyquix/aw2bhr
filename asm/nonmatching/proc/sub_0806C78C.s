	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C78C
sub_0806C78C: @ 0x0806C78C
	push {lr}
	bl Proc_Init
	movs r0, #1
	bl sub_0806CC00
	pop {r0}
	bx r0

