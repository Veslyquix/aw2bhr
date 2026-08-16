	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045B18
sub_08045B18: @ 0x08045B18
	push {lr}
	movs r0, #1
	bl sub_08044374
	cmp r0, #1
	beq _08045B28
	movs r0, #0
	b _08045B2A
_08045B28:
	movs r0, #1
_08045B2A:
	pop {r1}
	bx r1
	.align 2, 0

