	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E3D8
sub_0803E3D8: @ 0x0803E3D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r2, _0803E404 @ =gUnknown_085C77A0
	ldr r0, _0803E408 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r6, [r0, #0x1c]
	ldrh r7, [r0, #0x1e]
	bl sub_0803DE14
	movs r5, #0
	ldr r1, _0803E40C @ =gUnknown_080912F8
	ldr r0, [r1]
	ldr r0, [r0]
	mov r8, r1
	b _0803E53E
	.align 2, 0
_0803E404: .4byte gUnknown_085C77A0
_0803E408: .4byte gUnknown_03003FC0
_0803E40C: .4byte gUnknown_080912F8
_0803E410:
	movs r4, #0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r1, r5, #1
	mov sb, r1
	b _0803E52E
_0803E41C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803DE94
	cmp r0, #0
	beq _0803E42A
	b _0803E526
_0803E42A:
	mov r2, r8
	ldr r0, [r2]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _0803E458 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0803E45C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #0x15
	cmp r0, #0xa
	bhi _0803E526
	lsls r0, r0, #2
	ldr r1, _0803E460 @ =_0803E464
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E458: .4byte 0x0000417A
_0803E45C: .4byte 0x00001432
_0803E460: .4byte _0803E464
_0803E464: @ jump table
	.4byte _0803E4A2 @ case 0
	.4byte _0803E49E @ case 1
	.4byte _0803E4A6 @ case 2
	.4byte _0803E4AA @ case 3
	.4byte _0803E490 @ case 4
	.4byte _0803E4DC @ case 5
	.4byte _0803E4D2 @ case 6
	.4byte _0803E4BC @ case 7
	.4byte _0803E4F2 @ case 8
	.4byte _0803E514 @ case 9
	.4byte _0803E506 @ case 10
_0803E490:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_0803E158
	b _0803E526
_0803E49E:
	movs r0, #1
	b _0803E4AC
_0803E4A2:
	movs r0, #0
	b _0803E4AC
_0803E4A6:
	movs r0, #2
	b _0803E4AC
_0803E4AA:
	movs r0, #3
_0803E4AC:
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl sub_0803E260
	b _0803E526
_0803E4BC:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	movs r3, #4
	bl sub_0803E1B0
	b _0803E526
_0803E4D2:
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	b _0803E4E2
_0803E4DC:
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
_0803E4E2:
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #3
	bl sub_0803E208
	b _0803E526
_0803E4F2:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #4
	bl sub_0803E310
	b _0803E526
_0803E506:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	movs r3, #4
	bl sub_0803E108
	b _0803E526
_0803E514:
	movs r0, #7
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #3
	bl sub_0803E2B8
_0803E526:
	adds r4, #1
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
_0803E52E:
	ldrh r0, [r0]
	cmp r4, r0
	bge _0803E536
	b _0803E41C
_0803E536:
	mov r5, sb
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
_0803E53E:
	ldrh r0, [r0, #2]
	cmp r5, r0
	bge _0803E546
	b _0803E410
_0803E546:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

