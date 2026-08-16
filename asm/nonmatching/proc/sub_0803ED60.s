	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ED60
sub_0803ED60: @ 0x0803ED60
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_0803E554
	ldr r3, [r5, #0x2c]
	ldrh r1, [r3, #2]
	b _0803EEB6
_0803ED70:
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	subs r0, #1
	ldr r2, [r5, #0x2c]
	cmp r0, #4
	bls _0803ED80
	b _0803EEAC
_0803ED80:
	lsls r0, r0, #2
	ldr r1, _0803ED8C @ =_0803ED90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803ED8C: .4byte _0803ED90
_0803ED90: @ jump table
	.4byte _0803EDA4 @ case 0
	.4byte _0803EE08 @ case 1
	.4byte _0803EE4C @ case 2
	.4byte _0803EE4C @ case 3
	.4byte _0803EDD4 @ case 4
_0803EDA4:
	ldr r0, [r5, #0x2c]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803EDB2
	b _0803EEAC
_0803EDB2:
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrh r3, [r2, #2]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x1c
	movs r2, #0
	bl sub_0803E560
	ldr r2, [r5, #0x2c]
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrb r2, [r2, #7]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_0803E594
	b _0803EE9C
_0803EDD4:
	ldr r0, [r5, #0x2c]
	ldrb r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803EEAC
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0803EEAC
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrh r3, [r2, #2]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x1c
	movs r2, #0
	bl sub_0803E560
	ldr r2, [r5, #0x2c]
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrb r2, [r2, #7]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_0803E6C4
	b _0803EE9C
_0803EE08:
	ldr r0, [r5, #0x2c]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _0803EEAC
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrh r3, [r2, #2]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x1c
	movs r2, #0
	bl sub_0803E560
	ldr r2, _0803EE44 @ =gUnknown_0849F728
	ldr r0, _0803EE48 @ =gUnknown_03004080
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	ldrb r1, [r1, #7]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_0803E764
	b _0803EE9C
	.align 2, 0
_0803EE44: .4byte gUnknown_0849F728
_0803EE48: .4byte gUnknown_03004080
_0803EE4C:
	ldr r0, _0803EEA4 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _0803EEA8 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	ldr r2, [r5, #0x2c]
	cmp r0, #5
	bne _0803EEAC
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _0803EEAC
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _0803EEAC
	ldrb r0, [r2]
	ldrb r1, [r2, #1]
	ldrh r3, [r2, #2]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x1c
	movs r2, #0
	bl sub_0803E560
	ldr r4, [r5, #0x2c]
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrh r3, [r4, #2]
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x1c
	ldrb r4, [r4, #3]
	lsrs r4, r4, #6
	str r4, [sp]
	bl sub_0803E808
_0803EE9C:
	ldr r0, [r5, #0x2c]
	adds r0, #8
	str r0, [r5, #0x2c]
	b _0803EECA
	.align 2, 0
_0803EEA4: .4byte gUnknown_030033EC
_0803EEA8: .4byte gUnknown_08499598
_0803EEAC:
	adds r0, r2, #0
	adds r0, #8
	str r0, [r5, #0x2c]
	adds r3, r0, #0
	ldrh r1, [r2, #0xa]
_0803EEB6:
	movs r0, #0xf0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803EEC2
	b _0803ED70
_0803EEC2:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0803EECA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

