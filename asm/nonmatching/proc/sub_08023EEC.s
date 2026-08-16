	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023EEC
sub_08023EEC: @ 0x08023EEC
	push {r4, r5, r6, r7, lr}
	ldr r2, _08023F58 @ =gUnknown_08090A1C
	ldr r0, [r2]
	ldr r4, [r0]
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #8]
	lsls r3, r0, #0x10
	asrs r6, r3, #0x10
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	adds r7, r2, #0
	cmp r6, r5
	bge _08023F0E
	asrs r1, r3, #0x14
	asrs r0, r0, #0x14
	cmp r1, r0
	bne _08023F20
_08023F0E:
	cmp r6, r5
	ble _08023F9A
	asrs r1, r3, #0x14
	movs r2, #8
	ldrsh r0, [r4, r2]
	subs r0, #1
	asrs r0, r0, #4
	cmp r1, r0
	beq _08023F9A
_08023F20:
	ldr r0, [r7]
	ldr r4, [r0]
	ldrh r0, [r4, #4]
	lsls r2, r0, #0x10
	asrs r1, r2, #0x10
	movs r3, #8
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _08023F5C
	asrs r2, r2, #0x14
	ldrh r0, [r4, #0xc]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	ldrh r1, [r4, #0xe]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_08023DCC
	b _08023F82
	.align 2, 0
_08023F58: .4byte gUnknown_08090A1C
_08023F5C:
	asrs r2, r2, #0x14
	adds r2, #0xf
	ldrh r0, [r4, #0xc]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	ldrh r1, [r4, #0xe]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_08023E14
_08023F82:
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _08024000 @ =gUnknown_03000559
	ldrb r0, [r0]
	cmp r0, #1
	bne _08023F9A
	bl sub_08013AEC
_08023F9A:
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3, #6]
	ldrh r1, [r3, #0xa]
	lsls r2, r0, #0x10
	asrs r5, r2, #0x10
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r5, r4
	bge _08023FB6
	asrs r1, r2, #0x14
	asrs r0, r0, #0x14
	cmp r1, r0
	bne _08023FC8
_08023FB6:
	cmp r5, r4
	ble _08024042
	asrs r1, r2, #0x14
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	subs r0, #1
	asrs r0, r0, #4
	cmp r1, r0
	beq _08024042
_08023FC8:
	ldr r0, [r7]
	ldr r4, [r0]
	ldrh r0, [r4, #6]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _08024004
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	ldrh r0, [r4, #0xc]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r3, r3, #0x14
	ldrh r1, [r4, #0xe]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_08023E5C
	b _0802402A
	.align 2, 0
_08024000: .4byte gUnknown_03000559
_08024004:
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	ldrh r0, [r4, #0xc]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r3, r3, #0x14
	adds r3, #0xa
	ldrh r1, [r4, #0xe]
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_08023EA4
_0802402A:
	bl sub_08013AFC
	bl sub_08013B0C
	bl sub_08013B1C
	ldr r0, _08024054 @ =gUnknown_03000559
	ldrb r0, [r0]
	cmp r0, #1
	bne _08024042
	bl sub_08013AEC
_08024042:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	strh r1, [r0, #8]
	ldrh r1, [r0, #6]
	strh r1, [r0, #0xa]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024054: .4byte gUnknown_03000559

