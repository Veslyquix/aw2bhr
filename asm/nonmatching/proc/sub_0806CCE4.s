	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CCE4
sub_0806CCE4: @ 0x0806CCE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	subs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0806CD26
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0806CD56
	ldr r1, _0806CD6C @ =gUnknown_030020C0
	ldr r0, [r4, #0x3c]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl sub_080135A4
	ldr r0, [r4, #0x3c]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r4, #0x3c]
_0806CD26:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0806CD56
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r2, r0, #1
	movs r0, #0x3f
	ands r2, r0
	cmp r2, #0x1f
	ble _0806CD44
	movs r0, #0x40
	subs r2, r0, r2
_0806CD44:
	cmp r2, #0x10
	ble _0806CD4A
	movs r2, #0x10
_0806CD4A:
	ldr r0, _0806CD70 @ =gUnknown_03002020
	strh r2, [r0]
	ldr r1, _0806CD74 @ =gUnknown_03002B28
	movs r0, #0x10
	subs r0, r0, r2
	strh r0, [r1]
_0806CD56:
	ldr r3, _0806CD78 @ =gUnknown_08581DEC
	movs r0, #0
	str r0, [sp]
	movs r1, #0x38
	movs r2, #0x64
	bl sub_0801BEBC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD6C: .4byte gUnknown_030020C0
_0806CD70: .4byte gUnknown_03002020
_0806CD74: .4byte gUnknown_03002B28
_0806CD78: .4byte gUnknown_08581DEC

