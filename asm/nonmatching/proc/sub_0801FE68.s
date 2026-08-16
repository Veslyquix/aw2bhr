	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801FE68
sub_0801FE68: @ 0x0801FE68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r5, #0
	ldr r0, _08020010 @ =gUnknown_0809093C
	ldr r2, [r0]
	ldr r1, [r2]
	ldrh r1, [r1, #2]
	cmp r5, r1
	blo _0801FE84
	b _0801FF9E
_0801FE84:
	movs r0, #0x40
	mov sb, r0
_0801FE88:
	movs r4, #0
	ldr r1, _08020014 @ =gUnknown_08499590
	ldr r0, [r1]
	adds r2, r5, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bhs _0801FF8C
	ldr r6, _08020018 @ =gUnknown_03003340
	mov r8, r6
	lsls r0, r5, #2
	mov sl, r0
	add r0, r8
	str r0, [sp]
	adds r7, r1, #0
_0801FEA6:
	ldr r1, [sp]
	ldr r0, [r1]
	adds r3, r0, r4
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _0801FF7E
	cmp r0, #0x40
	beq _0801FF7E
	cmp r0, #0
	beq _0801FED4
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r6, _0802001C @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801FF7E
_0801FED4:
	cmp r4, #0
	beq _0801FEF8
	subs r1, r3, #1
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x40
	beq _0801FEF8
	adds r0, r2, #1
	strb r0, [r1]
	ldr r0, [sp]
	ldr r1, [r0]
	adds r1, r4, r1
	subs r1, #1
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_0801FEF8:
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	beq _0801FF24
	mov r1, sl
	add r1, r8
	ldr r0, [r1]
	adds r2, r4, r0
	ldrb r3, [r2, #1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r0, #0x40
	beq _0801FF24
	adds r0, r3, #1
	strb r0, [r2, #1]
	ldr r1, [r1]
	adds r1, r4, r1
	ldrb r0, [r1, #1]
	mov r6, sb
	orrs r0, r6
	strb r0, [r1, #1]
_0801FF24:
	cmp r5, #0
	beq _0801FF4E
	subs r0, r5, #1
	lsls r0, r0, #2
	mov r2, r8
	adds r1, r0, r2
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x40
	beq _0801FF4E
	adds r0, r3, #1
	strb r0, [r2]
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r0, [r1]
	mov r6, sb
	orrs r0, r6
	strb r0, [r1]
_0801FF4E:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	beq _0801FF7E
	mov r1, ip
	lsls r0, r1, #2
	mov r2, r8
	adds r1, r0, r2
	ldr r0, [r1]
	adds r2, r0, r4
	ldrb r3, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x40
	beq _0801FF7E
	adds r0, r3, #1
	strb r0, [r2]
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r0, [r1]
	mov r6, sb
	orrs r0, r6
	strb r0, [r1]
_0801FF7E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r4, r0
	blo _0801FEA6
_0801FF8C:
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	ldr r2, _08020014 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bhs _0801FF9E
	b _0801FE88
_0801FF9E:
	movs r5, #0
	ldr r1, _08020014 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r5, r0
	bhs _0801FFFE
	mov r8, r1
	ldr r6, _08020018 @ =gUnknown_03003340
	mov sb, r6
_0801FFB0:
	movs r4, #0
	mov r1, r8
	ldr r0, [r1]
	adds r2, r5, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bhs _0801FFEE
	lsls r0, r5, #2
	mov r6, sb
	adds r2, r0, r6
	ldr r6, _08020014 @ =gUnknown_08499590
	movs r7, #0x40
	movs r0, #1
	rsbs r0, r0, #0
	adds r5, r0, #0
_0801FFD0:
	ldr r0, [r2]
	adds r3, r0, r4
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0801FFE0
	strb r5, [r3]
_0801FFE0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r4, r0
	blo _0801FFD0
_0801FFEE:
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _0801FFB0
_0801FFFE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020010: .4byte gUnknown_0809093C
_08020014: .4byte gUnknown_08499590
_08020018: .4byte gUnknown_03003340
_0802001C: .4byte 0x0000417A

