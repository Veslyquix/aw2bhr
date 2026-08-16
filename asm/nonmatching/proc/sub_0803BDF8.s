	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BDF8
sub_0803BDF8: @ 0x0803BDF8
	push {lr}
	bl sub_0801A168
	ldr r0, _0803BE0C @ =gUnknown_0849ECDC
	ldr r1, [r0]
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803BE0C: .4byte gUnknown_0849ECDC

