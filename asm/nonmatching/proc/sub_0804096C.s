	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804096C
sub_0804096C: @ 0x0804096C
	push {lr}
	bl sub_0802C57C
	bl sub_080424FC
	bl sub_0802C594
	bl sub_08034F48
	pop {r0}
	bx r0
	.align 2, 0

