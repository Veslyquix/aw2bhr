	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045830
sub_08045830: @ 0x08045830
	push {lr}
	bl sub_08045650
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045840
	movs r0, #0
	b _08045842
_08045840:
	movs r0, #1
_08045842:
	pop {r1}
	bx r1
	.align 2, 0

