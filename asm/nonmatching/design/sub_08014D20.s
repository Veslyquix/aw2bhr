	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014D20
sub_08014D20: @ 0x08014D20
	push {lr}
	bl sub_08014D38
	adds r1, r0, #0
	adds r0, r1, #6
	cmp r0, #0
	bge _08014D30
	adds r0, #7
_08014D30:
	asrs r0, r0, #3
	pop {r1}
	bx r1
	.align 2, 0

