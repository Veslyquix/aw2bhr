	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080721E4
sub_080721E4: @ 0x080721E4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

