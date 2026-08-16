	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080444FC
sub_080444FC: @ 0x080444FC
	push {lr}
	movs r1, #5
	movs r2, #0
	bl sub_08029AF8
	pop {r0}
	bx r0
	.align 2, 0

