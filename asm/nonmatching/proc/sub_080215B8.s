	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080215B8
sub_080215B8: @ 0x080215B8
	push {lr}
	bl sub_080219AC
	bl sub_08026D68
	bl sub_08061F34
	bl sub_08062038
	pop {r0}
	bx r0
	.align 2, 0

