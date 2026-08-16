	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087A10
sub_08087A10: @ 0x08087A10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, [r0, #0x54]
	str r0, [sp, #4]
	movs r4, #2
	str r4, [sp]
	movs r0, #0x61
	movs r1, #0xb8
	movs r2, #0x20
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x60
	movs r1, #0xd8
	movs r2, #0x20
	movs r3, #0
	bl sub_0801F34C
	movs r5, #0
	movs r6, #2
	movs r4, #0x28
_08087A44:
	adds r0, r5, #0
	adds r0, #0x6a
	str r6, [sp]
	movs r1, #0x70
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x10
	adds r5, #1
	cmp r5, #4
	ble _08087A44
	ldr r2, _08087B18 @ =gUnknown_0200C078
	ldr r0, _08087B1C @ =gUnknown_02027F74
	adds r0, #4
	ldr r1, [sp, #4]
	adds r0, r1, r0
	ldrb r1, [r0]
	subs r1, #0x6c
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _08087B06
	movs r5, #0
	movs r0, #0xb4
	mov sl, r0
	movs r1, #0xa0
	lsls r1, r1, #8
	mov sb, r1
	movs r0, #0x38
	mov r8, r0
	movs r7, #0x28
_08087A8E:
	lsls r6, r5, #2
	ldr r0, _08087B1C @ =gUnknown_02027F74
	adds r0, #4
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldrb r1, [r4]
	subs r1, #0x6c
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r1, _08087B18 @ =gUnknown_0200C078
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x14
	cmp r2, #0
	beq _08087AF0
	movs r0, #0xc4
	adds r1, r7, #0
	movs r3, #0x79
	bl sub_08087B20
	ldrb r1, [r4]
	subs r1, #0x6c
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r1, _08087B18 @ =gUnknown_0200C078
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	lsrs r2, r2, #4
	movs r0, #0xe4
	adds r1, r7, #0
	movs r3, #0x6f
	bl sub_08087B20
	movs r2, #0x80
	lsls r2, r2, #3
	mov r0, sl
	orrs r2, r0
	mov r1, sb
	orrs r2, r1
	movs r0, #0xa0
	mov r1, r8
	movs r3, #6
	bl sub_0804402C
_08087AF0:
	movs r0, #0xc
	add sl, r0
	movs r1, #0x80
	lsls r1, r1, #5
	add sb, r1
	movs r0, #0x10
	add r8, r0
	adds r7, #0x10
	adds r5, #1
	cmp r5, #4
	ble _08087A8E
_08087B06:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087B18: .4byte gUnknown_0200C078
_08087B1C: .4byte gUnknown_02027F74

