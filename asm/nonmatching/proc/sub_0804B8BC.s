	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B8BC
sub_0804B8BC: @ 0x0804B8BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	mov ip, r2
	ldr r3, _0804B958 @ =gUnknown_08555850
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	ldrb r7, [r2, #2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r6, [r0, #2]
	movs r2, #0
	ldr r5, _0804B95C @ =gUnknown_08136034
	ldr r3, _0804B960 @ =gUnknown_08136038
	mov r8, r3
	ldr r4, [r5]
	movs r1, #0
	movs r3, #1
_0804B8F2:
	lsls r0, r2, #4
	adds r0, r0, r4
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r3, [r0]
	strh r1, [r0, #8]
	strh r1, [r0, #0xe]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #1
	bls _0804B8F2
	ldr r0, _0804B964 @ =gUnknown_0300450C
	ldrh r1, [r0]
	cmp r1, #0
	bne _0804B91C
	lsls r0, r7, #1
	adds r0, r0, r7
	adds r0, r6, r0
	lsls r0, r0, #1
	mov ip, r0
_0804B91C:
	cmp r1, #1
	bne _0804B932
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r7, r0
	lsls r0, r0, #0x11
	movs r1, #0x90
	lsls r1, r1, #0xd
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	mov ip, r0
_0804B932:
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804B99C
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0804B96C
	ldr r2, [r5]
	ldr r1, _0804B968 @ =gUnknown_085557C0
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	b _0804B972
	.align 2, 0
_0804B958: .4byte gUnknown_08555850
_0804B95C: .4byte gUnknown_08136034
_0804B960: .4byte gUnknown_08136038
_0804B964: .4byte gUnknown_0300450C
_0804B968: .4byte gUnknown_085557C0
_0804B96C:
	ldr r1, [r5]
	ldr r0, _0804B988 @ =gUnknown_08555720
	str r0, [r1, #4]
_0804B972:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804B990
	ldr r2, [r5]
	ldr r1, _0804B98C @ =gUnknown_085557C0
	b _0804B9AA
	.align 2, 0
_0804B988: .4byte gUnknown_08555720
_0804B98C: .4byte gUnknown_085557C0
_0804B990:
	ldr r1, [r5]
	ldr r0, _0804B998 @ =gUnknown_08555720
	str r0, [r1, #0x14]
	b _0804B9B6
	.align 2, 0
_0804B998: .4byte gUnknown_08555720
_0804B99C:
	ldr r2, [r5]
	ldr r1, _0804BA3C @ =gUnknown_085557C0
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
_0804B9AA:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #0x14]
_0804B9B6:
	movs r0, #0
	adds r1, r7, #0
	bl sub_0804BA64
	movs r0, #1
	adds r1, r6, #0
	bl sub_0804BA64
	ldr r4, _0804BA40 @ =gUnknown_085D6A48
	ldr r3, _0804BA44 @ =gUnknown_03004580
	ldrh r0, [r3, #2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #9
	bne _0804B9E0
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #4]
_0804B9E0:
	ldrh r0, [r3, #0x12]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, r1, r4
	ldrh r0, [r2]
	cmp r0, #9
	bne _0804B9F6
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #0x14]
_0804B9F6:
	ldrh r0, [r3, #2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r4
	ldrh r0, [r3]
	cmp r0, #0xa
	bne _0804BA0C
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #4]
_0804BA0C:
	ldrh r0, [r2]
	cmp r0, #0xa
	bne _0804BA18
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #0x14]
_0804BA18:
	ldrh r0, [r3]
	cmp r0, #0xe
	bne _0804BA24
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #4]
_0804BA24:
	ldrh r0, [r2]
	cmp r0, #0xe
	bne _0804BA30
	ldr r1, [r5]
	ldr r0, _0804BA48 @ =gUnknown_08555720
	str r0, [r1, #0x14]
_0804BA30:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA3C: .4byte gUnknown_085557C0
_0804BA40: .4byte gUnknown_085D6A48
_0804BA44: .4byte gUnknown_03004580
_0804BA48: .4byte gUnknown_08555720

