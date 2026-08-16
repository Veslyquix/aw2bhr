	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084C14
sub_08084C14: @ 0x08084C14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08084C32
	adds r0, r7, #0
	bl sub_080852A8
	movs r0, #0
	strh r0, [r4]
_08084C32:
	ldr r1, _08084C48 @ =gUnknown_081D93EC
	ldr r0, [r1]
	ldr r0, [r0]
	adds r6, r1, #0
	cmp r0, #4
	bhi _08084C64
	lsls r0, r0, #2
	ldr r1, _08084C4C @ =_08084C50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084C48: .4byte gUnknown_081D93EC
_08084C4C: .4byte _08084C50
_08084C50: @ jump table
	.4byte _08084C64 @ case 0
	.4byte _08084C64 @ case 1
	.4byte _08084C6C @ case 2
	.4byte _08084C74 @ case 3
	.4byte _08084C7C @ case 4
_08084C64:
	adds r0, r7, #0
	bl sub_08085168
	b _08084C82
_08084C6C:
	adds r0, r7, #0
	bl sub_080851CC
	b _08084C82
_08084C74:
	adds r0, r7, #0
	bl sub_08085208
	b _08084C82
_08084C7C:
	adds r0, r7, #0
	bl sub_08085244
_08084C82:
	adds r0, r7, #0
	bl sub_08085044
	adds r0, r7, #0
	bl sub_08084F44
	bl sub_080116A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084C9A
	b _08084F3A
_08084C9A:
	ldr r4, _08084CEC @ =gUnknown_081D93F0
	ldr r0, [r4]
	bl Proc_Find
	cmp r0, #0
	beq _08084CA8
	b _08084F3A
_08084CA8:
	ldr r2, _08084CF0 @ =gUnknown_081D93F4
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084CF4
	adds r0, r7, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _08084CF4
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #0
	bgt _08084CCE
	b _08084F3A
_08084CCE:
	subs r0, #1
	str r0, [r1]
	cmp r0, #3
	bne _08084CDA
	bl sub_080858C0
_08084CDA:
	adds r0, r7, #0
	bl sub_08085298
	adds r1, r7, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	b _08084EB0
	.align 2, 0
_08084CEC: .4byte gUnknown_081D93F0
_08084CF0: .4byte gUnknown_081D93F4
_08084CF4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08084D34
	adds r0, r7, #0
	adds r0, #0x4e
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, #0
	blt _08084D34
	ldr r1, [r6]
	ldr r0, [r1]
	cmp r0, #3
	ble _08084D18
	b _08084F3A
_08084D18:
	adds r0, #1
	str r0, [r1]
	cmp r0, #4
	bne _08084D24
	bl sub_08085908
_08084D24:
	adds r0, r7, #0
	bl sub_08085298
	adds r1, r7, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	b _08084EB0
_08084D34:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08084DD8
	adds r0, r7, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r5, r0, #0
	cmp r1, #0
	bne _08084DD8
	adds r0, #0x18
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, r0, #0
	cmp r1, #1
	bne _08084D7E
	ldr r1, _08084D70 @ =gUnknown_03003FC0
	ldrb r0, [r1, #1]
	cmp r0, #2
	bne _08084D74
	ldrb r0, [r1, #2]
	bl sub_0802490C
	b _08084D78
	.align 2, 0
_08084D70: .4byte gUnknown_03003FC0
_08084D74:
	bl sub_080248F8
_08084D78:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08084D80
_08084D7E:
	subs r0, r2, #1
_08084D80:
	strh r0, [r6]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	movs r0, #1
	mov r8, r0
	mov r1, r8
	strh r1, [r5]
	movs r3, #0
	ldrsh r1, [r6, r3]
	ldr r4, _08084DCC @ =gUnknown_08499598
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xab
	lsls r1, r1, #2
	bl sub_08043B14
	movs r5, #0
	ldrsh r1, [r6, r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	ldr r1, _08084DD0 @ =0x06015700
	movs r2, #0x16
	bl sub_08043FA8
	ldr r3, _08084DD4 @ =gUnknown_08616B1C
	movs r0, #0
	ldrsh r1, [r6, r0]
	b _08084E7A
	.align 2, 0
_08084DCC: .4byte gUnknown_08499598
_08084DD0: .4byte 0x06015700
_08084DD4: .4byte gUnknown_08616B1C
_08084DD8:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08084EC4
	adds r0, r7, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r5, r0, #0
	cmp r1, #0
	bne _08084EC4
	adds r1, r7, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r4, [r1, r0]
	ldr r2, _08084E18 @ =gUnknown_03003FC0
	ldrb r0, [r2, #1]
	adds r6, r1, #0
	cmp r0, #2
	bne _08084E1C
	ldrb r0, [r2, #2]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	beq _08084E28
	b _08084E2C
	.align 2, 0
_08084E18: .4byte gUnknown_03003FC0
_08084E1C:
	bl sub_080248F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08084E2C
_08084E28:
	movs r0, #1
	b _08084E30
_08084E2C:
	ldrh r0, [r6]
	adds r0, #1
_08084E30:
	strh r0, [r6]
	adds r1, r7, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	movs r1, #1
	mov r8, r1
	mov r3, r8
	strh r3, [r5]
	movs r5, #0
	ldrsh r1, [r6, r5]
	ldr r4, _08084EB8 @ =gUnknown_08499598
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xab
	lsls r1, r1, #2
	bl sub_08043B14
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	ldr r1, _08084EBC @ =0x06015700
	movs r2, #0x16
	bl sub_08043FA8
	ldr r3, _08084EC0 @ =gUnknown_08616B1C
	movs r5, #0
	ldrsh r1, [r6, r5]
_08084E7A:
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0
	bl sub_0802D5CC
	movs r1, #0
	ldrsh r0, [r6, r1]
	bl sub_08043834
	movs r3, #0
	ldrsh r1, [r6, r3]
	movs r0, #0
	bl sub_08085950
	adds r0, r7, #0
	bl sub_08085298
	adds r0, r7, #0
	adds r0, #0x64
	mov r5, r8
	strh r5, [r0]
_08084EB0:
	movs r0, #0x64
	bl sub_0803B4DC
	b _08084F3A
	.align 2, 0
_08084EB8: .4byte gUnknown_08499598
_08084EBC: .4byte 0x06015700
_08084EC0: .4byte gUnknown_08616B1C
_08084EC4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08084F08
	adds r1, r7, #0
	adds r1, #0x4e
	ldrh r3, [r1]
	movs r5, #0
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bne _08084F08
	ldr r0, _08084EFC @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, _08084F00 @ =gUnknown_08616BFC
	adds r1, r7, #0
	bl Proc_Start
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _08084F04 @ =sub_08043590
	bl sub_08011B5C
	b _08084F3A
	.align 2, 0
_08084EFC: .4byte 0x0000FFFF
_08084F00: .4byte gUnknown_08616BFC
_08084F04: .4byte sub_08043590
_08084F08:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084F3A
	adds r0, r7, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08084F3A
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #4
	bne _08084F3A
	movs r0, #0x76
	bl sub_0803B4DC
	ldr r0, [r4]
	adds r1, r7, #0
	bl Proc_Start
_08084F3A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

