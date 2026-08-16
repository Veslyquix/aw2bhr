	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D43C
sub_0802D43C: @ 0x0802D43C
	push {lr}
	ldr r0, _0802D448 @ =0x00000C9D
	bl sub_0802D35C
	pop {r0}
	bx r0
	.align 2, 0
_0802D448: .4byte 0x00000C9D

