	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029DF8
sub_08029DF8: @ 0x08029DF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08029E70 @ =gUnknown_0849A0A8
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08029E18
	b _08029FB4
_08029E18:
	ldr r0, _08029E74 @ =gUnknown_08499594
	mov sb, r0
_08029E1C:
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r0, #3
	ble _08029E8C
	movs r3, #0x20
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _08029E38
	ldr r2, _08029E78 @ =gUnknown_030033E4
	ldr r1, _08029E7C @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
_08029E38:
	ldr r0, _08029E80 @ =gUnknown_03001FBC
	movs r4, #0
	ldrsh r0, [r0, r4]
	bl sub_08015328
	bl sub_080424FC
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _08029E66
	ldr r0, _08029E84 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029E66
	ldr r0, _08029E88 @ =gUnknown_03003F38
	ldrb r1, [r0]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_08034534
_08029E66:
	bl sub_08034F48
	bl sub_08034F8C
	b _08029FB4
	.align 2, 0
_08029E70: .4byte gUnknown_0849A0A8
_08029E74: .4byte gUnknown_08499594
_08029E78: .4byte gUnknown_030033E4
_08029E7C: .4byte gUnknown_03003100
_08029E80: .4byte gUnknown_03001FBC
_08029E84: .4byte gUnknown_03003FC0
_08029E88: .4byte gUnknown_03003F38
_08029E8C:
	ldr r2, _08029F1C @ =gUnknown_03003F40
	ldr r6, _08029F20 @ =gUnknown_0849A0D8
	movs r3, #0x1e
	ldrsh r1, [r5, r3]
	lsls r0, r1, #1
	adds r4, r0, r1
	lsls r0, r4, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08029EAA
	b _08029FAC
_08029EAA:
	ldr r0, _08029F24 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r7, _08029F28 @ =gUnknown_03003100
	adds r0, r4, #2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldrh r3, [r7, #2]
	adds r0, r0, r3
	lsls r0, r0, #1
	ldr r1, _08029F2C @ =0x0000417A
	adds r3, r2, r1
	adds r0, r3, r0
	ldrh r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r4, #0
	ldrsh r0, [r0, r4]
	ldrh r4, [r7]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r4, _08029F30 @ =0x0000051A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r4, sb
	ldr r1, [r4]
	adds r4, r1, r0
	ldrb r1, [r4, #3]
	lsls r0, r1, #1
	adds r3, r3, r0
	ldrh r0, [r3]
	ldrb r3, [r4, #2]
	adds r0, r0, r3
	mov r8, r0
	ldr r0, _08029F34 @ =0x0000234A
	adds r2, r2, r0
	add r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _08029F12
	adds r0, r3, #0
	bl sub_08029DBC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029F38
_08029F12:
	adds r0, r4, #0
	bl sub_08029D1C
	b _08029FAC
	.align 2, 0
_08029F1C: .4byte gUnknown_03003F40
_08029F20: .4byte gUnknown_0849A0D8
_08029F24: .4byte gUnknown_08499590
_08029F28: .4byte gUnknown_03003100
_08029F2C: .4byte 0x0000417A
_08029F30: .4byte 0x0000051A
_08029F34: .4byte 0x0000234A
_08029F38:
	ldr r1, _08029FA0 @ =gUnknown_030033EC
	mov r8, r1
	adds r0, r4, #0
	bl sub_08029D1C
	adds r3, r0, #0
	cmp r3, #0
	beq _08029FAC
	movs r4, #0x1e
	ldrsh r1, [r5, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldrh r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _08029FA4 @ =0xFFFF0000
	ldr r2, [sp]
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	movs r4, #0x1e
	ldrsh r1, [r5, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	ldrh r7, [r7, #2]
	adds r1, r1, r7
	lsls r1, r1, #0x10
	ldr r0, _08029FA8 @ =0x0000FFFF
	ands r2, r0
	orrs r2, r1
	str r2, [sp]
	mov r0, r8
	ldrb r1, [r0]
	mov r0, sp
	adds r2, r3, #0
	movs r3, #0
	bl sub_08029CB8
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	b _08029FB4
	.align 2, 0
_08029FA0: .4byte gUnknown_030033EC
_08029FA4: .4byte 0xFFFF0000
_08029FA8: .4byte 0x0000FFFF
_08029FAC:
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	b _08029E1C
_08029FB4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

