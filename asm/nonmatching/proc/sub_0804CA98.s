	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804CA98
sub_0804CA98: @ 0x0804CA98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x10]
	ldr r2, _0804CC18 @ =gUnknown_08136060
	ldr r0, [r2]
	mov sl, r0
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	adds r3, r6, #0
	muls r3, r1, r3
	mov ip, r3
	add r0, ip
	mov r1, sl
	adds r5, r0, r1
	ldrb r3, [r5]
	mov sb, r3
	cmp r3, #0
	beq _0804CAD6
	b _0804CC06
_0804CAD6:
	ldr r4, _0804CC1C @ =gUnknown_08136064
	ldr r0, [r4]
	mov r8, r0
	lsls r2, r7, #1
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	adds r0, r2, r0
	add r8, r0
	mov r1, r8
	ldrh r0, [r1]
	ldrh r1, [r5, #0x20]
	adds r0, r0, r1
	strh r0, [r5, #0x20]
	ldrh r1, [r5, #0x20]
	movs r0, #0xf
	ands r1, r0
	str r2, [sp, #0x1c]
	str r3, [sp, #0x18]
	cmp r1, #1
	bne _0804CB66
	ldrh r0, [r5, #0x22]
	adds r0, #1
	strh r0, [r5, #0x22]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bne _0804CB1A
	mov r3, sb
	mov r2, r8
	strh r3, [r2]
	movs r0, #0xff
	strh r0, [r5, #0x20]
_0804CB1A:
	ldrh r2, [r5, #0x22]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r3, r3, #2
	add r3, ip
	add r3, sl
	ldr r0, _0804CC20 @ =gUnknown_08552148
	lsls r4, r6, #1
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	add r1, sl
	ldr r5, _0804CC24 @ =gUnknown_0855335C
	lsls r2, r2, #1
	ldr r0, [sp, #0x14]
	adds r2, r0, r2
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	ldrh r1, [r1, #8]
	adds r0, r0, r1
	strh r0, [r3, #8]
	ldrh r0, [r4]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, ip
	add r1, sl
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r5
	ldrh r0, [r2]
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	strh r0, [r3, #0xa]
_0804CB66:
	ldr r0, _0804CC28 @ =gUnknown_02029B80
	ldr r2, [sp, #0x18]
	adds r1, r2, r6
	lsls r1, r1, #1
	ldr r3, [sp, #0x1c]
	adds r2, r3, r1
	adds r1, r2, r0
	ldrh r0, [r1]
	lsls r4, r7, #3
	cmp r0, #0
	beq _0804CBD0
	movs r3, #0
	strh r3, [r1]
	ldr r0, _0804CC2C @ =gUnknown_02029B94
	adds r0, r2, r0
	movs r1, #1
	strh r1, [r0]
	ldr r2, _0804CC30 @ =gUnknown_02029A10
	adds r0, r4, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	strh r3, [r0, #0x14]
	mov r0, sp
	strh r6, [r0]
	adds r0, #2
	strh r7, [r0]
	ldr r2, _0804CC34 @ =gUnknown_08553354
	ldr r1, [sp, #0x18]
	adds r0, r1, r2
	ldrh r1, [r0]
	add r0, sp, #4
	strh r1, [r0]
	lsls r0, r6, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	mov r0, sp
	adds r0, #6
	strh r1, [r0]
	add r0, sp, #8
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	add r1, sp, #0xc
	movs r0, #0x78
	strh r0, [r1]
	mov r0, sp
	bl sub_08056E28
_0804CBD0:
	ldr r2, _0804CC30 @ =gUnknown_02029A10
	adds r0, r4, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0, #0x14]
	ldrh r0, [r0, #0x16]
	cmp r1, r0
	bne _0804CC06
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0804CC06
	adds r0, r4, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804CC06
	adds r0, r4, #0
	bl sub_08015328
_0804CC06:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC18: .4byte gUnknown_08136060
_0804CC1C: .4byte gUnknown_08136064
_0804CC20: .4byte gUnknown_08552148
_0804CC24: .4byte gUnknown_0855335C
_0804CC28: .4byte gUnknown_02029B80
_0804CC2C: .4byte gUnknown_02029B94
_0804CC30: .4byte gUnknown_02029A10
_0804CC34: .4byte gUnknown_08553354

