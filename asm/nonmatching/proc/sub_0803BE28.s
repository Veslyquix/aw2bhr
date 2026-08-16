	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BE28
sub_0803BE28: @ 0x0803BE28
	push {lr}
	bl sub_0801A168
	ldr r0, _0803BE3C @ =gUnknown_0849ECDC
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803BE3C: .4byte gUnknown_0849ECDC

