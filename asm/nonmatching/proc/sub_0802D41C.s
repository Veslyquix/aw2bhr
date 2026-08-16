	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D41C
sub_0802D41C: @ 0x0802D41C
	push {lr}
	ldr r0, _0802D428 @ =0x00000C9B
	bl sub_0802D35C
	pop {r0}
	bx r0
	.align 2, 0
_0802D428: .4byte 0x00000C9B

