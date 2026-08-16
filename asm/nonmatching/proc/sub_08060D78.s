	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060D78
sub_08060D78: @ 0x08060D78
	adds r1, r0, #0
	ldr r0, _08060D88 @ =gUnknown_03004080
	ldrh r2, [r0]
	cmp r2, #3
	bhi _08060D8C
	movs r0, #0
	b _08060DA4
	.align 2, 0
_08060D88: .4byte gUnknown_03004080
_08060D8C:
	ldr r0, _08060DA8 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r0, [r0, #3]
	muls r0, r2, r0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08060DA6
	movs r0, #0x50
_08060DA4:
	strh r0, [r1]
_08060DA6:
	bx lr
	.align 2, 0
_08060DA8: .4byte gUnknown_085766E0

