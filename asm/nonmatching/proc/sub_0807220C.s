	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807220C
sub_0807220C: @ 0x0807220C
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

