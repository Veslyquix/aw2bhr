	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D840
sub_0806D840: @ 0x0806D840
	push {lr}
	ldr r0, _0806D84C @ =gUnknown_08581F40
	bl sub_0806377C
	pop {r0}
	bx r0
	.align 2, 0
_0806D84C: .4byte gUnknown_08581F40

