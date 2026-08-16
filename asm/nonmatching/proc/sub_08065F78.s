	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065F78
sub_08065F78: @ 0x08065F78
	push {lr}
	ldr r1, _08065F84 @ =gUnknown_08580C20
	bl sub_08063A30
	pop {r0}
	bx r0
	.align 2, 0
_08065F84: .4byte gUnknown_08580C20

