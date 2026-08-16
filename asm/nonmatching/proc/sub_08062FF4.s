	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062FF4
sub_08062FF4: @ 0x08062FF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_08063518
	cmp r0, #0
	beq _0806300A
	b _080633D2
_0806300A:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0806301E
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _080633D2
_0806301E:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _08063048
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08063044 @ =0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _08063048
	adds r0, r7, #0
	bl sub_08062FB8
	movs r0, #8
	eors r0, r5
	b _080633D4
	.align 2, 0
_08063044: .4byte 0x04000128
_08063048:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _0806309A
	adds r0, r7, #0
	bl sub_08063528
	adds r5, r0, #0
	cmp r5, #0
	beq _0806305C
	b _080633D4
_0806305C:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08063078
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _08063078
	adds r0, r7, #0
	bl sub_08063518
	cmp r0, #0
	bne _08063078
	b _080633C2
_08063078:
	adds r0, r7, #0
	bl sub_08063518
	cmp r0, #0
	beq _08063084
	b _080633D2
_08063084:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _08063094
	adds r0, r7, #0
	bl sub_08062FB8
	movs r0, #0x71
	b _080633D4
_08063094:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _080633D2
_0806309A:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _080630A2
	b _080631D8
_080630A2:
	cmp r0, #2
	bgt _080630B0
	cmp r0, #0
	beq _080630BE
	cmp r0, #1
	beq _0806317A
	b _08063310
_080630B0:
	cmp r0, #0xd0
	bne _080630B6
	b _08063224
_080630B6:
	cmp r0, #0xd1
	bne _080630BC
	b _080632BE
_080630BC:
	b _08063310
_080630BE:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _08063104 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _08063108 @ =0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _080630E6
	adds r4, r1, #0
	ldr r1, _0806310C @ =0x04000126
_080630D6:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _080630E6
	ldrh r0, [r1]
	cmp r0, r4
	beq _080630D6
_080630E6:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _08063104 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08063114
	ldr r0, _08063110 @ =0x00007208
	b _0806313A
	.align 2, 0
_08063104: .4byte 0x04000120
_08063108: .4byte 0x0000FFFF
_0806310C: .4byte 0x04000126
_08063110: .4byte 0x00007208
_08063114:
	subs r5, #1
	cmp r5, #0
	beq _08063140
	lsls r0, r5, #1
	ldr r1, _08063168 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08063114
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0806313A:
	cmp r4, r0
	beq _08063114
	movs r3, #0
_08063140:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _08063150
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_08063150:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806316C
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _08063172
	adds r0, r7, #0
	bl sub_08063430
	b _0806317A
	.align 2, 0
_08063168: .4byte 0x04000120
_0806316C:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_08063172:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _0806327A
_0806317A:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _080631D0 @ =gUnknown_030005EC
_08063188:
	lsls r0, r5, #1
	ldr r2, _080631D4 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _080631B2
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _080631B2
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_080631B2:
	adds r5, r2, #0
	cmp r5, #0
	bne _08063188
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _08063172
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _0806327A
	.align 2, 0
_080631D0: .4byte gUnknown_030005EC
_080631D4: .4byte 0x04000120
_080631D8:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _0806321C @ =gUnknown_030005EC
	mov sb, r1
	ldr r2, _08063220 @ =0x04000120
	mov r8, r2
_080631EC:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _08063212
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _08063212
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_08063212:
	adds r5, r2, #0
	cmp r5, #0
	bne _080631EC
	b _08063378
	.align 2, 0
_0806321C: .4byte gUnknown_030005EC
_08063220: .4byte 0x04000120
_08063224:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _08063288 @ =gUnknown_030005EC
	mov r8, r1
_08063236:
	lsls r0, r5, #1
	ldr r2, _0806328C @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0806326A
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0806325E
	b _080633C8
_0806325E:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0806326A
	movs r3, #0
_0806326A:
	adds r5, r2, #0
	cmp r5, #0
	bne _08063236
	cmp r3, #0
	bne _08063290
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_0806327A:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl sub_080633E4
	b _080633D4
	.align 2, 0
_08063288: .4byte gUnknown_030005EC
_0806328C: .4byte 0x04000120
_08063290:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_0806329A:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _0806329A
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_080633E4
	b _080633D4
_080632BE:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _080632FC @ =0x04000126
	movs r3, #1
_080632C8:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _080632DC
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _080633C8
_080632DC:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _080632C8
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _08063300
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _080633D2
	.align 2, 0
_080632FC: .4byte 0x04000126
_08063300:
	adds r0, r7, #0
	bl sub_08062FB8
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _080633D4
_08063310:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov sb, r0
_0806331E:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08063358
	lsls r0, r5, #1
	ldr r1, _08063374 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, sb
	lsls r3, r5
	cmp r2, r1
	bne _08063352
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _08063358
_08063352:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_08063358:
	subs r5, #1
	cmp r5, #0
	bne _0806331E
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _08063378
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _08063172
	.align 2, 0
_08063374: .4byte 0x04000120
_08063378:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806338A
	adds r0, r7, #0
	bl sub_08062FB8
	movs r0, #0x50
	b _080633D4
_0806338A:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _0806339A
	b _08063172
_0806339A:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_080633E4
	adds r5, r0, #0
	cmp r5, #0
	bne _080633D4
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _080633D2
_080633C2:
	bl sub_0806362C
	b _0806301E
_080633C8:
	adds r0, r7, #0
	bl sub_08062FB8
	movs r0, #0x60
	b _080633D4
_080633D2:
	movs r0, #0
_080633D4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

