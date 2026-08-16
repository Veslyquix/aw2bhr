	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086A58
sub_08086A58: @ 0x08086A58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r7, r1, #0
	mov sb, r2
	bl sub_08013C00
	ldr r0, _08086AC8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08086B18
	cmp r7, #0
	ble _08086B06
	ldr r0, _08086ACC @ =gUnknown_02027F74
	movs r1, #0
	mov r8, r1
	adds r0, #4
	mov r3, sl
	adds r4, r3, r0
	adds r6, r7, #0
_08086A88:
	ldrb r0, [r4]
	bl sub_0803CB24
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08086A98
	movs r5, #0
_08086A98:
	ldrb r0, [r4]
	cmp r0, #0xb3
	bhi _08086AD8
	bl sub_0803CA54
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08086AD8
	mov r1, sb
	adds r1, #5
	add r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086AD0 @ =gUnknown_08499578
	ldr r2, [r0]
	str r3, [sp]
	str r5, [sp, #4]
	movs r0, #1
	ldr r3, _08086AD4 @ =gUnknown_084C3F50
	bl sub_080149C0
	b _08086AFA
	.align 2, 0
_08086AC8: .4byte gUnknown_03003FC0
_08086ACC: .4byte gUnknown_02027F74
_08086AD0: .4byte gUnknown_08499578
_08086AD4: .4byte gUnknown_084C3F50
_08086AD8:
	ldrb r0, [r4]
	bl sub_08024944
	adds r3, r0, #0
	mov r1, sb
	adds r1, #5
	add r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086B14 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #1
	bl sub_080149C0
_08086AFA:
	movs r0, #2
	add r8, r0
	adds r4, #1
	subs r6, #1
	cmp r6, #0
	bne _08086A88
_08086B06:
	mov r0, sl
	adds r1, r7, #0
	mov r2, sb
	bl sub_08087548
	b _08086BDE
	.align 2, 0
_08086B14: .4byte gUnknown_08499578
_08086B18:
	ldr r4, _08086B98 @ =gUnknown_081D9438
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r1, _08086B9C @ =gUnknown_08499CE4
	ldr r0, _08086BA0 @ =gUnknown_0300596C
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	bl sub_08014A5C
	ldr r0, _08086BA4 @ =gUnknown_02027F74
	adds r1, r0, #0
	adds r1, #0x37
	ldrb r1, [r1]
	cmp r1, r7
	bge _08086B48
	adds r7, r1, #1
_08086B48:
	cmp r7, #0
	ble _08086BDE
	movs r1, #0
	mov r8, r1
	adds r0, #4
	mov r3, sl
	adds r4, r3, r0
	adds r6, r7, #0
_08086B58:
	ldrb r0, [r4]
	bl sub_0803CB24
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08086B68
	movs r5, #0
_08086B68:
	ldrb r0, [r4]
	cmp r0, #0xb3
	bhi _08086BB0
	bl sub_0803CA54
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08086BB0
	mov r1, sb
	adds r1, #9
	add r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086BA8 @ =gUnknown_08499578
	ldr r2, [r0]
	str r3, [sp]
	str r5, [sp, #4]
	movs r0, #1
	ldr r3, _08086BAC @ =gUnknown_084C3F50
	bl sub_080149C0
	b _08086BD2
	.align 2, 0
_08086B98: .4byte gUnknown_081D9438
_08086B9C: .4byte gUnknown_08499CE4
_08086BA0: .4byte gUnknown_0300596C
_08086BA4: .4byte gUnknown_02027F74
_08086BA8: .4byte gUnknown_08499578
_08086BAC: .4byte gUnknown_084C3F50
_08086BB0:
	ldrb r0, [r4]
	bl sub_08024944
	adds r3, r0, #0
	mov r1, sb
	adds r1, #9
	add r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _08086BF4 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #1
	bl sub_080149C0
_08086BD2:
	movs r0, #2
	add r8, r0
	adds r4, #1
	subs r6, #1
	cmp r6, #0
	bne _08086B58
_08086BDE:
	bl sub_08013AEC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086BF4: .4byte gUnknown_08499578

