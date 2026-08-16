	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053F90
sub_08053F90: @ 0x08053F90
	push {lr}
	movs r0, #0
	bl sub_08054278
	movs r0, #1
	bl sub_08054278
	movs r0, #0
	bl sub_08054488
	movs r0, #1
	bl sub_08054488
	movs r0, #0
	bl sub_08053660
	movs r0, #1
	bl sub_08053660
	pop {r0}
	bx r0
	.align 2, 0

