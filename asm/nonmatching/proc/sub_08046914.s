	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046914
sub_08046914: @ 0x08046914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r2, _080469DC @ =gUnknown_08610A38
	ldr r1, _080469E0 @ =gUnknown_085D583C
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r6, [r0]
	adds r0, r6, #0
	bl sub_08014CEC
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x50
	subs r1, r5, r0
	adds r0, r1, #4
	cmp r0, #0
	bge _08046954
	adds r0, #7
_08046954:
	lsls r0, r0, #0xd
	asrs r0, r0, #0x10
	ldr r4, _080469E4 @ =gUnknown_0812A110
	ldr r1, [r4]
	mov r8, r1
	ldr r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #8
	mov sb, r3
	str r3, [sp]
	movs r1, #0
	mov sl, r1
	str r1, [sp, #4]
	movs r1, #1
	adds r3, r6, #0
	bl sub_080149C0
	adds r0, r5, #0
	adds r0, #0x38
	str r0, [sp, #8]
	lsrs r0, r0, #3
	mov r3, r8
	ldr r2, [r3]
	movs r3, #0x96
	lsls r3, r3, #4
	mov r4, sb
	str r4, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r1, #3
	bl sub_08014A5C
	ldr r0, _080469E8 @ =gUnknown_02028DD4
	ldrb r1, [r0]
	cmp r1, #0
	bne _080469B4
	adds r0, r5, #0
	adds r0, #0x50
	lsrs r0, r0, #3
	mov r3, r8
	ldr r2, [r3]
	ldr r3, _080469EC @ =0x00000969
	mov r4, sb
	str r4, [sp]
	str r1, [sp, #4]
	movs r1, #3
	bl sub_08014A5C
_080469B4:
	adds r0, r7, #0
	bl sub_08026C6C
	adds r4, r0, #0
	cmp r4, #0
	bne _080469F4
	adds r0, r5, #0
	adds r0, #0x50
	lsrs r0, r0, #3
	ldr r1, _080469F0 @ =gUnknown_08499578
	ldr r2, [r1]
	ldr r3, _080469EC @ =0x00000969
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #5
	bl sub_08014A5C
	b _08046A16
	.align 2, 0
_080469DC: .4byte gUnknown_08610A38
_080469E0: .4byte gUnknown_085D583C
_080469E4: .4byte gUnknown_0812A110
_080469E8: .4byte gUnknown_02028DD4
_080469EC: .4byte 0x00000969
_080469F0: .4byte gUnknown_08499578
_080469F4:
	adds r0, r7, #0
	bl sub_08026C6C
	adds r3, r0, #0
	adds r0, r5, #0
	adds r0, #0x60
	lsrs r0, r0, #3
	ldr r1, _08046A54 @ =gUnknown_08499578
	ldr r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #5
	bl sub_08014B0C
_08046A16:
	movs r2, #0
	ldr r6, _08046A58 @ =gUnknown_0812A114
	ldr r3, _08046A5C @ =gUnknown_085D5B10
_08046A1C:
	ldr r0, [r6]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08046A64
	ldr r0, [sp, #8]
	lsrs r0, r0, #3
	ldr r1, _08046A54 @ =gUnknown_08499578
	ldr r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #8
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #7
	ldr r3, _08046A60 @ =0x00000961
	bl sub_08014A5C
	b _08046A6E
	.align 2, 0
_08046A54: .4byte gUnknown_08499578
_08046A58: .4byte gUnknown_0812A114
_08046A5C: .4byte gUnknown_085D5B10
_08046A60: .4byte 0x00000961
_08046A64:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #2
	bls _08046A1C
_08046A6E:
	bl sub_08013AEC
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

