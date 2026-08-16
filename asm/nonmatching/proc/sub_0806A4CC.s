	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A4CC
sub_0806A4CC: @ 0x0806A4CC
	push {lr}
	ldr r0, _0806A4D8 @ =gUnknown_08581138
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0806A4D8: .4byte gUnknown_08581138

