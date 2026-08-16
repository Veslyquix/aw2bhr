	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072270
sub_08072270: @ 0x08072270
	push {lr}
	adds r2, r0, #0
	ldr r3, _08072284 @ =sub_08072454
	movs r0, #7
	movs r1, #8
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_08072284: .4byte sub_08072454

