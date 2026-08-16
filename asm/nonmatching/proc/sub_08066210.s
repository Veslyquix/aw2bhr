	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066210
sub_08066210: @ 0x08066210
	push {lr}
	ldr r1, _0806621C @ =gUnknown_08580A68
	bl sub_08063A30
	pop {r0}
	bx r0
	.align 2, 0
_0806621C: .4byte gUnknown_08580A68

