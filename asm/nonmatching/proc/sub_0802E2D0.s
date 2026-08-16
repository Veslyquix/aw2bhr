	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E2D0
sub_0802E2D0: @ 0x0802E2D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r5, r7, #0x10
	asrs r0, r5, #0x10
	lsls r4, r6, #0x10
	asrs r1, r4, #0x10
	bl sub_0803DE94
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E320
	ldr r0, _0802E318 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r0, _0802E31C @ =0x00002852
	adds r1, r1, r0
	adds r0, r2, #0
	movs r2, #0xff
	movs r3, #0
	bl sub_0803E9F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802E320
	bl sub_08024404
	mov r8, r5
	adds r7, r4, #0
	b _0802E474
	.align 2, 0
_0802E318: .4byte gUnknown_08499590
_0802E31C: .4byte 0x00002852
_0802E320:
	ldr r1, _0802E378 @ =gUnknown_08090C30
	mov sl, r1
	ldr r1, [r1]
	ldr r0, _0802E37C @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r6, r6, #0x10
	mov sb, r6
	asrs r0, r6, #0xf
	ldr r4, _0802E380 @ =0x0000417A
	adds r3, r2, r4
	adds r3, r3, r0
	ldrh r0, [r3]
	lsls r7, r7, #0x10
	mov r8, r7
	mov r4, r8
	asrs r5, r4, #0x10
	adds r0, r0, r5
	adds r2, #0x12
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r6, _0802E384 @ =gUnknown_08090C34
	ldr r4, _0802E388 @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r1, r1, r0
	ldr r0, _0802E38C @ =gUnknown_030040D8
	str r1, [r0]
	ldrh r0, [r3]
	adds r0, r0, r5
	adds r2, r2, r0
	ldrb r0, [r2]
	mov r7, sb
	mov r5, sl
	adds r4, r6, #0
	cmp r0, #0
	bne _0802E390
	bl sub_0802E2BC
	b _0802E48C
	.align 2, 0
_0802E378: .4byte gUnknown_08090C30
_0802E37C: .4byte gUnknown_08499590
_0802E380: .4byte 0x0000417A
_0802E384: .4byte gUnknown_08090C34
_0802E388: .4byte gUnknown_08499594
_0802E38C: .4byte gUnknown_030040D8
_0802E390:
	adds r0, r1, #0
	bl sub_08041FE0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _0802E3BC @ =gUnknown_030040D8
	ldr r0, [r1]
	bl sub_0804203C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r6, #0
	bne _0802E3C0
	cmp r0, #0
	bne _0802E3C0
	movs r0, #0x68
	bl sub_0803B4DC
	movs r0, #0
	b _0802E48E
	.align 2, 0
_0802E3BC: .4byte gUnknown_030040D8
_0802E3C0:
	ldr r0, _0802E49C @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _0802E4A0 @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	ldr r4, [r4]
	mov sb, r4
	ldr r0, [r4]
	bl sub_08035584
	bl sub_08024404
	bl sub_080258CC
	cmp r6, #0
	beq _0802E420
	ldr r4, _0802E4A4 @ =gUnknown_03004480
	ldr r0, [r5]
	ldrb r0, [r0]
	lsrs r0, r0, #6
	adds r0, #1
	strh r0, [r4]
	mov r3, sb
	ldr r0, [r3]
	bl sub_080202A4
	ldr r0, _0802E4A8 @ =gUnknown_030033EC
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, _0802E4AC @ =gUnknown_03003340
	asrs r4, r7, #0xe
	adds r4, r4, r0
	mov r0, r8
	asrs r5, r0, #0x10
	ldr r0, [r4]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x40
	bl sub_0801FE68
	ldr r0, [r4]
	adds r0, r0, r5
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r0]
_0802E420:
	mov r3, sl
	cmp r3, #0
	beq _0802E474
	cmp r6, #0
	bne _0802E430
	movs r0, #0xff
	bl sub_0801F838
_0802E430:
	mov r4, sb
	ldr r2, [r4]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	bl sub_080201E0
	cmp r6, #0
	beq _0802E474
	ldr r5, _0802E4AC @ =gUnknown_03003340
	asrs r1, r7, #0x10
	lsls r2, r1, #2
	adds r2, r2, r5
	mov r0, r8
	asrs r4, r0, #0x10
	ldr r0, [r2]
	adds r0, r4, r0
	subs r0, #1
	movs r3, #0
	strb r3, [r0]
	ldr r0, [r2]
	adds r0, r4, r0
	strb r3, [r0, #1]
	subs r0, r1, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r0, [r1]
	adds r0, r0, r4
	strb r3, [r0]
_0802E474:
	mov r1, r8
	lsrs r0, r1, #0x10
	lsrs r1, r7, #0x10
	movs r2, #1
	bl sub_08022990
	ldr r1, _0802E4B0 @ =gUnknown_03003334
	movs r0, #6
	strh r0, [r1]
	movs r0, #0x69
	bl sub_0803B4DC
_0802E48C:
	movs r0, #1
_0802E48E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802E49C: .4byte gUnknown_08499590
_0802E4A0: .4byte 0x00002852
_0802E4A4: .4byte gUnknown_03004480
_0802E4A8: .4byte gUnknown_030033EC
_0802E4AC: .4byte gUnknown_03003340
_0802E4B0: .4byte gUnknown_03003334

