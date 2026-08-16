	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080720DC
sub_080720DC: @ 0x080720DC
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

