	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062560
sub_08062560: @ 0x08062560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	ldr r1, _0806258C @ =gUnknown_0816DB34
	ldr r0, [r1]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r0]
	ldr r0, [sp, #4]
	subs r0, #1
	lsls r6, r0, #6
	adds r0, r6, #0
	b _08062700
	.align 2, 0
_0806258C: .4byte gUnknown_0816DB34
_08062590:
	ldr r1, _0806264C @ =gUnknown_08499594
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r5, r1, r0
	ldrb r0, [r5]
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #0xc]
	adds r7, r6, #1
	mov sb, r7
	cmp r0, #0
	bne _080625AE
	b _080626FA
_080625AE:
	ldr r2, _08062650 @ =gUnknown_085D5ABC
	ldrb r1, [r5]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1c]
	ldr r1, [sp, #8]
	ands r0, r1
	cmp r0, #0
	bne _080625C4
	b _080626FA
_080625C4:
	ldrb r1, [r5, #1]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _080625D4
	b _080626FA
_080625D4:
	ldr r0, _08062654 @ =gUnknown_030040D8
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_08062730
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080625E6
	b _080626FA
_080625E6:
	ldrb r0, [r5]
	cmp r0, #0x18
	bne _080625FC
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl sub_080257C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080625FC
	b _080626FA
_080625FC:
	ldr r0, _08062658 @ =gUnknown_03004480
	ldrb r0, [r0]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl sub_08020DBC
	lsls r0, r0, #0x18
	ldr r2, [sp, #4]
	subs r2, #1
	str r2, [sp, #0xc]
	adds r3, r6, #1
	mov sb, r3
	cmp r0, #0
	beq _080626FA
	ldr r4, _0806265C @ =gUnknown_030033EC
	ldrh r0, [r4]
	ldrb r1, [r5]
	bl sub_08042D50
	cmp r0, #1
	bne _08062664
	ldrh r0, [r4]
	ldrb r1, [r5]
	bl sub_08042D1C
	adds r3, r0, #0
	ldrb r0, [r5, #2]
	ldrb r1, [r5, #3]
	ldrb r2, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp]
	ldr r7, _08062660 @ =gUnknown_030013EC
	ldr r4, [r7]
	bl _call_via_r4
	movs r0, #0x79
	bl sub_0801FD9C
	b _0806267E
	.align 2, 0
_0806264C: .4byte gUnknown_08499594
_08062650: .4byte gUnknown_085D5ABC
_08062654: .4byte gUnknown_030040D8
_08062658: .4byte gUnknown_03004480
_0806265C: .4byte gUnknown_030033EC
_08062660: .4byte gUnknown_030013EC
_08062664:
	ldrh r0, [r4]
	ldrb r1, [r5]
	bl sub_08042D50
	adds r3, r0, #0
	ldrb r0, [r5, #2]
	ldrb r1, [r5, #3]
	str r7, [sp]
	ldr r2, _08062718 @ =gUnknown_030013EC
	ldr r4, [r2]
	movs r2, #0x10
	bl _call_via_r4
_0806267E:
	movs r1, #0
	ldr r2, _0806271C @ =gUnknown_08499590
	ldr r0, [r2]
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #0xc]
	adds r6, #1
	mov sb, r6
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _080626FA
	mov r8, r2
_08062696:
	movs r3, #0
	mov r7, r8
	ldr r0, [r7]
	adds r2, r1, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r3, r0
	bge _080626EE
	lsls r0, r1, #2
	ldr r2, _08062720 @ =gUnknown_03003340
	adds r7, r0, r2
	ldr r4, _0806271C @ =gUnknown_08499590
	ldr r0, _08062724 @ =gUnknown_085D5ABC
	mov sl, r0
	lsls r6, r1, #1
_080626B4:
	ldr r0, [r7]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080626E4
	ldr r2, [r4]
	ldr r1, _08062728 @ =0x0000417A
	adds r0, r2, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r1, _0806272C @ =0x00003262
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r5]
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, sl
	ldrb r1, [r2]
	ldrb r0, [r0, #0x1c]
	orrs r1, r0
	strb r1, [r2]
_080626E4:
	adds r3, #1
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r3, r0
	blt _080626B4
_080626EE:
	mov r1, ip
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _08062696
_080626FA:
	mov r6, sb
	ldr r3, [sp, #0xc]
	lsls r0, r3, #6
_08062700:
	adds r0, #0x40
	cmp r6, r0
	bge _08062708
	b _08062590
_08062708:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062718: .4byte gUnknown_030013EC
_0806271C: .4byte gUnknown_08499590
_08062720: .4byte gUnknown_03003340
_08062724: .4byte gUnknown_085D5ABC
_08062728: .4byte 0x0000417A
_0806272C: .4byte 0x00003262

