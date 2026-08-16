	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058A2C
sub_08058A2C: @ 0x08058A2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	movs r5, #1
	ldr r1, _08058AF8 @ =gUnknown_0816D948
	ldr r0, [r1]
	ldr r6, [r0]
	ldr r0, _08058AFC @ =gUnknown_030013D0
	movs r2, #0x12
	ldrsh r7, [r0, r2]
	movs r2, #8
	ldrsh r0, [r0, r2]
	mov sl, r1
	cmp r0, #0
	bne _08058A52
	adds r7, #0x32
_08058A52:
	ldr r0, _08058B00 @ =gUnknown_03004784
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r7, r0
	blt _08058A5E
	b _08058BA0
_08058A5E:
	ldrb r0, [r6]
	cmp r0, #2
	bhi _08058B26
	ldr r0, _08058B04 @ =gUnknown_08499590
	mov r8, r0
	ldr r3, [r0]
	ldrb r1, [r6, #3]
	lsls r1, r1, #1
	ldr r4, _08058B08 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r6, #2]
	adds r2, r1, r0
	ldr r1, _08058B0C @ =0x0000193A
	adds r0, r3, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08058B26
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _08058B10 @ =0x00001432
	adds r3, r3, r1
	adds r1, r3, r2
	ldrb r1, [r1]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058B26
	mov r0, r8
	ldr r2, [r0]
	ldrb r1, [r6, #3]
	lsls r1, r1, #1
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r6, #2]
	adds r0, r0, r1
	ldr r1, _08058B10 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #8
	bne _08058ACA
	movs r5, #0x20
_08058ACA:
	cmp r1, #0xe
	beq _08058AD6
	cmp r1, #0xa
	beq _08058AD6
	cmp r1, #0xb
	bne _08058AD8
_08058AD6:
	lsls r5, r5, #3
_08058AD8:
	ldrb r0, [r6, #5]
	lsrs r4, r0, #3
	ldrb r1, [r6, #4]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08058B14
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	subs r0, #1
	movs r1, #0xa
	bl Div
	adds r1, r4, #1
	adds r0, r1, r0
	b _08058B16
	.align 2, 0
_08058AF8: .4byte gUnknown_0816D948
_08058AFC: .4byte gUnknown_030013D0
_08058B00: .4byte gUnknown_03004784
_08058B04: .4byte gUnknown_08499590
_08058B08: .4byte 0x0000417A
_08058B0C: .4byte 0x0000193A
_08058B10: .4byte 0x00001432
_08058B14:
	adds r0, r4, #0
_08058B16:
	movs r1, #5
	bl __divsi3
	adds r0, #1
	muls r5, r0, r5
	movs r0, #0x64
	muls r5, r0, r5
	b _08058B4C
_08058B26:
	lsls r0, r5, #2
	adds r4, r0, r5
	lsls r5, r4, #1
	ldr r0, _08058B44 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r6]
	bl sub_08042D50
	cmp r0, #1
	bne _08058B48
	lsls r0, r4, #3
	adds r0, r0, r5
	lsls r5, r0, #1
	b _08058B4C
	.align 2, 0
_08058B44: .4byte gUnknown_030033EC
_08058B48:
	lsls r0, r4, #5
	subs r5, r0, r5
_08058B4C:
	mov r2, sl
	ldr r0, [r2]
	movs r1, #0x12
	ldrsh r3, [r0, r1]
	movs r2, #8
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08058B62
	cmp r3, #0x31
	bgt _08058B62
	movs r3, #0x32
_08058B62:
	ldr r2, _08058B7C @ =gUnknown_085D5ABC
	ldrb r1, [r6]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08058B88
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _08058B80
	lsls r5, r5, #1
	b _08058B88
	.align 2, 0
_08058B7C: .4byte gUnknown_085D5ABC
_08058B80:
	ldrb r0, [r6, #7]
	cmp r0, #0
	bne _08058B88
	asrs r5, r5, #3
_08058B88:
	asrs r0, r5, #4
	muls r3, r0, r3
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r7, r0, #1
	subs r0, r3, r7
	mov r1, sb
	str r0, [r1]
	cmp r0, #0
	blt _08058BA0
	movs r0, #0
	b _08058BA4
_08058BA0:
	movs r0, #1
	rsbs r0, r0, #0
_08058BA4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

