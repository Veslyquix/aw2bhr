	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028154
sub_08028154: @ 0x08028154
	push {lr}
	bl sub_08013C00
	bl sub_08013AEC
	bl sub_08024584
	pop {r0}
	bx r0
	.align 2, 0

