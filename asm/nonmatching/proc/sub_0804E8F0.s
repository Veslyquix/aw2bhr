	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804E8F0
sub_0804E8F0: @ 0x0804E8F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r1, [sp, #0xc]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	str r1, [sp, #8]
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x16
	mov sl, r0
	lsrs r0, r0, #0x16
	ldr r2, [sp, #0xc]
	ldrh r2, [r2, #4]
	mov ip, r2
	mov r4, ip
	subs r5, r4, r0
	ldr r6, _0804EA0C @ =0x000003FF
	adds r0, r6, #0
	ands r5, r0
	ldr r0, _0804EA10 @ =gUnknown_08552A40
	lsls r1, r5, #1
	str r1, [sp, #0x10]
	adds r6, r1, r0
	ldrh r1, [r6]
	ldr r0, _0804EA14 @ =0x0000FFFF
	cmp r1, r0
	beq _0804E9FA
	ldr r2, _0804EA18 @ =gUnknown_08136090
	ldr r4, [r2]
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r3, r0, #5
	adds r0, r4, #0
	adds r0, #0x30
	adds r0, r3, r0
	ldrh r0, [r0]
	mov sb, r0
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r3, r0
	ldrh r7, [r0]
	ldrh r6, [r6]
	movs r1, #0xfc
	lsls r1, r1, #8
	mov r0, ip
	ands r1, r0
	adds r1, r1, r6
	mov ip, r1
	mov r1, sl
	lsrs r0, r1, #0x16
	add r0, ip
	ldr r1, [sp, #0xc]
	strh r0, [r1, #4]
	mov sl, r2
	cmp r6, #0
	bne _0804E9AE
	adds r0, r4, #0
	adds r0, #0x28
	adds r3, r3, r0
	ldr r0, [r3]
	cmp r0, r5
	beq _0804E9AE
	ldr r2, _0804EA1C @ =gUnknown_02029A10
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r4, sb
	muls r4, r1, r4
	adds r1, r4, #0
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r8, r0
	bne _0804E9AE
	str r5, [r3]
	ldr r0, _0804EA20 @ =gUnknown_08552700
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldrh r2, [r0]
	mov r0, sb
	adds r1, r7, #0
	bl sub_0804EA54
_0804E9AE:
	cmp r6, #0x28
	bne _0804E9FA
	mov r4, sl
	ldr r1, [r4]
	ldr r6, [sp, #8]
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r1, #0x2c
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, r5
	beq _0804E9FA
	ldr r2, _0804EA1C @ =gUnknown_02029A10
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r6, sb
	muls r6, r1, r6
	adds r1, r6, #0
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0x18
	ldrsh r0, [r0, r1]
	cmp r3, r0
	bne _0804E9FA
	str r5, [r4]
	ldr r0, _0804EA20 @ =gUnknown_08552700
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r2, [r1]
	mov r0, sb
	adds r1, r7, #0
	bl sub_0804EAEC
_0804E9FA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EA0C: .4byte 0x000003FF
_0804EA10: .4byte gUnknown_08552A40
_0804EA14: .4byte 0x0000FFFF
_0804EA18: .4byte gUnknown_08136090
_0804EA1C: .4byte gUnknown_02029A10
_0804EA20: .4byte gUnknown_08552700

