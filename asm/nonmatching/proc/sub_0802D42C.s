	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D42C
sub_0802D42C: @ 0x0802D42C
	push {lr}
	ldr r0, _0802D438 @ =0x00000C9C
	bl sub_0802D35C
	pop {r0}
	bx r0
	.align 2, 0
_0802D438: .4byte 0x00000C9C

