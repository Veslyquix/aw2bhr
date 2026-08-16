	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080721F8
sub_080721F8: @ 0x080721F8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x40
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

