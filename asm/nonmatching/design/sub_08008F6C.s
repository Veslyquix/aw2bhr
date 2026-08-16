	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008F6C
sub_08008F6C: @ 0x08008F6C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _08008FB8 @ =gUnknown_0808D810
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r6, _08008FBC @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _08008FC0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r6, [r1]
	adds r7, r3, #0
	cmp r6, #7
	beq _08008F9C
	cmp r6, #0xd
	beq _08008F9C
	cmp r6, #0x13
	beq _08008F9C
	b _08009118
_08008F9C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D14
	subs r0, #1
	cmp r0, #0xd
	bls _08008FAC
	b _080090D6
_08008FAC:
	lsls r0, r0, #2
	ldr r1, _08008FC4 @ =_08008FC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08008FB8: .4byte gUnknown_0808D810
_08008FBC: .4byte 0x0000417A
_08008FC0: .4byte 0x00001432
_08008FC4: .4byte _08008FC8
_08008FC8: @ jump table
	.4byte _08009000 @ case 0
	.4byte _08009040 @ case 1
	.4byte _08009254 @ case 2
	.4byte _08009040 @ case 3
	.4byte _08009254 @ case 4
	.4byte _080090A4 @ case 5
	.4byte _080090A4 @ case 6
	.4byte _08009000 @ case 7
	.4byte _0800901A @ case 8
	.4byte _08009254 @ case 9
	.4byte _0800907E @ case 10
	.4byte _08009254 @ case 11
	.4byte _0800907E @ case 12
	.4byte _080090A4 @ case 13
_08009000:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008CB8
	cmp r0, #4
	beq _080090A4
	cmp r0, #4
	bgt _08009016
	cmp r0, #2
	beq _080090A4
	b _0800901A
_08009016:
	cmp r0, #6
	beq _080090A4
_0800901A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	cmp r6, #0xd
	bne _0800902E
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
_0800902E:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x36
	b _080090C8
_08009040:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008CB8
	cmp r0, #1
	beq _08009058
	cmp r0, #1
	blt _080090A4
	cmp r0, #9
	bgt _080090A4
	cmp r0, #8
	blt _080090A4
_08009058:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	cmp r6, #0xd
	bne _0800906C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
_0800906C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x36
	b _080090C8
_0800907E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	cmp r6, #0xd
	bne _08009092
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
_08009092:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x36
	b _080090C8
_080090A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	cmp r6, #0xd
	bne _080090B8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
_080090B8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
_080090C8:
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
	b _08009254
_080090D6:
	cmp r6, #0xd
	bne _080090EA
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
_080090EA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D70
	adds r6, r0, #0
	cmp r6, #0
	bgt _080090FA
	b _08009254
_080090FA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl MakeTileSimple
	b _08009254
_08009118:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009B38
	cmp r0, #0
	bne _08009126
	b _08009254
_08009126:
	movs r6, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008CB8
	cmp r0, #9
	bls _08009136
	b _08009234
_08009136:
	lsls r0, r0, #2
	ldr r1, _08009140 @ =_08009144
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009140: .4byte _08009144
_08009144: @ jump table
	.4byte _0800916C @ case 0
	.4byte _08009234 @ case 1
	.4byte _080091D4 @ case 2
	.4byte _08009234 @ case 3
	.4byte _080091D4 @ case 4
	.4byte _08009234 @ case 5
	.4byte _080091D4 @ case 6
	.4byte _08009234 @ case 7
	.4byte _0800916C @ case 8
	.4byte _0800916C @ case 9
_0800916C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080091C6
	cmp r4, #0
	ble _080091A0
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080091CC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _080091D0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xc
	beq _080091C6
_080091A0:
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3]
	subs r0, #1
	cmp r4, r0
	bge _08009234
	lsls r1, r5, #1
	ldr r2, _080091CC @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r4
	ldr r2, _080091D0 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08009234
_080091C6:
	movs r6, #0x13
	b _08009238
	.align 2, 0
_080091CC: .4byte 0x0000417A
_080091D0: .4byte 0x00001432
_080091D4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080091EA
	movs r6, #0x16
	b _08009238
_080091EA:
	cmp r5, #0
	ble _0800920C
	ldr r0, [r7]
	ldr r2, [r0]
	subs r1, r5, #1
	lsls r1, r1, #1
	ldr r3, _0800925C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r1, _08009260 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0xc
	beq _08009232
_0800920C:
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3, #2]
	subs r0, #1
	cmp r5, r0
	bge _08009234
	adds r1, r5, #1
	lsls r1, r1, #1
	ldr r2, _0800925C @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r2, _08009260 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08009234
_08009232:
	movs r6, #0x16
_08009234:
	cmp r6, #0
	ble _08009254
_08009238:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl MakeTileSimple
_08009254:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800925C: .4byte 0x0000417A
_08009260: .4byte 0x00001432

