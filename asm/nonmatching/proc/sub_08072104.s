	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072104
sub_08072104: @ 0x08072104
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

