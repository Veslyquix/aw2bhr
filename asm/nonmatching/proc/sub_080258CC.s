	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080258CC
sub_080258CC: @ 0x080258CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08025ACC @ =gUnknown_08090A50
	ldr r4, [r0]
	ldr r2, [r4]
	movs r3, #4
	ldrsh r1, [r2, r3]
	mov sb, r0
	cmp r1, #0
	bge _080258E6
	adds r1, #0xf
_080258E6:
	asrs r0, r1, #4
	strh r0, [r2, #0xc]
	movs r7, #6
	ldrsh r0, [r2, r7]
	cmp r0, #0
	bge _080258F4
	adds r0, #0xf
_080258F4:
	asrs r0, r0, #4
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #4]
	strh r0, [r2, #8]
	ldrh r0, [r2, #6]
	strh r0, [r2, #0xa]
	bl sub_08023860
	bl sub_080213AC
	movs r1, #0
	ldr r0, [r4]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _08025964
	mov r8, r4
_08025914:
	movs r2, #0
	mov r3, r8
	ldr r0, [r3]
	adds r7, r1, #1
	ldrh r0, [r0]
	cmp r2, r0
	bge _08025958
	ldr r4, _08025AD0 @ =gUnknown_08499590
	lsls r3, r1, #1
	ldr r6, _08025AD4 @ =0x0000417A
	movs r5, #0
	ldr r0, _08025AD8 @ =0x0000051A
	mov ip, r0
_0802592E:
	ldr r1, [r4]
	adds r0, r1, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r2
	adds r1, #0x12
	adds r1, r1, r0
	strb r5, [r1]
	ldr r1, [r4]
	adds r0, r1, r6
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r2
	add r1, ip
	adds r1, r1, r0
	strb r5, [r1]
	adds r2, #1
	ldr r0, [r4]
	ldrh r0, [r0]
	cmp r2, r0
	blt _0802592E
_08025958:
	adds r1, r7, #0
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _08025914
_08025964:
	movs r5, #1
	ldr r3, _08025ADC @ =gUnknown_08499594
	mov ip, r3
	movs r7, #0xc
_0802596C:
	mov r0, ip
	ldr r4, [r0]
	adds r3, r7, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _08025A12
	ldrb r1, [r3, #1]
	movs r0, #6
	ands r0, r1
	cmp r0, #2
	beq _08025A12
	mov r1, sb
	ldr r1, [r1]
	mov r8, r1
	ldr r2, [r1]
	ldrb r1, [r3, #3]
	lsls r1, r1, #1
	ldr r6, _08025AD4 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r3, #2]
	adds r1, r1, r0
	ldr r3, _08025AD8 @ =0x0000051A
	adds r2, r2, r3
	adds r2, r2, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _080259B8
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08025A12
_080259B8:
	strb r5, [r2]
	mov r1, ip
	ldr r0, [r1]
	adds r3, r7, r0
	ldrb r1, [r3, #1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08025A12
	ldr r0, _08025AE0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08025AE4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	mov r1, r8
	ldr r2, [r1]
	ldrb r4, [r3, #3]
	ldrb r3, [r3, #2]
	cmp r0, #2
	beq _08025A00
	lsls r1, r4, #1
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r3
	mov r8, r1
	ldr r1, _08025AE8 @ =0x00001E42
	adds r0, r2, r1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025A12
_08025A00:
	lsls r1, r4, #1
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r3
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	strb r5, [r0]
_08025A12:
	adds r7, #0xc
	adds r5, #1
	cmp r5, #0xff
	ble _0802596C
	movs r5, #1
	ldr r2, _08025ADC @ =gUnknown_08499594
	mov r8, r2
	movs r4, #0xc
_08025A22:
	mov r3, r8
	ldr r0, [r3]
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025AAA
	ldrb r1, [r1, #1]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _08025AAA
	ldr r0, _08025AE0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08025AE4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08025AAA
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl sub_0802571C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025A88
	mov r7, sb
	ldr r0, [r7]
	ldr r3, [r0]
	mov r0, r8
	ldr r2, [r0]
	adds r2, r4, r2
	ldrb r1, [r2, #3]
	lsls r1, r1, #1
	ldr r7, _08025AD4 @ =0x0000417A
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #2]
	adds r1, r1, r0
	ldr r0, _08025AE8 @ =0x00001E42
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _08025AAA
_08025A88:
	mov r1, sb
	ldr r0, [r1]
	ldr r3, [r0]
	mov r7, r8
	ldr r2, [r7]
	adds r2, r4, r2
	ldrb r1, [r2, #3]
	lsls r1, r1, #1
	ldr r7, _08025AD4 @ =0x0000417A
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r2, #2]
	adds r1, r1, r0
	adds r3, #0x12
	adds r3, r3, r1
	strb r6, [r3]
_08025AAA:
	adds r4, #0xc
	adds r5, #1
	cmp r5, #0xff
	ble _08025A22
	bl sub_08021D10
	bl sub_08022580
	bl sub_080227A8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025ACC: .4byte gUnknown_08090A50
_08025AD0: .4byte gUnknown_08499590
_08025AD4: .4byte 0x0000417A
_08025AD8: .4byte 0x0000051A
_08025ADC: .4byte gUnknown_08499594
_08025AE0: .4byte gUnknown_030033EC
_08025AE4: .4byte gUnknown_08499598
_08025AE8: .4byte 0x00001E42

