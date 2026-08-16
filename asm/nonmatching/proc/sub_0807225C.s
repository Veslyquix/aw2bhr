	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807225C
sub_0807225C: @ 0x0807225C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

