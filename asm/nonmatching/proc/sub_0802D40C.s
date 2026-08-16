	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D40C
sub_0802D40C: @ 0x0802D40C
	push {lr}
	ldr r0, _0802D418 @ =0x00000C9A
	bl sub_0802D35C
	pop {r0}
	bx r0
	.align 2, 0
_0802D418: .4byte 0x00000C9A

