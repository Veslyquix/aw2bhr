	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067FB4
sub_08067FB4: @ 0x08067FB4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, [r4, #0x40]
	ldr r0, [r4, #0x34]
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	ldr r3, _08068004 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08068008 @ =gUnknown_03002020
	strh r0, [r1]
	ldr r2, _0806800C @ =gUnknown_03002B28
	movs r1, #0x10
	subs r1, r1, r0
	strh r1, [r2]
	ldr r1, _08068010 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x34]
	cmp r0, r1
	bne _08067FFC
	adds r0, r4, #0
	bl Proc_Break
_08067FFC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068004: .4byte gUnknown_030030E0
_08068008: .4byte gUnknown_03002020
_0806800C: .4byte gUnknown_03002B28
_08068010: .4byte gUnknown_03001FFC

