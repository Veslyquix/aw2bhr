	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B828
sub_0803B828: @ 0x0803B828
	push {lr}
	ldr r0, _0803B838 @ =gUnknown_0849E818
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B838: .4byte gUnknown_0849E818

