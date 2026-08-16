	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080720C8
sub_080720C8: @ 0x080720C8
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #8
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

