	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AD48
sub_0803AD48: @ 0x0803AD48
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r2, #0xc4
	lsls r2, r2, #1
	movs r0, #0xd8
	movs r1, #0x98
	bl sub_080119D4
	bl sub_0803ABD8
	ldr r2, _0803ADDC @ =gUnknown_0809105C
	movs r0, #0
	movs r1, #0
	bl sub_080119A0
	movs r5, #0
	ldr r0, _0803ADE0 @ =gUnknown_08091068
	mov sb, r0
	movs r1, #0x20
	adds r1, r1, r6
	mov r8, r1
	ldr r7, _0803ADE4 @ =gUnknown_08090FB0
_0803AD7A:
	lsls r4, r5, #0x13
	movs r3, #0x80
	lsls r3, r3, #0xc
	adds r4, r4, r3
	lsrs r4, r4, #0x10
	lsls r0, r5, #2
	adds r0, r0, r7
	ldr r2, [r0]
	movs r0, #0
	adds r1, r4, #0
	bl sub_080119A0
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r0, r1
	ldrh r2, [r0]
	movs r0, #0x68
	adds r1, r4, #0
	bl sub_0802BD54
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _0803AD7A
	ldrb r1, [r6, #0x1e]
	lsls r1, r1, #0x13
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	ldr r2, _0803ADE8 @ =gUnknown_08091064
	movs r0, #0
	bl sub_080119A0
	mov r1, sb
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r4, #1
	adds r1, r4, #0
	ands r1, r2
	cmp r1, #0
	beq _0803ADEC
	movs r0, #0
	str r0, [r6, #8]
	b _0803AEF4
	.align 2, 0
_0803ADDC: .4byte gUnknown_0809105C
_0803ADE0: .4byte gUnknown_08091068
_0803ADE4: .4byte gUnknown_08090FB0
_0803ADE8: .4byte gUnknown_08091064
_0803ADEC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803AE00
	ldr r0, _0803ADFC @ =gUnknown_03002F1C
	strh r4, [r0]
	str r1, [r6, #8]
	b _0803AEF4
	.align 2, 0
_0803ADFC: .4byte gUnknown_03002F1C
_0803AE00:
	ldrh r1, [r3, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803AE14
	ldrb r0, [r6, #0x1e]
	cmp r0, #0
	beq _0803AE14
	subs r0, #1
	strb r0, [r6, #0x1e]
_0803AE14:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803AE2E
	ldrb r0, [r6, #0x1e]
	cmp r0, #6
	bhi _0803AE2E
	adds r0, #1
	strb r0, [r6, #0x1e]
_0803AE2E:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803AE5A
	movs r5, #0
	mov r2, r8
	ldr r3, _0803AEB8 @ =gUnknown_08091038
_0803AE46:
	lsls r0, r5, #1
	adds r1, r2, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _0803AE46
_0803AE5A:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803AE8A
	movs r5, #0
	mov r1, r8
	movs r2, #0
_0803AE72:
	lsls r0, r5, #1
	adds r0, r1, r0
	strh r2, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bls _0803AE72
	bl sub_0803C670
	bl sub_0803BA1C
_0803AE8A:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0803AEC4
	ldr r0, _0803AEB8 @ =gUnknown_08091038
	ldrb r1, [r6, #0x1e]
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r4, [r0]
	ldr r0, _0803AEBC @ =gUnknown_0809104A
	adds r0, r1, r0
	ldrh r3, [r0]
	subs r0, r4, r3
	add r1, r8
	ldrh r2, [r1]
	cmp r0, r2
	bge _0803AEC0
	strh r4, [r1]
	b _0803AEC4
	.align 2, 0
_0803AEB8: .4byte gUnknown_08091038
_0803AEBC: .4byte gUnknown_0809104A
_0803AEC0:
	adds r0, r2, r3
	strh r0, [r1]
_0803AEC4:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803AEF4
	ldr r1, _0803AEEC @ =gUnknown_0809104A
	ldrb r0, [r6, #0x1e]
	lsls r0, r0, #1
	adds r1, r0, r1
	mov r3, r8
	adds r2, r3, r0
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r1, r0
	bls _0803AEF0
	movs r0, #0
	b _0803AEF2
	.align 2, 0
_0803AEEC: .4byte gUnknown_0809104A
_0803AEF0:
	subs r0, r0, r1
_0803AEF2:
	strh r0, [r2]
_0803AEF4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

