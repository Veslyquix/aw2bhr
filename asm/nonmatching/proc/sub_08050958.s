	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050958
sub_08050958: @ 0x08050958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, _08050AA0 @ =gUnknown_03001470
	ldr r0, _08050AA4 @ =gUnknown_03001FBC
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r4, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldr r3, [r0]
	ldrh r0, [r0]
	str r0, [sp, #0x10]
	str r0, [sp, #8]
	adds r2, r4, #0
	adds r2, #0x34
	adds r1, r1, r2
	ldrh r1, [r1]
	str r1, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r6, _08050AA8 @ =gUnknown_0300454C
	strh r3, [r6]
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r6, #2]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	subs r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r0, #0
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	ldr r5, _08050AAC @ =gUnknown_02029710
	movs r1, #0x58
	ldr r3, [sp, #0x10]
	adds r2, r3, #0
	muls r2, r1, r2
	mov sl, r2
	adds r2, r2, r5
	mov sb, r2
	ldr r0, [r0]
	ldrh r1, [r2, #0x16]
	cmp r0, r1
	bgt _080509DE
	b _08050ADA
_080509DE:
	ldrh r0, [r6, #2]
	cmp r0, #1
	bne _080509E6
	strh r0, [r6, #2]
_080509E6:
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldrb r0, [r4, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r4, #5]
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r3, [sp, #0x14]
	lsls r7, r3, #1
	mov r0, sl
	adds r2, r7, r0
	adds r1, r5, #0
	adds r1, #0x26
	adds r1, r2, r1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r2, r0
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	ldr r1, _08050AB0 @ =gUnknown_0202972C
	adds r6, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r3, [r6]
	adds r0, r0, r3
	strh r0, [r6]
	adds r1, r5, #0
	adds r1, #0x44
	adds r1, r2, r1
	adds r0, r5, #0
	adds r0, #0x4e
	adds r0, r2, r0
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	movs r1, #0x3a
	adds r1, r1, r5
	mov sl, r1
	adds r4, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	mov r3, r8
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r3, #0
	ldrsh r2, [r6, r3]
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldr r0, [sp, #0x10]
	bl sub_08050528
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _08050AB4
	ldr r2, _08050AB0 @ =gUnknown_0202972C
	adds r0, r7, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldrh r1, [r5, #0x18]
	cmp r0, r1
	bge _08050A90
	mov r2, sl
	adds r0, r7, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldrh r5, [r5, #0x1a]
	cmp r0, r5
	blt _08050ADA
_08050A90:
	mov r0, r8
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #0
	ldr r1, [sp, #0x14]
	bl sub_08050AEC
	b _08050ADA
	.align 2, 0
_08050AA0: .4byte gUnknown_03001470
_08050AA4: .4byte gUnknown_03001FBC
_08050AA8: .4byte gUnknown_0300454C
_08050AAC: .4byte gUnknown_02029710
_08050AB0: .4byte gUnknown_0202972C
_08050AB4:
	movs r2, #0
	ldrsh r0, [r6, r2]
	mov r3, sb
	ldrh r3, [r3, #0x18]
	cmp r0, r3
	ble _08050ACC
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, sb
	ldrh r2, [r2, #0x1a]
	cmp r0, r2
	blt _08050ADA
_08050ACC:
	mov r3, r8
	movs r0, #0
	ldrsh r2, [r3, r0]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl sub_08050AEC
_08050ADA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

