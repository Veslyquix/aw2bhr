	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E4B4
sub_0802E4B4: @ 0x0802E4B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	bl sub_0801B780
	ldr r1, _0802E53C @ =gUnknown_030040DC
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0802E540 @ =gUnknown_030033E8
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	ldr r1, _0802E544 @ =gUnknown_03000558
	strb r0, [r1]
	ldr r0, _0802E548 @ =gUnknown_03003F38
	mov r8, r0
	ldr r1, _0802E54C @ =gUnknown_08499590
	mov sb, r1
	ldr r1, [r1]
	lsls r4, r4, #0x10
	str r4, [sp]
	asrs r6, r4, #0x10
	lsls r7, r6, #1
	ldr r2, _0802E550 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r5, r5, #0x10
	mov sl, r5
	asrs r4, r5, #0x10
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	ldr r5, _0802E554 @ =gUnknown_030040D8
	ldr r2, _0802E558 @ =gUnknown_08499594
	ldrb r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080242B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802E55C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0802D5E8
	b _0802E5E6
	.align 2, 0
_0802E53C: .4byte gUnknown_030040DC
_0802E540: .4byte gUnknown_030033E8
_0802E544: .4byte gUnknown_03000558
_0802E548: .4byte gUnknown_03003F38
_0802E54C: .4byte gUnknown_08499590
_0802E550: .4byte 0x0000417A
_0802E554: .4byte gUnknown_030040D8
_0802E558: .4byte gUnknown_08499594
_0802E55C:
	mov r2, sb
	ldr r1, [r2]
	ldr r2, _0802E588 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802E582
	ldr r2, [r5]
	ldrb r1, [r2, #1]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0802E58C
_0802E582:
	bl sub_0802D458
	b _0802E5E6
	.align 2, 0
_0802E588: .4byte 0x0000417A
_0802E58C:
	adds r0, r2, #0
	bl sub_08074320
	ldr r1, _0802E5F8 @ =gUnknown_03003110
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r5]
	bl sub_08035584
	bl sub_08024454
	bl sub_080258CC
	ldr r4, _0802E5FC @ =gUnknown_03004480
	mov r1, r8
	ldrb r0, [r1]
	lsrs r0, r0, #6
	adds r0, #1
	strh r0, [r4]
	mov r2, sb
	ldr r0, [r2]
	ldr r1, _0802E600 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r0, [r5]
	bl sub_080202A4
	ldr r0, _0802E604 @ =gUnknown_030033EC
	ldrh r0, [r0]
	strh r0, [r4]
	mov r2, sl
	lsrs r0, r2, #0x10
	ldr r2, [sp]
	lsrs r1, r2, #0x10
	movs r2, #0
	bl sub_08022990
	ldr r0, _0802E608 @ =gUnknown_03003334
	strh r6, [r0]
	bl sub_08038C98
	movs r0, #0x69
	bl sub_0803B4DC
_0802E5E6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E5F8: .4byte gUnknown_03003110
_0802E5FC: .4byte gUnknown_03004480
_0802E600: .4byte 0x00002852
_0802E604: .4byte gUnknown_030033EC
_0802E608: .4byte gUnknown_03003334

