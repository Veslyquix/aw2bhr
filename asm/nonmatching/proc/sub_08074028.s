	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074028
sub_08074028: @ 0x08074028
	push {lr}
	ldr r0, _08074034 @ =gUnknown_08614220
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08074034: .4byte gUnknown_08614220

