	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074744
sub_08074744: @ 0x08074744
	push {lr}
	ldr r0, _08074750 @ =gUnknown_086142B4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08074750: .4byte gUnknown_086142B4

