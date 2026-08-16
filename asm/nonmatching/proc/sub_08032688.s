	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032688
sub_08032688: @ 0x08032688
	push {lr}
	movs r1, #8
	movs r2, #0
	bl sub_080324C4
	pop {r0}
	bx r0
	.align 2, 0

