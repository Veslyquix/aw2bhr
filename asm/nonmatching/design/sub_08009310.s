	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009310
sub_08009310: @ 0x08009310
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r3, _0800935C @ =gUnknown_0808D814
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r6, _08009360 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08009364 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r7, r3, #0
	cmp r0, #0xc
	bne _08009338
	b _080094D8
_08009338:
	cmp r0, #7
	beq _08009344
	cmp r0, #0xd
	beq _08009344
	cmp r0, #0x13
	bne _080093C0
_08009344:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008D14
	subs r0, #1
	cmp r0, #0xd
	bhi _080093AE
	lsls r0, r0, #2
	ldr r1, _08009368 @ =_0800936C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800935C: .4byte gUnknown_0808D814
_08009360: .4byte 0x0000417A
_08009364: .4byte 0x00001432
_08009368: .4byte _0800936C
_0800936C: @ jump table
	.4byte _080093A4 @ case 0
	.4byte _080093A4 @ case 1
	.4byte _080094E4 @ case 2
	.4byte _080093A4 @ case 3
	.4byte _080094E4 @ case 4
	.4byte _080094D8 @ case 5
	.4byte _080094D8 @ case 6
	.4byte _080093A4 @ case 7
	.4byte _080094D8 @ case 8
	.4byte _080094E4 @ case 9
	.4byte _080094D8 @ case 10
	.4byte _080094E4 @ case 11
	.4byte _080094D8 @ case 12
	.4byte _080094D8 @ case 13
_080093A4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008CB8
	b _080094D8
_080093AE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008D70
	adds r6, r0, #0
	cmp r6, #0
	ble _080093BE
	b _080094D8
_080093BE:
	b _080094E4
_080093C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08009B38
	cmp r0, #0
	bne _080093CE
	b _080094E4
_080093CE:
	movs r6, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008CB8
	cmp r0, #9
	bls _080093DE
	b _080094D4
_080093DE:
	lsls r0, r0, #2
	ldr r1, _080093E8 @ =_080093EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080093E8: .4byte _080093EC
_080093EC: @ jump table
	.4byte _08009414 @ case 0
	.4byte _080094D4 @ case 1
	.4byte _08009478 @ case 2
	.4byte _080094D4 @ case 3
	.4byte _08009478 @ case 4
	.4byte _080094D4 @ case 5
	.4byte _08009478 @ case 6
	.4byte _080094D4 @ case 7
	.4byte _08009414 @ case 8
	.4byte _08009414 @ case 9
_08009414:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080094D8
	cmp r5, #0
	ble _08009448
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r3, _08009470 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	ldr r2, _08009474 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xc
	beq _080094D8
_08009448:
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3]
	subs r0, #1
	cmp r5, r0
	bge _080094D4
	lsls r1, r4, #1
	ldr r2, _08009470 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r5
	ldr r2, _08009474 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080094D4
	b _080094D8
	.align 2, 0
_08009470: .4byte 0x0000417A
_08009474: .4byte 0x00001432
_08009478:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080094D8
	cmp r4, #0
	ble _080094AC
	ldr r0, [r7]
	ldr r2, [r0]
	subs r1, r4, #1
	lsls r1, r1, #1
	ldr r3, _080094DC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r1, _080094E0 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0xc
	beq _080094D2
_080094AC:
	ldr r0, [r7]
	ldr r3, [r0]
	ldrh r0, [r3, #2]
	subs r0, #1
	cmp r4, r0
	bge _080094D4
	adds r1, r4, #1
	lsls r1, r1, #1
	ldr r2, _080094DC @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r5
	ldr r2, _080094E0 @ =0x00001432
	adds r0, r3, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080094D4
_080094D2:
	movs r6, #0x16
_080094D4:
	cmp r6, #0
	ble _080094E4
_080094D8:
	movs r0, #1
	b _080094E6
	.align 2, 0
_080094DC: .4byte 0x0000417A
_080094E0: .4byte 0x00001432
_080094E4:
	movs r0, #0
_080094E6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

