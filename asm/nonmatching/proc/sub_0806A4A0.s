	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A4A0
sub_0806A4A0: @ 0x0806A4A0
	push {lr}
	ldr r0, _0806A4AC @ =gUnknown_08581108
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0806A4AC: .4byte gUnknown_08581108

