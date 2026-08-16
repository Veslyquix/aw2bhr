	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080444EC
sub_080444EC: @ 0x080444EC
	push {lr}
	movs r1, #2
	movs r2, #0
	bl sub_08029AF8
	pop {r0}
	bx r0
	.align 2, 0

