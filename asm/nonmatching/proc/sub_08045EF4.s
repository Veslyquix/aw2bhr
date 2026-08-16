	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045EF4
sub_08045EF4: @ 0x08045EF4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0x3c
	movs r3, #0
	bl sub_080130DC
	pop {r0}
	bx r0
	.align 2, 0

