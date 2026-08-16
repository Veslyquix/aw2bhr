	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C7DC
sub_0802C7DC: @ 0x0802C7DC
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802C7F4 @ =gUnknown_030044A0
	str r1, [r0]
	bl sub_0801A168
	ldr r1, _0802C7F8 @ =gUnknown_03003334
	movs r0, #2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C7F4: .4byte gUnknown_030044A0
_0802C7F8: .4byte gUnknown_03003334

