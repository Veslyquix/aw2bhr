	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BFBC
sub_0803BFBC: @ 0x0803BFBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, _0803BFFC @ =gUnknown_08091130
	ldr r2, [r1]
	ldrb r0, [r2, #0xd]
	strb r0, [r5]
	ldrb r0, [r2, #8]
	strb r0, [r5, #1]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r5, #3]
	ldr r0, [r2, #0x28]
	strh r0, [r5, #4]
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r5, #7]
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	mov sl, r1
	cmp r0, #0
	beq _0803C000
	movs r0, #1
	b _0803C004
	.align 2, 0
_0803BFFC: .4byte gUnknown_08091130
_0803C000:
	ldr r0, _0803C018 @ =gUnknown_0200C420
	ldrb r0, [r0, #0xe]
_0803C004:
	strb r0, [r5, #2]
	mov r0, sl
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803C01C
	movs r0, #0
	b _0803C034
	.align 2, 0
_0803C018: .4byte gUnknown_0200C420
_0803C01C:
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803C032
	cmp r0, #1
	ble _0803C02E
	cmp r0, #2
	beq _0803C034
_0803C02E:
	movs r0, #1
	b _0803C034
_0803C032:
	movs r0, #3
_0803C034:
	strb r0, [r5, #6]
	bl sub_08043CA0
	strb r0, [r5, #0x17]
	bl sub_08043C98
	str r0, [r5, #0x18]
	movs r3, #0
	movs r1, #0x2c
	adds r1, r1, r5
	mov r8, r1
	movs r2, #0xd
	adds r2, r2, r5
	mov sb, r2
	adds r4, r5, #0
	adds r4, #9
	str r4, [sp, #8]
	ldr r4, _0803C0E8 @ =gUnknown_03004002
	movs r7, #0xa
	rsbs r7, r7, #0
	adds r7, r7, r4
	mov ip, r7
	adds r6, r5, #0
	adds r6, #0x11
_0803C064:
	ldr r0, [sp, #8]
	adds r2, r0, r3
	adds r1, r3, #1
	mov r7, ip
	adds r0, r1, r7
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, r6, r3
	adds r0, r1, r4
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #3
	bls _0803C064
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803C0F0
	mov r2, sl
	ldr r0, [r2]
	ldrb r0, [r0, #9]
	strb r0, [r5, #2]
	movs r3, #0
	adds r4, r5, #0
	adds r4, #0x20
	ldr r0, _0803C0EC @ =gUnknown_08499598
	ldr r2, [r0]
_0803C09C:
	adds r1, r4, r3
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x59
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C09C
	movs r3, #0
	mov r4, sb
	ldr r0, _0803C0EC @ =gUnknown_08499598
	ldr r2, [r0]
_0803C0BE:
	adds r1, r4, r3
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x56
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C0BE
	bl sub_080248F8
	movs r1, #0
	strb r0, [r5, #8]
	strb r1, [r5, #0x15]
	movs r0, #0x80
	strb r0, [r5, #0x16]
	b _0803C1BE
	.align 2, 0
_0803C0E8: .4byte gUnknown_03004002
_0803C0EC: .4byte gUnknown_08499598
_0803C0F0:
	movs r3, #0
	adds r4, r5, #0
	adds r4, #0x15
	str r4, [sp]
	adds r7, r5, #0
	adds r7, #0x16
	str r7, [sp, #4]
	ldr r0, _0803C12C @ =gUnknown_020288A0
	ldrb r0, [r0]
	mov ip, r0
	ldr r0, _0803C130 @ =gUnknown_03003FFD
	mov r8, r0
_0803C108:
	movs r1, #0
	adds r0, r3, #1
	mov r2, ip
	cmp r2, #0xff
	beq _0803C142
	ldr r2, _0803C12C @ =gUnknown_020288A0
	mov r4, r8
	adds r6, r0, r4
	adds r0, r5, #0
	adds r0, #0x1c
	adds r4, r0, r3
_0803C11E:
	adds r0, r1, r2
	ldrb r0, [r0]
	ldrb r7, [r6]
	cmp r0, r7
	bne _0803C134
	strb r1, [r4]
	b _0803C142
	.align 2, 0
_0803C12C: .4byte gUnknown_020288A0
_0803C130: .4byte gUnknown_03003FFD
_0803C134:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0803C11E
_0803C142:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C108
	mov r0, sl
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bhi _0803C188
	movs r3, #0
	mov r4, sb
	ldrb r1, [r1, #2]
	subs r1, #0xb4
	ldr r6, _0803C184 @ =gUnknown_020280D4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, #1
_0803C16E:
	adds r1, r4, r3
	adds r0, r3, r2
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C16E
	b _0803C1AA
	.align 2, 0
_0803C184: .4byte gUnknown_020280D4
_0803C188:
	movs r3, #0
	mov r4, sb
	ldrb r1, [r1, #2]
	movs r0, #0x5c
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r6, _0803C1D0 @ =gUnknown_085C77E0
_0803C196:
	adds r1, r4, r3
	adds r0, r3, r2
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0803C196
_0803C1AA:
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #2]
	bl sub_0802490C
	strb r0, [r5, #8]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_08021810
_0803C1BE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C1D0: .4byte gUnknown_085C77E0

