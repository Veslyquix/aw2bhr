	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049C38
sub_08049C38: @ 0x08049C38
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r1, #0x24
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08049C7C
	cmp r0, #1
	bgt _08049C4E
	cmp r0, #0
	beq _08049C58
	b _08049CA6
_08049C4E:
	cmp r0, #2
	beq _08049CB4
	cmp r0, #3
	beq _08049D04
	b _08049CA6
_08049C58:
	adds r1, r4, #0
	adds r1, #0x26
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	adds r6, r1, #0
	ldr r7, _08049C78 @ =gUnknown_0812A16C
	cmp r0, #0
	bne _08049D4E
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	ldrh r0, [r4, #0x24]
	adds r0, #1
	b _08049D4C
	.align 2, 0
_08049C78: .4byte gUnknown_0812A16C
_08049C7C:
	adds r2, r4, #0
	adds r2, #0x27
	ldrb r0, [r2]
	cmp r0, #0
	beq _08049CA0
	adds r1, r0, #0
	lsrs r1, r1, #1
	strb r1, [r2]
	subs r2, #1
	ldrb r0, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	adds r6, r2, #0
	ldr r7, _08049C9C @ =gUnknown_0812A16C
	b _08049D4E
	.align 2, 0
_08049C9C: .4byte gUnknown_0812A16C
_08049CA0:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x24]
_08049CA6:
	adds r6, r4, #0
	adds r6, #0x26
	ldr r7, _08049CB0 @ =gUnknown_0812A16C
	b _08049D4E
	.align 2, 0
_08049CB0: .4byte gUnknown_0812A16C
_08049CB4:
	adds r1, r4, #0
	adds r1, #0x26
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	adds r6, r1, #0
	ldr r7, _08049CEC @ =gUnknown_0812A16C
	cmp r0, #0
	bne _08049D4E
	adds r5, r4, #0
	adds r5, #0x28
	ldrb r1, [r5]
	adds r1, #3
	movs r0, #0x50
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x27
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, #9
	bhi _08049CF0
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r4, #0x24]
	subs r0, #1
	b _08049D4C
	.align 2, 0
_08049CEC: .4byte gUnknown_0812A16C
_08049CF0:
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	ldrh r0, [r4, #0x24]
	adds r0, #1
	b _08049D4C
_08049D04:
	ldr r1, _08049D78 @ =gUnknown_0812A16C
	ldr r0, [r1]
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	adds r7, r1, #0
	cmp r0, #0
	bne _08049D2C
	movs r5, #0x22
	ldrsh r0, [r4, r5]
	cmp r0, #3
	bne _08049D2C
	ldr r0, _08049D7C @ =gUnknown_02028E3C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_08049D2C:
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r6, r4, #0
	adds r6, #0x26
	cmp r1, #0
	bne _08049D4E
	adds r0, r4, #0
	adds r0, #0x28
	strb r1, [r0]
	ldrh r0, [r4, #0x24]
	subs r0, #2
_08049D4C:
	strh r0, [r4, #0x24]
_08049D4E:
	movs r1, #0x1e
	ldrsh r0, [r4, r1]
	ldr r1, [r7]
	ldr r1, [r1]
	movs r2, #0x20
	ldrsh r1, [r1, r2]
	ldrb r2, [r6]
	subs r1, r1, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08049D80 @ =gUnknown_0848B698
	movs r5, #0x22
	ldrsh r3, [r4, r5]
	lsls r3, r3, #4
	ldr r4, _08049D84 @ =0x000031CA
	adds r3, r3, r4
	bl sub_0801BD00
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049D78: .4byte gUnknown_0812A16C
_08049D7C: .4byte gUnknown_02028E3C
_08049D80: .4byte gUnknown_0848B698
_08049D84: .4byte 0x000031CA

