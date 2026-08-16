	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B774
sub_0803B774: @ 0x0803B774
	push {lr}
	ldr r0, _0803B784 @ =gUnknown_0849E7A0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B784: .4byte gUnknown_0849E7A0

