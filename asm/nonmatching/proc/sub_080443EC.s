	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080443EC
sub_080443EC: @ 0x080443EC
	push {lr}
	movs r0, #0x23
	bl sub_0803B4DC
	movs r0, #1
	bl sub_08035144
	bl sub_08039F58
	pop {r0}
	bx r0
	.align 2, 0

