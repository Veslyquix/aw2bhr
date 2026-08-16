	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055D4C
sub_08055D4C: @ 0x08055D4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	add r2, sp, #0x10
	strh r0, [r2]
	mov r0, sp
	adds r0, #0x12
	strh r1, [r0]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08055F4C @ =gUnknown_0300450C
	ldrh r0, [r0]
	str r0, [sp, #0x18]
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x24]
	subs r2, #8
	str r2, [sp, #0x20]
	mov r3, sp
	adds r3, #6
	str r3, [sp, #0x1c]
	movs r2, #0
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	movs r7, #1
_08055D84:
	strh r2, [r0]
	strh r2, [r1]
	adds r1, #2
	adds r0, #2
	subs r7, #1
	cmp r7, #0
	bge _08055D84
	movs r0, #0
	bl sub_08055F68
	ldr r5, [sp, #0x1c]
	strh r0, [r5]
	movs r0, #1
	bl sub_08055F68
	add r1, sp, #4
	strh r0, [r1]
	movs r7, #0
	ldr r0, [sp, #0x18]
	lsls r0, r0, #1
	str r0, [sp, #0x28]
	movs r1, #0
	str r1, [sp, #0x2c]
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r3, [sp, #0x20]
	mov sl, r3
	movs r5, #0
	str r5, [sp, #0x34]
	ldr r0, [sp, #0x24]
	mov r8, r0
_08055DC4:
	movs r6, #0
	mov r1, sl
	str r1, [sp, #0x38]
	ldr r2, [sp, #0x30]
	mov sb, r2
	movs r0, #0xb4
	muls r0, r7, r0
	ldr r3, _08055F50 @ =gUnknown_02029A10
	adds r2, r0, r3
	mov r4, r8
	ldr r5, [sp, #0x34]
	mov ip, r5
	ldr r0, [sp, #0x2c]
	ldr r1, _08055F54 @ =gUnknown_020296BC
	adds r3, r0, r1
_08055DE2:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08055DF6
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _08055DF6
	ldr r5, [sp, #0x38]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_08055DF6:
	lsls r1, r6, #1
	ldrh r0, [r3]
	cmp r0, #0xff
	beq _08055E04
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_08055E04:
	mov r5, ip
	adds r0, r1, r5
	ldr r1, _08055F58 @ =gUnknown_02029838
	adds r0, r0, r1
	mov r5, sb
	ldrh r1, [r5]
	strh r1, [r0]
	adds r2, #0x24
	adds r3, #2
	adds r6, #1
	cmp r6, #4
	ble _08055DE2
	ldr r0, [sp, #0x2c]
	adds r0, #0x28
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r1, #2
	str r1, [sp, #0x30]
	movs r2, #2
	add sl, r2
	ldr r3, [sp, #0x34]
	adds r3, #0x6c
	str r3, [sp, #0x34]
	add r8, r2
	adds r7, #1
	cmp r7, #1
	ble _08055DC4
	movs r7, #0
	ldr r5, _08055F5C @ =gUnknown_02029808
	mov sl, r5
	ldr r0, _08055F60 @ =gUnknown_08552D80
	mov r8, r0
	movs r1, #0x44
	add r1, sl
	mov ip, r1
_08055E4A:
	lsls r0, r7, #1
	adds r2, r7, #1
	mov sb, r2
	lsls r5, r7, #2
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	movs r3, #0x6c
	adds r1, r7, #0
	muls r1, r3, r1
	mov r0, sl
	adds r0, #0x58
	adds r7, r1, r0
	adds r3, r1, #0
	movs r6, #4
_08055E68:
	mov r0, ip
	adds r2, r3, r0
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	mov r1, r8
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, _08055F64 @ =gUnknown_08552D94
	adds r0, r0, r1
	ldr r0, [r0]
	stm r7!, {r0}
	adds r3, #4
	subs r6, #1
	cmp r6, #0
	bge _08055E68
	mov r7, sb
	cmp r7, #1
	ble _08055E4A
	ldr r4, [sp, #0x28]
	mov r5, sp
	adds r5, r5, r4
	adds r5, #0x10
	ldrh r0, [r5]
	cmp r0, #2
	bne _08055EE2
	movs r2, #1
	str r2, [sp, #0x14]
	ldr r3, [sp, #0x20]
	adds r1, r3, r4
	movs r0, #0
	strh r0, [r1]
	ldr r1, [sp, #0x24]
	adds r0, r1, r4
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	eors r1, r2
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x14]
	eors r2, r3
	lsls r2, r2, #1
	ldr r3, [sp, #0x20]
	adds r2, r3, r2
	ldrh r2, [r2]
	mov r3, sp
	adds r3, r3, r4
	adds r3, #4
	ldrh r3, [r3]
	str r3, [sp]
	movs r3, #2
	bl sub_080560A4
_08055EE2:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _08055F10
	ldr r2, [sp, #0x24]
	ldrh r1, [r2]
	mov r0, sp
	adds r0, #0xa
	ldrh r2, [r0]
	ldr r0, [sp, #0x1c]
	ldrh r3, [r0]
	movs r0, #0
	bl sub_0805601C
	mov r0, sp
	adds r0, #0xe
	ldrh r1, [r0]
	ldr r3, [sp, #0x20]
	ldrh r2, [r3]
	add r0, sp, #4
	ldrh r3, [r0]
	movs r0, #1
	bl sub_0805601C
_08055F10:
	ldrh r0, [r5]
	cmp r0, #2
	bne _08055F1E
	ldr r5, [sp, #0x20]
	adds r1, r5, r4
	movs r0, #0
	strh r0, [r1]
_08055F1E:
	movs r0, #1
	ldr r1, [sp, #0x18]
	eors r1, r0
	lsls r0, r1, #1
	add r0, sp
	adds r0, #0x10
	ldrh r0, [r0]
	cmp r0, #2
	bne _08055F3A
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x28]
	adds r1, r2, r3
	movs r0, #0
	strh r0, [r1]
_08055F3A:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055F4C: .4byte gUnknown_0300450C
_08055F50: .4byte gUnknown_02029A10
_08055F54: .4byte gUnknown_020296BC
_08055F58: .4byte gUnknown_02029838
_08055F5C: .4byte gUnknown_02029808
_08055F60: .4byte gUnknown_08552D80
_08055F64: .4byte gUnknown_08552D94

