	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059A0C
sub_08059A0C: @ 0x08059A0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov sl, r4
	movs r7, #0
	ldr r1, _08059AD0 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r7, r0
	bge _08059AB4
	adds r3, r1, #0
_08059A2A:
	movs r5, #0
	ldr r0, [r3]
	adds r1, r7, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r5, r0
	bge _08059AAA
	ldr r1, _08059AD4 @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r2, _08059AD8 @ =gUnknown_085767D5
	mov sb, r2
_08059A44:
	ldr r6, [sp, #4]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08059AA0
	ldr r1, [r3]
	lsls r2, r7, #1
	ldr r6, _08059ADC @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08059AE0 @ =0x00001432
	adds r1, r1, r2
	adds r2, r1, r0
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059AA0
	ldr r0, _08059AE4 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r2]
	str r3, [sp]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	beq _08059AA0
	strb r5, [r4]
	strb r7, [r4, #1]
	ldr r6, [sp, #4]
	ldr r0, [r6]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
	adds r4, #4
_08059AA0:
	adds r5, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r5, r0
	blt _08059A44
_08059AAA:
	mov r7, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _08059A2A
_08059AB4:
	ldr r0, _08059AE8 @ =0x0000FFFF
	strh r0, [r4, #2]
	mov r1, sl
	subs r0, r4, r1
	asrs r0, r0, #2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08059AD0: .4byte gUnknown_08499590
_08059AD4: .4byte gUnknown_03003340
_08059AD8: .4byte gUnknown_085767D5
_08059ADC: .4byte 0x0000417A
_08059AE0: .4byte 0x00001432
_08059AE4: .4byte gUnknown_03003F38
_08059AE8: .4byte 0x0000FFFF

