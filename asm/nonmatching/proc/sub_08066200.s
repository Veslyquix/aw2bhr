	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066200
sub_08066200: @ 0x08066200
	push {lr}
	ldr r1, _0806620C @ =gUnknown_08580B18
	bl sub_08063A30
	pop {r0}
	bx r0
	.align 2, 0
_0806620C: .4byte gUnknown_08580B18

