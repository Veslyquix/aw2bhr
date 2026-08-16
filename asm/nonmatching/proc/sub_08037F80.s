	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037F80
sub_08037F80: @ 0x08037F80
	push {lr}
	ldr r0, _08037F90 @ =gUnknown_0849D56C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08037F90: .4byte gUnknown_0849D56C

