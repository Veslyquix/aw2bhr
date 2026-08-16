	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08038368
sub_08038368: @ 0x08038368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	mov ip, r1
	mov r8, r2
	movs r6, #0
	movs r4, #0
	ldr r1, _08038390 @ =gUnknown_08090F08
	ldr r0, [r1]
	adds r5, r0, #0
	adds r5, #0x38
	ldr r0, [r0, #0x38]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	adds r2, r1, #0
	cmp r0, #0
	beq _080383BA
	ldrb r0, [r5]
	b _080383B4
	.align 2, 0
_08038390: .4byte gUnknown_08090F08
_08038394:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x28
	bhi _080383FA
	ldr r1, [r2]
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x38
	ldr r0, [r0, #0x38]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _080383BA
	ldrb r0, [r1]
_080383B4:
	cmp r0, r3
	bne _08038394
	movs r6, #1
_080383BA:
	cmp r4, #0x28
	bhi _080383FA
	ldr r7, [r2]
	lsls r2, r4, #2
	adds r2, r2, r7
	adds r0, r2, #0
	adds r0, #0x38
	strb r3, [r0]
	ldr r1, _08038404 @ =0x00000FFF
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, [r2, #0x38]
	ldr r5, _08038408 @ =0xFFF000FF
	ands r0, r5
	orrs r0, r1
	str r0, [r2, #0x38]
	mov r0, r8
	lsls r3, r0, #4
	ldrh r1, [r2, #0x3a]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r3
	strh r0, [r2, #0x3a]
	cmp r6, #0
	bne _080383FA
	adds r1, r4, #1
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r0, [r1, #0x38]
	ands r0, r5
	str r0, [r1, #0x38]
_080383FA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038404: .4byte 0x00000FFF
_08038408: .4byte 0xFFF000FF

