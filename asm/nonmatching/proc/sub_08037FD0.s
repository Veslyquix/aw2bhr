	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037FD0
sub_08037FD0: @ 0x08037FD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	movs r6, #1
_08037FE0:
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08037FFA
	ldr r0, _0803804C @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	adds r0, r4, #0
	bl sub_080265D0
_08037FFA:
	adds r6, #1
	cmp r6, #4
	ble _08037FE0
	bl sub_08026520
	bl sub_0807A908
	ldr r7, _08038050 @ =gUnknown_08499598
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r6, [r1, #0x1d]
	ldr r4, _0803804C @ =gUnknown_03003FC0
	ldrb r5, [r4, #2]
	bl sub_0807A908
	ldr r2, [r7]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0x38]
	ldr r0, _08038054 @ =gUnknown_03004080
	ldrh r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08017720
	bl sub_08030574
	ldrb r0, [r4, #1]
	cmp r0, #0
	bge _08038042
	b _080381AE
_08038042:
	cmp r0, #2
	ble _08038058
	cmp r0, #3
	beq _0803806A
	b _080381AE
	.align 2, 0
_0803804C: .4byte gUnknown_03003FC0
_08038050: .4byte gUnknown_08499598
_08038054: .4byte gUnknown_03004080
_08038058:
	movs r0, #1
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08038066
	b _0803817E
_08038066:
	movs r0, #1
	b _080381A0
_0803806A:
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #8]
	str r0, [sp, #4]
	str r1, [sp]
	mov sl, r1
	movs r6, #1
	ldr r0, [r7]
	movs r1, #0x3c
	mov sb, r1
	adds r2, r0, #0
	adds r2, #0x50
_08038084:
	ldrb r0, [r2, #7]
	cmp r0, #0
	beq _080380D6
	ldrh r0, [r2]
	cmp r0, #0
	bne _080380D0
	movs r4, #1
	ldr r0, _080380C4 @ =gUnknown_08499598
	mov ip, r0
	mov r7, sb
	movs r5, #0x3c
_0803809A:
	cmp r6, r4
	beq _080380C8
	mov r1, ip
	ldr r3, [r1]
	adds r1, r5, r3
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _080380C8
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _080380C8
	adds r0, r7, r3
	adds r0, #0x2a
	adds r1, #0x2a
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080380C8
	movs r0, #1
	mov sl, r0
	b _080380D0
	.align 2, 0
_080380C4: .4byte gUnknown_08499598
_080380C8:
	adds r5, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _0803809A
_080380D0:
	mov r1, sl
	cmp r1, #1
	beq _0803817E
_080380D6:
	movs r0, #0x3c
	add sb, r0
	adds r2, #0x3c
	adds r6, #1
	cmp r6, #4
	ble _08038084
	mov r1, sl
	cmp r1, #1
	beq _0803817E
	movs r5, #0x80
	lsls r5, r5, #0x11
	movs r7, #0x3c
	movs r6, #3
_080380F0:
	ldr r0, _08038108 @ =gUnknown_08499598
	ldr r0, [r0]
	adds r0, r7, r0
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _08038112
	cmp r0, #1
	bgt _0803810C
	cmp r0, #0
	beq _0803814A
	b _0803813A
	.align 2, 0
_08038108: .4byte gUnknown_08499598
_0803810C:
	cmp r0, #2
	beq _08038126
	b _0803813A
_08038112:
	lsrs r0, r5, #0x18
	str r0, [sp]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803814A
	ldr r1, [sp]
	str r1, [sp, #8]
	b _0803814A
_08038126:
	lsrs r0, r5, #0x18
	str r0, [sp, #4]
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803814A
	ldr r1, [sp, #4]
	str r1, [sp, #0xc]
	b _0803814A
_0803813A:
	lsrs r4, r5, #0x18
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803814A
	str r4, [sp, #0xc]
_0803814A:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r7, #0x3c
	subs r6, #1
	cmp r6, #0
	bge _080380F0
	ldr r0, _08038174 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038186
	ldr r1, [sp]
	cmp r1, #0
	bne _08038178
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _0803817E
	adds r0, r1, #0
	b _080381A0
	.align 2, 0
_08038174: .4byte gUnknown_03003FC0
_08038178:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _080381A0
_0803817E:
	mov r0, r8
	bl sub_08037FB4
	b _080381AE
_08038186:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08038190
	ldr r0, [sp, #8]
	b _080381A0
_08038190:
	ldr r1, [sp]
	cmp r1, #0
	bne _0803819A
	ldr r0, [sp, #0xc]
	b _080381A0
_0803819A:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080381A8
_080381A0:
	mov r1, r8
	bl sub_08037F94
	b _080381AE
_080381A8:
	mov r0, r8
	bl sub_08037FB4
_080381AE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

