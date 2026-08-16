	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017208
sub_08017208: @ 0x08017208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08017228 @ =gUnknown_02000000
	mov sb, r0
	ldr r0, _0801722C @ =0x00000BAC
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017234
	ldr r1, _08017230 @ =gUnknown_030032D8
	movs r0, #5
	b _08017238
	.align 2, 0
_08017228: .4byte gUnknown_02000000
_0801722C: .4byte 0x00000BAC
_08017230: .4byte gUnknown_030032D8
_08017234:
	ldr r1, _08017504 @ =gUnknown_030032D8
	movs r0, #0xc
_08017238:
	strh r0, [r1]
	ldr r1, _08017508 @ =gUnknown_03001FD4
	ldr r0, _0801750C @ =0x00000BA8
	add r0, sb
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08017510 @ =gUnknown_030033E4
	mov r2, sb
	ldr r0, [r2, #4]
	str r0, [r1]
	ldr r1, _08017514 @ =gUnknown_03004080
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, _08017518 @ =gUnknown_030033EC
	ldrh r2, [r2, #2]
	strh r2, [r3]
	ldr r1, _0801751C @ =gUnknown_03004084
	lsls r0, r2, #5
	strh r0, [r1]
	ldr r1, _08017520 @ =gUnknown_03003F2C
	ldrh r0, [r3]
	subs r0, #1
	lsls r0, r0, #6
	strh r0, [r1]
	ldr r0, _08017524 @ =gUnknown_03004480
	strh r2, [r0]
	ldr r5, _08017528 @ =gUnknown_0808E554
	ldr r4, [r5]
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sb
	adds r0, r4, #0
	movs r2, #0x48
	bl sub_0808B6E8
	ldr r1, _0801752C @ =gUnknown_03004490
	mov r0, sb
	adds r0, #8
	ldm r0!, {r3, r6, r7}
	stm r1!, {r3, r6, r7}
	ldr r2, _08017530 @ =gUnknown_0200C420
	ldrb r0, [r4, #9]
	strb r0, [r2, #0xe]
	movs r1, #0
	ldrb r0, [r4, #0xc]
	mov sl, r5
	cmp r0, #0
	bne _0801729A
	movs r1, #1
_0801729A:
	strb r1, [r2, #0x14]
	movs r5, #0
	ldr r4, _08017534 @ =gUnknown_030033F4
	ldr r3, _08017538 @ =0x00000B18
	add r3, sb
_080172A4:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r2, r1, r4
	lsls r0, r1, #2
	adds r0, r3, r0
	ldr r0, [r0]
	strb r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #3
	ble _080172A4
	ldr r2, _0801753C @ =gUnknown_03002F08
	ldr r0, _08017540 @ =0x00000B98
	add r0, sb
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r1, _08017544 @ =gUnknown_03002F20
	movs r0, #0xba
	lsls r0, r0, #4
	add r0, sb
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08017548 @ =gUnknown_03001FF0
	ldr r0, _0801754C @ =0x00000BA4
	add r0, sb
	ldr r0, [r0]
	str r0, [r1]
	ldr r7, _08017550 @ =gUnknown_08499590
	ldr r1, [r7]
	ldr r0, _08017554 @ =0x00000BAE
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0xbb
	lsls r0, r0, #4
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _08017558 @ =0x00000BB2
	add r0, sb
	ldrh r3, [r0]
	strh r3, [r1, #4]
	ldr r0, _0801755C @ =0x00000BB4
	add r0, sb
	ldrh r2, [r0]
	strh r2, [r1, #6]
	movs r4, #4
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _08017312
	adds r0, #0xf
_08017312:
	asrs r0, r0, #4
	strh r0, [r1, #0xc]
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _08017320
	adds r0, #0xf
_08017320:
	asrs r0, r0, #4
	strh r0, [r1, #0xe]
	strh r3, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r0, _08017560 @ =0x00000BB6
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r1, #0x10]
	mov r0, sl
	ldr r6, [r0]
	ldrb r0, [r6, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bhi _08017342
	b _08017446
_08017342:
	ldrb r0, [r6, #2]
	bl sub_0802490C
	ldr r1, [r7]
	ldr r2, _08017564 @ =0x00004233
	adds r1, r1, r2
	strb r0, [r1]
	ldr r4, [r7]
	ldr r3, _08017568 @ =0x0000421A
	adds r4, r4, r3
	ldrb r0, [r6, #2]
	bl sub_08024944
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_0803CC84
	ldrb r0, [r6, #2]
	bl sub_080247A4
	bl sub_080215FC
	movs r2, #0
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r2, r0
	bge _080173D6
_08017378:
	movs r1, #0
	ldr r0, [r7]
	lsls r5, r2, #0x10
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _080173C4
	asrs r4, r5, #0x10
	str r4, [sp]
	ldr r6, _0801756C @ =gUnknown_03003F68
	mov r8, r6
	ldr r0, _08017570 @ =0x0000417A
	mov ip, r0
_08017390:
	ldr r4, [r7]
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	mov r3, ip
	adds r0, r4, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r6, [sp]
	adds r1, r1, r6
	lsls r1, r1, #1
	ldr r0, _08017574 @ =0x00000A22
	adds r3, r4, r0
	adds r3, r3, r1
	mov r6, r8
	ldr r0, [r6]
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	strh r0, [r3]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r4, [r4, #2]
	cmp r2, r4
	blt _08017390
_080173C4:
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r5, r0
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7]
	ldrh r0, [r0]
	cmp r1, r0
	blt _08017378
_080173D6:
	bl sub_0802481C
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #2]
	adds r0, #0x4c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb
	bls _08017446
	movs r5, #0
	ldr r2, _08017578 @ =0x00000BBA
	mov r3, sb
	adds r0, r3, r2
	ldrh r0, [r0]
	ldr r1, _0801757C @ =0x0000FFFF
	cmp r0, r1
	beq _08017446
	ldr r4, _08017550 @ =gUnknown_08499590
	mov r8, r4
	adds r6, r2, #0
	adds r7, r1, #0
_08017402:
	mov r0, r8
	ldr r4, [r0]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r3, r2, #2
	add r3, sb
	ldr r1, _08017580 @ =0x00000BB9
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r5, _08017570 @ =0x0000417A
	adds r0, r4, r5
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r5, _08017584 @ =0x00000BB8
	adds r0, r3, r5
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08017574 @ =0x00000A22
	adds r4, r4, r0
	adds r4, r4, r1
	adds r3, r3, r6
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	asrs r2, r2, #0xe
	add r2, sb
	adds r2, r2, r6
	ldrh r0, [r2]
	cmp r0, r7
	bne _08017402
_08017446:
	movs r5, #0
	ldr r6, _08017588 @ =gUnknown_02023284
_0801744A:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r0, r1, r6
	add r1, sb
	adds r1, #0x14
	movs r2, #0x3c
	bl sub_0808B6E8
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _0801744A
	movs r5, #0
	ldr r1, _0801758C @ =gUnknown_02022684
	mov r8, r1
_08017472:
	movs r2, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #6
	mov sl, r3
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	adds r4, r1, r0
_08017484:
	lsls r3, r2, #0x10
	asrs r3, r3, #0x10
	mov r6, sl
	adds r0, r6, r3
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r4, r3
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sb
	add r1, r8
	movs r7, #0xc4
	lsls r7, r7, #1
	adds r0, r0, r7
	ldm r0!, {r2, r6, r7}
	stm r1!, {r2, r6, r7}
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r2, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0x32
	ble _08017484
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _08017472
	movs r5, #0
	ldr r6, _08017590 @ =gUnknown_02028360
	ldr r4, _08017594 @ =0x00000D28
	add r4, sb
_080174CC:
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #3
	adds r3, r0, r6
	adds r0, r4, r0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0xf
	ble _080174CC
	ldr r0, _08017598 @ =0x00000DA8
	add r0, sb
	bl sub_080456B8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017504: .4byte gUnknown_030032D8
_08017508: .4byte gUnknown_03001FD4
_0801750C: .4byte 0x00000BA8
_08017510: .4byte gUnknown_030033E4
_08017514: .4byte gUnknown_03004080
_08017518: .4byte gUnknown_030033EC
_0801751C: .4byte gUnknown_03004084
_08017520: .4byte gUnknown_03003F2C
_08017524: .4byte gUnknown_03004480
_08017528: .4byte gUnknown_0808E554
_0801752C: .4byte gUnknown_03004490
_08017530: .4byte gUnknown_0200C420
_08017534: .4byte gUnknown_030033F4
_08017538: .4byte 0x00000B18
_0801753C: .4byte gUnknown_03002F08
_08017540: .4byte 0x00000B98
_08017544: .4byte gUnknown_03002F20
_08017548: .4byte gUnknown_03001FF0
_0801754C: .4byte 0x00000BA4
_08017550: .4byte gUnknown_08499590
_08017554: .4byte 0x00000BAE
_08017558: .4byte 0x00000BB2
_0801755C: .4byte 0x00000BB4
_08017560: .4byte 0x00000BB6
_08017564: .4byte 0x00004233
_08017568: .4byte 0x0000421A
_0801756C: .4byte gUnknown_03003F68
_08017570: .4byte 0x0000417A
_08017574: .4byte 0x00000A22
_08017578: .4byte 0x00000BBA
_0801757C: .4byte 0x0000FFFF
_08017580: .4byte 0x00000BB9
_08017584: .4byte 0x00000BB8
_08017588: .4byte gUnknown_02023284
_0801758C: .4byte gUnknown_02022684
_08017590: .4byte gUnknown_02028360
_08017594: .4byte 0x00000D28
_08017598: .4byte 0x00000DA8

