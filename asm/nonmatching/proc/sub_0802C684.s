	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C684
sub_0802C684: @ 0x0802C684
	push {lr}
	bl sub_0802C62C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C694
	movs r0, #1
	b _0802C696
_0802C694:
	movs r0, #0
_0802C696:
	pop {r1}
	bx r1
	.align 2, 0

