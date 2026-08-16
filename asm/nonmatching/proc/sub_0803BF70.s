	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BF70
sub_0803BF70: @ 0x0803BF70
	ldr r0, _0803BF84 @ =gUnknown_0849ECDC
	ldr r1, [r0]
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803BF82
	ldr r1, _0803BF88 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_0803BF82:
	bx lr
	.align 2, 0
_0803BF84: .4byte gUnknown_0849ECDC
_0803BF88: .4byte gUnknown_03002F1C

