	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BE10
sub_0803BE10: @ 0x0803BE10
	push {lr}
	bl sub_0801A168
	ldr r0, _0803BE24 @ =gUnknown_0849ECDC
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803BE24: .4byte gUnknown_0849ECDC

