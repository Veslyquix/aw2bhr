	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065F68
sub_08065F68: @ 0x08065F68
	push {lr}
	ldr r1, _08065F74 @ =gUnknown_08580C00
	bl sub_08063A30
	pop {r0}
	bx r0
	.align 2, 0
_08065F74: .4byte gUnknown_08580C00

