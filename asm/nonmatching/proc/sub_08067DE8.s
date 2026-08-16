	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067DE8
sub_08067DE8: @ 0x08067DE8
	push {lr}
	ldr r0, _08067DF4 @ =gUnknown_085810E4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08067DF4: .4byte gUnknown_085810E4

