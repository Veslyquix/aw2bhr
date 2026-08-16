	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045FA4
sub_08045FA4: @ 0x08045FA4
	push {lr}
	movs r0, #2
	movs r1, #0x8c
	movs r2, #0
	bl sub_08013338
	movs r0, #0x23
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0

