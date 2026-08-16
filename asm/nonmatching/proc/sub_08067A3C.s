	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067A3C
sub_08067A3C: @ 0x08067A3C
	push {lr}
	ldr r0, _08067A48 @ =gUnknown_08581014
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08067A48: .4byte gUnknown_08581014

