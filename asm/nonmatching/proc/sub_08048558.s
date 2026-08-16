	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048558
sub_08048558: @ 0x08048558
	push {lr}
	bl sub_08024268
	bl sub_08013C00
	bl sub_08013AEC
	pop {r0}
	bx r0
	.align 2, 0

