	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B9D4
sub_0803B9D4: @ 0x0803B9D4
	push {lr}
	bl sub_08044BB0
	ldr r0, _0803B9E8 @ =gUnknown_0849EA94
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B9E8: .4byte gUnknown_0849EA94

