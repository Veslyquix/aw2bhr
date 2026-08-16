	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CE9C
sub_0803CE9C: @ 0x0803CE9C
	push {lr}
	movs r0, #0
	movs r1, #0
	bl sub_0803CE28
	pop {r0}
	bx r0
	.align 2, 0

