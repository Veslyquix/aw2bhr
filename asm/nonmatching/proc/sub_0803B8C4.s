	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B8C4
sub_0803B8C4: @ 0x0803B8C4
	push {lr}
	ldr r0, _0803B8D8 @ =gUnknown_03003FC0
	movs r1, #3
	strb r1, [r0, #1]
	ldr r0, _0803B8DC @ =gUnknown_0849ECE0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803B8D8: .4byte gUnknown_03003FC0
_0803B8DC: .4byte gUnknown_0849ECE0

