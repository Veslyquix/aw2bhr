	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B4D4
sub_0802B4D4: @ 0x0802B4D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r0, _0802B5E0 @ =gUnknown_0849A02C
	bl Proc_Find
	cmp r0, #0
	beq _0802B4FA
	b _0802B6A2
_0802B4FA:
	ldr r1, _0802B5E4 @ =gUnknown_08090BB4
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802B50A
	b _0802B608
_0802B50A:
	movs r6, #7
	movs r1, #4
	lsls r4, r4, #0x10
	str r4, [sp, #4]
	lsls r5, r5, #0x10
	str r5, [sp, #0xc]
	ldr r0, [sp]
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	asrs r4, r4, #0x10
	mov sl, r4
	asrs r5, r5, #0x10
	mov sb, r5
_0802B524:
	lsls r7, r1, #0x18
	lsrs r0, r7, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B59E
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	lsls r4, r4, #1
	ldr r2, _0802B5E8 @ =gUnknown_0849A2A6
	adds r4, r4, r2
	movs r3, #0
	ldrsh r0, [r4, r3]
	add r0, sl
	adds r0, #4
	ldr r1, _0802B5EC @ =0x000001FF
	ands r0, r1
	ldr r1, [sp, #8]
	asrs r5, r1, #0x10
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	subs r5, r5, r6
	movs r1, #0xff
	ands r1, r5
	asrs r2, r7, #0x18
	mov r8, r2
	mov r3, r8
	adds r3, #8
	lsls r3, r3, #0xc
	ldr r2, _0802B5F0 @ =0x00000361
	orrs r3, r2
	ldr r2, _0802B5F4 @ =gUnknown_0848B688
	bl sub_0801BD00
	ldrh r0, [r4]
	add r0, sl
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, _0802B5F8 @ =gUnknown_03003FC0
	adds r1, #0x31
	ldrb r2, [r1]
	ldr r1, _0802B5FC @ =gUnknown_08499598
	ldr r3, [r1]
	mov r4, r8
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #0x11]
	subs r2, r2, r1
	adds r1, r5, #0
	bl sub_0802BAFC
	adds r6, #7
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
_0802B59E:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r7, r1
	lsrs r1, r0, #0x18
	cmp r0, #0
	bgt _0802B524
	ldr r2, [sp, #4]
	asrs r0, r2, #0x10
	ldr r3, _0802B5E8 @ =gUnknown_0849A2A6
	ldr r4, [sp, #0xc]
	asrs r2, r4, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	adds r0, #1
	ldr r1, _0802B5EC @ =0x000001FF
	ands r0, r1
	ldr r3, [sp, #8]
	asrs r1, r3, #0x10
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	subs r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0802B600 @ =gUnknown_0848B6B0
	ldr r3, _0802B604 @ =0x00001362
	bl sub_0801BD00
	b _0802B6A2
	.align 2, 0
_0802B5E0: .4byte gUnknown_0849A02C
_0802B5E4: .4byte gUnknown_08090BB4
_0802B5E8: .4byte gUnknown_0849A2A6
_0802B5EC: .4byte 0x000001FF
_0802B5F0: .4byte 0x00000361
_0802B5F4: .4byte gUnknown_0848B688
_0802B5F8: .4byte gUnknown_03003FC0
_0802B5FC: .4byte gUnknown_08499598
_0802B600: .4byte gUnknown_0848B6B0
_0802B604: .4byte 0x00001362
_0802B608:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B6A2
	movs r6, #7
	movs r1, #4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
_0802B622:
	lsls r7, r1, #0x18
	lsrs r0, r7, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B696
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #1
	ldr r1, _0802B6B4 @ =gUnknown_0849A2A6
	adds r4, r4, r1
	movs r2, #0
	ldrsh r0, [r4, r2]
	add r0, sl
	adds r0, #4
	ldr r1, _0802B6B8 @ =0x000001FF
	ands r0, r1
	ldr r3, [sp]
	lsls r5, r3, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	subs r5, r5, r6
	movs r1, #0xff
	ands r1, r5
	asrs r2, r7, #0x18
	mov r8, r2
	mov r3, r8
	adds r3, #8
	lsls r3, r3, #0xc
	ldr r2, _0802B6BC @ =0x00000361
	orrs r3, r2
	ldr r2, _0802B6C0 @ =gUnknown_0848B688
	bl sub_0801BD00
	ldrh r0, [r4]
	add r0, sl
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, _0802B6C4 @ =gUnknown_08499598
	ldr r2, [r1]
	mov r3, r8
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0x11]
	adds r1, r5, #0
	bl sub_0802BAFC
	adds r6, #7
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
_0802B696:
	movs r4, #0xff
	lsls r4, r4, #0x18
	adds r0, r7, r4
	lsrs r1, r0, #0x18
	cmp r0, #0
	bgt _0802B622
_0802B6A2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B6B4: .4byte gUnknown_0849A2A6
_0802B6B8: .4byte 0x000001FF
_0802B6BC: .4byte 0x00000361
_0802B6C0: .4byte gUnknown_0848B688
_0802B6C4: .4byte gUnknown_08499598

