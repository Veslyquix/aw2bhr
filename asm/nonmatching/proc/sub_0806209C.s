	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806209C
sub_0806209C: @ 0x0806209C
	push {lr}
	bl sub_080620C0
	movs r0, #0
	movs r1, #1
	bl sub_080620FC
	movs r0, #1
	movs r1, #6
	bl sub_080620FC
	movs r0, #2
	movs r1, #5
	bl sub_080620FC
	pop {r0}
	bx r0
	.align 2, 0

