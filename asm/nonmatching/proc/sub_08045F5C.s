	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045F5C
sub_08045F5C: @ 0x08045F5C
	push {lr}
	movs r0, #0x60
	bl sub_0803CBD8
	cmp r0, #0
	beq _08045F72
	movs r0, #0x22
	movs r1, #1
	bl sub_0803CBA0
	b _08045F7A
_08045F72:
	movs r0, #0x21
	movs r1, #1
	bl sub_0803CBA0
_08045F7A:
	pop {r0}
	bx r0
	.align 2, 0

