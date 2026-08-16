	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030234
sub_08030234: @ 0x08030234
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov sl, r0
	mov r8, r0
	ldr r3, _08030324 @ =gUnknown_08090CB4
	ldr r0, [r3]
	ldr r1, [r0]
	ldr r2, _08030328 @ =gUnknown_08090CB8
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	movs r4, #0x82
	lsls r4, r4, #2
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	movs r0, #0xe0
	lsls r0, r0, #5
	ands r0, r1
	lsrs r7, r0, #0xa
	movs r6, #0
	mov sb, r3
	mov r4, sp
	movs r5, #0
_08030272:
	movs r0, #0
	strh r0, [r4]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080302DE
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r2, r0, r5
	ldrh r0, [r2]
	ldr r1, _0803032C @ =0x0000FFFF
	cmp r0, r1
	beq _080302B8
	ldrh r0, [r2]
	ldr r1, _08030330 @ =0x00005FFF
	cmp r0, r1
	beq _080302B8
	ldrh r1, [r2]
	ldr r0, _08030334 @ =0x00007FFF
	cmp r1, r0
	beq _080302B8
	ldrh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080302BC
_080302B8:
	movs r0, #1
	add sl, r0
_080302BC:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #0xa
	cmp r0, r7
	beq _080302DE
	movs r0, #1
	add r8, r0
_080302DE:
	adds r4, #2
	adds r5, #2
	adds r6, #1
	cmp r6, #3
	ble _08030272
	movs r6, #0
	ldr r7, _08030338 @ =gUnknown_03002040
	mov r4, sp
	movs r5, #0
_080302F0:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803034E
	mov r1, sl
	cmp r1, #0
	bne _08030340
	mov r2, r8
	cmp r2, #0
	bne _08030346
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r5
	ldrh r0, [r0]
	ldr r2, _0803033C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	b _0803034C
	.align 2, 0
_08030324: .4byte gUnknown_08090CB4
_08030328: .4byte gUnknown_08090CB8
_0803032C: .4byte 0x0000FFFF
_08030330: .4byte 0x00005FFF
_08030334: .4byte 0x00007FFF
_08030338: .4byte gUnknown_03002040
_0803033C: .4byte 0x000003FF
_08030340:
	mov r0, r8
	cmp r0, #0
	beq _0803034A
_08030346:
	movs r0, #0
	b _0803034C
_0803034A:
	ldrh r0, [r7, #6]
_0803034C:
	strh r0, [r4]
_0803034E:
	adds r7, #0x14
	adds r4, #2
	adds r5, #2
	adds r6, #1
	cmp r6, #3
	ble _080302F0
	mov r1, r8
	cmp r1, #0
	beq _08030374
	ldr r0, _08030370 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrb r0, [r1, #0x1b]
	adds r0, #1
	ldrb r2, [r1, #0x1b]
	strb r0, [r1, #0x1b]
	b _0803037E
	.align 2, 0
_08030370: .4byte gUnknown_0849B018
_08030374:
	ldr r0, _080303A8 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldrb r1, [r0, #0x1b]
	mov r2, r8
	strb r2, [r0, #0x1b]
_0803037E:
	mov r4, sp
	ldr r5, _080303AC @ =gUnknown_03002040
	movs r6, #3
_08030384:
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_0801348C
	adds r4, #2
	adds r5, #0x14
	subs r6, #1
	cmp r6, #0
	bge _08030384
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303A8: .4byte gUnknown_0849B018
_080303AC: .4byte gUnknown_03002040

