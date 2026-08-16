	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038690
sub_08038690: @ 0x08038690
	push {lr}
	adds r1, r0, #0
	movs r0, #0x60
	bl sub_0803CBA0
	pop {r0}
	bx r0
	.align 2, 0

