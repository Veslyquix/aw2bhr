	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CE94
sub_0802CE94: @ 0x0802CE94
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802CEAC @ =gUnknown_030044A0
	str r1, [r0]
	bl sub_0801A168
	bl sub_0802C1B0
	pop {r0}
	bx r0
	.align 2, 0
_0802CEAC: .4byte gUnknown_030044A0

