	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055058
sub_08055058: @ 0x08055058
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _08055168 @ =gUnknown_0300450C
	ldrh r0, [r0]
	mov r8, r0
	mov r1, sp
	ldr r2, _0805516C @ =gUnknown_02029808
	ldrh r0, [r2, #0x30]
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x9c
	ldrh r1, [r0]
	mov r0, sp
	adds r0, #2
	strh r1, [r0]
	movs r4, #0
	movs r3, #0x6c
	adds r2, #0x3a
	movs r5, #0x80
	lsls r5, r5, #2
	movs r1, #1
	mov r0, r8
	eors r0, r1
	adds r6, r0, #0
	muls r6, r3, r6
	mov r0, r8
	muls r0, r3, r0
	adds r3, r0, #0
_080550A2:
	lsls r0, r4, #1
	adds r1, r0, r3
	adds r1, r1, r2
	strh r5, [r1]
	adds r0, r0, r6
	adds r0, r0, r2
	strh r5, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080550A2
	movs r1, #0x80
	lsls r1, r1, #7
	mov sl, r1
	ldr r2, _08055170 @ =gUnknown_08552D80
	mov sb, r2
	movs r1, #1
	mov r0, r8
	eors r0, r1
	lsls r0, r0, #1
	mov r3, sp
	adds r4, r3, r0
	ldrh r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r1, r0, #2
	adds r0, r1, r2
	ldrh r5, [r0]
	cmp r5, #0
	beq _080550F0
	mov r0, sb
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r1, _08055174 @ =0x06014000
	lsrs r2, r5, #2
	bl CpuFastSet
_080550F0:
	lsrs r0, r5, #5
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #2
	bne _08055198
	mov r3, sl
	adds r0, r5, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov sl, r1
	lsrs r4, r0, #0x15
	adds r6, r4, #0
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r3, r0, #2
	mov r2, sb
	adds r0, r3, r2
	ldrh r5, [r0]
	cmp r5, #0
	beq _0805512E
	mov r0, sb
	adds r0, #8
	adds r0, r3, r0
	ldr r0, [r0]
	ldr r1, _08055178 @ =0x06010000
	add r1, sl
	lsrs r2, r5, #2
	bl CpuFastSet
_0805512E:
	movs r0, #0
	lsrs r5, r5, #5
	mov ip, r5
	str r4, [sp, #8]
	movs r3, #0x6c
	mov sl, r3
	ldr r1, _0805517C @ =gUnknown_02029842
	movs r7, #0xa
	rsbs r7, r7, #0
	adds r7, r7, r1
	mov sb, r7
	movs r2, #0x80
	lsls r2, r2, #2
	mov r8, r2
_0805514A:
	movs r4, #0
	adds r2, r0, #1
	mov r5, sl
	muls r5, r0, r5
_08055152:
	lsls r0, r4, #1
	adds r3, r0, r5
	mov r7, sb
	adds r0, r3, r7
	ldrh r0, [r0]
	cmp r0, #2
	bne _08055180
	adds r0, r3, r1
	mov r3, r8
	strh r3, [r0]
	b _08055184
	.align 2, 0
_08055168: .4byte gUnknown_0300450C
_0805516C: .4byte gUnknown_02029808
_08055170: .4byte gUnknown_08552D80
_08055174: .4byte 0x06014000
_08055178: .4byte 0x06010000
_0805517C: .4byte gUnknown_02029842
_08055180:
	adds r0, r3, r1
	strh r6, [r0]
_08055184:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08055152
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0805514A
	b _080551FA
_08055198:
	mov r7, r8
	lsls r0, r7, #1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	ldrh r4, [r4]
	cmp r0, r4
	beq _08055202
	mov r3, sl
	adds r0, r5, r3
	lsls r7, r0, #0x10
	lsrs r0, r7, #0x10
	mov sl, r0
	ldrh r1, [r1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r1, r0, #2
	mov r2, sb
	adds r0, r1, r2
	ldrh r5, [r0]
	cmp r5, #0
	beq _080551D6
	mov r0, sb
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r1, _08055214 @ =0x06010000
	add r1, sl
	lsrs r2, r5, #2
	bl CpuFastSet
_080551D6:
	movs r4, #0
	lsrs r5, r5, #5
	mov ip, r5
	lsrs r3, r7, #0x15
	str r3, [sp, #8]
	movs r0, #0x6c
	mov r3, r8
	muls r3, r0, r3
	ldr r1, _08055218 @ =gUnknown_02029842
_080551E8:
	lsls r0, r4, #1
	adds r0, r0, r3
	adds r0, r0, r1
	strh r6, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080551E8
_080551FA:
	ldr r0, [sp, #8]
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08055202:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08055214: .4byte 0x06010000
_08055218: .4byte gUnknown_02029842

