	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034FEC
sub_08034FEC: @ 0x08034FEC
	push {lr}
	bl sub_08023354
	bl sub_0803662C
	bl sub_08024268
	pop {r0}
	bx r0
	.align 2, 0

