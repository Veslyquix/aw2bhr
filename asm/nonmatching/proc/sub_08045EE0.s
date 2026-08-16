	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045EE0
sub_08045EE0: @ 0x08045EE0
	push {lr}
	movs r0, #0x1e
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080130DC
	pop {r0}
	bx r0
	.align 2, 0

