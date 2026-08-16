	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080281F0
sub_080281F0: @ 0x080281F0
	push {r4, r5, r6, r7, lr}
	ldr r1, _08028210 @ =gUnknown_08090AF4
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r2, [r0, #4]
	movs r0, #9
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08028218
	ldr r0, _08028214 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_08015328
	b _080283C6
	.align 2, 0
_08028210: .4byte gUnknown_08090AF4
_08028214: .4byte gUnknown_03001FBC
_08028218:
	movs r0, #0x40
	ands r0, r2
	ldr r4, _080282A0 @ =gUnknown_08090AF8
	ldr r3, _080282A4 @ =gUnknown_08090AFC
	cmp r0, #0
	beq _08028242
	ldr r2, [r3]
	ldr r0, [r4]
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrh r2, [r1, #0x1e]
	movs r7, #0x1e
	ldrsh r0, [r1, r7]
	cmp r0, #0
	ble _08028242
	subs r0, r2, #1
	strh r0, [r1, #0x1e]
_08028242:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802826E
	ldr r2, [r3]
	ldr r0, [r4]
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrh r2, [r1, #0x1e]
	movs r7, #0x1e
	ldrsh r0, [r1, r7]
	cmp r0, #1
	bgt _0802826E
	adds r0, r2, #1
	strh r0, [r1, #0x1e]
_0802826E:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	ldr r6, _080282A8 @ =gUnknown_08090B00
	cmp r0, #0
	beq _080282F0
	ldr r2, [r3]
	ldr r0, [r4]
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _080282C8
	cmp r0, #1
	bgt _080282AC
	cmp r0, #0
	beq _080282B2
	b _080282F0
	.align 2, 0
_080282A0: .4byte gUnknown_08090AF8
_080282A4: .4byte gUnknown_08090AFC
_080282A8: .4byte gUnknown_08090B00
_080282AC:
	cmp r0, #2
	beq _080282E0
	b _080282F0
_080282B2:
	ldr r0, _080282C4 @ =gUnknown_08499F4C
	ldr r2, [r6]
	ldrb r1, [r2, #2]
	ldrh r0, [r0]
	cmp r0, r1
	bhs _080282F0
	subs r0, r1, #1
	strb r0, [r2, #2]
	b _080282F0
	.align 2, 0
_080282C4: .4byte gUnknown_08499F4C
_080282C8:
	ldr r0, _080282DC @ =gUnknown_08499F4C
	ldr r1, [r6]
	adds r1, #0x2c
	ldrb r2, [r1]
	ldrh r0, [r0, #4]
	cmp r0, r2
	bhs _080282F0
	subs r0, r2, #1
	strb r0, [r1]
	b _080282F0
	.align 2, 0
_080282DC: .4byte gUnknown_08499F4C
_080282E0:
	ldr r0, _08028320 @ =gUnknown_08499F4C
	ldr r2, [r6]
	ldrb r1, [r2, #0xd]
	ldrh r0, [r0, #8]
	cmp r0, r1
	bhs _080282F0
	subs r0, r1, #1
	strb r0, [r2, #0xd]
_080282F0:
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08028368
	ldr r2, [r3]
	ldr r0, [r4]
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r7, #0x1e
	ldrsh r0, [r0, r7]
	cmp r0, #1
	beq _08028340
	cmp r0, #1
	bgt _08028324
	cmp r0, #0
	beq _0802832A
	b _08028368
	.align 2, 0
_08028320: .4byte gUnknown_08499F4C
_08028324:
	cmp r0, #2
	beq _08028358
	b _08028368
_0802832A:
	ldr r0, _0802833C @ =gUnknown_08499F4C
	ldr r2, [r6]
	ldrb r1, [r2, #2]
	ldrh r0, [r0, #2]
	cmp r0, r1
	bls _08028368
	adds r0, r1, #1
	strb r0, [r2, #2]
	b _08028368
	.align 2, 0
_0802833C: .4byte gUnknown_08499F4C
_08028340:
	ldr r0, _08028354 @ =gUnknown_08499F4C
	ldr r1, [r6]
	adds r1, #0x2c
	ldrb r2, [r1]
	ldrh r0, [r0, #6]
	cmp r0, r2
	bls _08028368
	adds r0, r2, #1
	strb r0, [r1]
	b _08028368
	.align 2, 0
_08028354: .4byte gUnknown_08499F4C
_08028358:
	ldr r0, _080283CC @ =gUnknown_08499F4C
	ldr r2, [r6]
	ldrb r1, [r2, #0xd]
	ldrh r0, [r0, #0xa]
	cmp r0, r1
	bls _08028368
	adds r0, r1, #1
	strb r0, [r2, #0xd]
_08028368:
	ldr r2, [r3]
	ldr r0, [r4]
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r5, #0x1e
	ldrsh r1, [r0, r5]
	lsls r1, r1, #0x11
	movs r7, #0xe0
	lsls r7, r7, #0xc
	adds r1, r1, r7
	asrs r1, r1, #0x10
	ldr r2, _080283D0 @ =gUnknown_08090AD4
	movs r0, #8
	bl sub_08013428
	ldr r2, _080283D4 @ =gUnknown_08090AD8
	ldr r4, [r6]
	ldrb r3, [r4, #2]
	movs r0, #0xa
	movs r1, #0xe
	bl sub_08013428
	ldr r2, _080283D8 @ =gUnknown_08090AE4
	ldr r5, _080283DC @ =gUnknown_08090AC4
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	movs r0, #0xa
	movs r1, #0x10
	bl sub_08013428
	ldr r2, _080283E0 @ =gUnknown_08090AEC
	ldrb r0, [r4, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r3, [r0]
	movs r0, #0xa
	movs r1, #0x12
	bl sub_08013428
_080283C6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080283CC: .4byte gUnknown_08499F4C
_080283D0: .4byte gUnknown_08090AD4
_080283D4: .4byte gUnknown_08090AD8
_080283D8: .4byte gUnknown_08090AE4
_080283DC: .4byte gUnknown_08090AC4
_080283E0: .4byte gUnknown_08090AEC

