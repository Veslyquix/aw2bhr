	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080722A4
sub_080722A4: @ 0x080722A4
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0

