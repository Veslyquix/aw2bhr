	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B788
sub_0803B788: @ 0x0803B788
	push {lr}
	ldr r0, _0803B798 @ =gUnknown_0849E7B8
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B798: .4byte gUnknown_0849E7B8

