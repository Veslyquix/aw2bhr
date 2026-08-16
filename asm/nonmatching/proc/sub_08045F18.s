	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F18
sub_08045F18: @ 0x08045F18
	push {lr}
	movs r0, #0xc0
	bl sub_0803B35C
	pop {r0}
	bx r0

