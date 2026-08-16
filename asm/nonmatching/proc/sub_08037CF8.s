	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037CF8
sub_08037CF8: @ 0x08037CF8
	push {lr}
	ldrh r0, [r0, #0x1e]
	bl sub_080247A4
	ldr r0, _08037D44 @ =0x06000020
	bl sub_080378A8
	bl sub_08037B90
	ldr r2, _08037D48 @ =gUnknown_03002B34
	ldr r0, _08037D4C @ =gUnknown_03003F68
	ldr r1, [r0]
	ldrb r0, [r1]
	lsls r0, r0, #1
	subs r0, #0xa8
	strh r0, [r2]
	ldr r2, _08037D50 @ =gUnknown_03002F18
	ldrb r0, [r1, #1]
	lsls r0, r0, #1
	subs r0, #0x60
	strh r0, [r2]
	ldr r1, _08037D54 @ =gUnknown_03002B40
	movs r0, #0x5d
	strb r0, [r1]
	ldr r1, _08037D58 @ =gUnknown_03002B4C
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _08037D5C @ =gUnknown_03002EFC
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08037D60 @ =gUnknown_03002B44
	movs r0, #0xa0
	strb r0, [r1]
	bl sub_0802481C
	pop {r0}
	bx r0
	.align 2, 0
_08037D44: .4byte 0x06000020
_08037D48: .4byte gUnknown_03002B34
_08037D4C: .4byte gUnknown_03003F68
_08037D50: .4byte gUnknown_03002F18
_08037D54: .4byte gUnknown_03002B40
_08037D58: .4byte gUnknown_03002B4C
_08037D5C: .4byte gUnknown_03002EFC
_08037D60: .4byte gUnknown_03002B44

