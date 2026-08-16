	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080211DC
sub_080211DC: @ 0x080211DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r2, _08021298 @ =gUnknown_0809095C
	ldr r1, [r2]
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r4, r1, r0
	movs r7, #0
	ldrb r3, [r4]
	adds r6, r2, #0
	cmp r3, #0
	beq _0802128A
	ldrb r1, [r4, #1]
	movs r0, #6
	ands r0, r1
	cmp r0, #2
	beq _0802128A
	cmp r3, #2
	bhi _0802123A
	ldr r0, _0802129C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r3, _080212A0 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	ldr r1, _080212A4 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #3
	bne _0802123A
	movs r7, #3
_0802123A:
	ldr r0, [r6]
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	ldrb r1, [r4]
	bl sub_08042D84
	adds r2, r0, #0
	adds r2, r7, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsrs r5, r5, #6
	ldr r3, _080212A8 @ =gUnknown_08499598
	ldr r4, [r3]
	lsls r3, r5, #4
	subs r3, r3, r5
	lsls r3, r3, #2
	adds r3, r3, r4
	adds r3, #0x58
	ldrb r3, [r3]
	mov r6, r8
	lsls r4, r6, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	adds r5, #1
	str r5, [sp, #4]
	bl sub_080210C8
_0802128A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021298: .4byte gUnknown_0809095C
_0802129C: .4byte gUnknown_08499590
_080212A0: .4byte 0x0000417A
_080212A4: .4byte 0x00001432
_080212A8: .4byte gUnknown_08499598

