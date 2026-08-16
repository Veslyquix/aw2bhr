	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067D4C
sub_08067D4C: @ 0x08067D4C
	push {lr}
	ldr r0, _08067D58 @ =gUnknown_085810B8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08067D58: .4byte gUnknown_085810B8

