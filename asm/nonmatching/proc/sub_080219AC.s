	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080219AC
sub_080219AC: @ 0x080219AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov sl, r0
	ldr r4, _080219F8 @ =gUnknown_08090974
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, _080219FC @ =0x0000193A
	adds r0, r0, r1
	bl sub_0801F92C
	movs r0, #0xff
	bl sub_0801F838
	ldr r3, _08021A00 @ =gUnknown_08499598
	movs r2, #0
	movs r1, #0
	movs r6, #4
_080219D8:
	ldr r0, [r3]
	adds r0, r1, r0
	strb r2, [r0, #0x11]
	adds r1, #0x3c
	subs r6, #1
	cmp r6, #0
	bge _080219D8
	movs r2, #0
	str r2, [sp]
	ldr r1, _080219F8 @ =gUnknown_08090974
	ldr r0, _08021A04 @ =gUnknown_08499590
	ldr r0, [r0]
	mov r3, sl
	lsls r2, r3, #3
	b _08021B34
	.align 2, 0
_080219F8: .4byte gUnknown_08090974
_080219FC: .4byte 0x0000193A
_08021A00: .4byte gUnknown_08499598
_08021A04: .4byte gUnknown_08499590
_08021A08:
	movs r6, #0
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r3, [sp]
	adds r3, #1
	str r3, [sp, #4]
	b _08021B22
_08021A16:
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r0, [sp]
	lsls r2, r0, #1
	ldr r3, _08021A48 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r3, _08021A4C @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	adds r7, r2, #0
	cmp r0, #0xe
	bhi _08021B16
	lsls r0, r0, #2
	ldr r1, _08021A50 @ =_08021A54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021A48: .4byte 0x0000417A
_08021A4C: .4byte 0x00001432
_08021A50: .4byte _08021A54
_08021A54: @ jump table
	.4byte _08021A90 @ case 0
	.4byte _08021B16 @ case 1
	.4byte _08021A90 @ case 2
	.4byte _08021B16 @ case 3
	.4byte _08021A90 @ case 4
	.4byte _08021A90 @ case 5
	.4byte _08021B16 @ case 6
	.4byte _08021B16 @ case 7
	.4byte _08021A90 @ case 8
	.4byte _08021B16 @ case 9
	.4byte _08021B16 @ case 10
	.4byte _08021A90 @ case 11
	.4byte _08021B16 @ case 12
	.4byte _08021B16 @ case 13
	.4byte _08021A90 @ case 14
_08021A90:
	ldr r0, _08021B74 @ =gUnknown_08499590
	mov ip, r0
	ldr r1, [r0]
	ldr r4, _08021B78 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08021B7C @ =0x00001432
	mov r8, r2
	add r1, r8
	adds r1, r1, r0
	ldrb r1, [r1]
	lsrs r1, r1, #5
	ldr r0, _08021B80 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x11]
	adds r1, #1
	movs r3, #0
	mov sb, r3
	strb r1, [r0, #0x11]
	mov r0, ip
	ldr r1, [r0]
	adds r0, r1, r4
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _08021B84 @ =0x0000193A
	adds r1, r1, r2
	adds r1, r1, r0
	mov r3, sl
	strb r3, [r1]
	ldr r5, _08021B88 @ =gUnknown_084995A0
	ldr r3, [r5]
	mov r0, sl
	lsls r2, r0, #3
	adds r3, r2, r3
	mov r1, ip
	ldr r0, [r1]
	adds r4, r0, r4
	adds r4, r4, r7
	ldrh r1, [r4]
	adds r1, r1, r6
	add r0, r8
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r3]
	ldr r0, [r5]
	adds r0, r2, r0
	strb r6, [r0, #1]
	ldr r0, [r5]
	adds r0, r2, r0
	mov r3, sp
	ldrb r3, [r3]
	strb r3, [r0, #2]
	ldr r0, [r5]
	adds r2, r2, r0
	mov r0, sb
	strb r0, [r2, #3]
	movs r1, #1
	add sl, r1
_08021B16:
	adds r6, #1
	ldr r1, _08021B8C @ =gUnknown_08090974
	ldr r0, _08021B74 @ =gUnknown_08499590
	ldr r0, [r0]
	mov r3, sl
	lsls r2, r3, #3
_08021B22:
	ldrh r0, [r0]
	cmp r6, r0
	bge _08021B2A
	b _08021A16
_08021B2A:
	ldr r0, [sp, #4]
	str r0, [sp]
	ldr r1, _08021B8C @ =gUnknown_08090974
	ldr r0, _08021B74 @ =gUnknown_08499590
	ldr r0, [r0]
_08021B34:
	ldr r3, [sp]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _08021B3E
	b _08021A08
_08021B3E:
	ldr r0, _08021B88 @ =gUnknown_084995A0
	ldr r0, [r0]
	adds r0, r2, r0
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _08021B90 @ =gUnknown_03003FC0
	adds r0, #0x47
	movs r1, #0
	strb r1, [r0]
	mov sl, r1
	movs r0, #0
	str r0, [sp]
	ldr r1, _08021B8C @ =gUnknown_08090974
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp sl, r0
	blt _08021B64
	b _08021C7A
_08021B64:
	movs r6, #0
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp, #4]
	b _08021C62
	.align 2, 0
_08021B74: .4byte gUnknown_08499590
_08021B78: .4byte 0x0000417A
_08021B7C: .4byte 0x00001432
_08021B80: .4byte gUnknown_08499598
_08021B84: .4byte 0x0000193A
_08021B88: .4byte gUnknown_084995A0
_08021B8C: .4byte gUnknown_08090974
_08021B90: .4byte gUnknown_03003FC0
_08021B94:
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r3, [sp]
	lsls r2, r3, #1
	ldr r3, _08021BC4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r3, _08021BC8 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #6
	adds r7, r2, #0
	cmp r0, #0x13
	bhi _08021C5A
	lsls r0, r0, #2
	ldr r1, _08021BCC @ =_08021BD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021BC4: .4byte 0x0000417A
_08021BC8: .4byte 0x00001432
_08021BCC: .4byte _08021BD0
_08021BD0: @ jump table
	.4byte _08021C28 @ case 0
	.4byte _08021C5A @ case 1
	.4byte _08021C28 @ case 2
	.4byte _08021C5A @ case 3
	.4byte _08021C28 @ case 4
	.4byte _08021C28 @ case 5
	.4byte _08021C5A @ case 6
	.4byte _08021C5A @ case 7
	.4byte _08021C28 @ case 8
	.4byte _08021C5A @ case 9
	.4byte _08021C20 @ case 10
	.4byte _08021C28 @ case 11
	.4byte _08021C28 @ case 12
	.4byte _08021C5A @ case 13
	.4byte _08021C28 @ case 14
	.4byte _08021C28 @ case 15
	.4byte _08021C28 @ case 16
	.4byte _08021C28 @ case 17
	.4byte _08021C28 @ case 18
	.4byte _08021C28 @ case 19
_08021C20:
	ldr r0, _08021C9C @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #5
	bne _08021C5A
_08021C28:
	mov r0, sl
	cmp r0, #0x5b
	bgt _08021C56
	ldr r0, _08021CA0 @ =gUnknown_03003150
	mov r1, sl
	lsls r2, r1, #2
	adds r2, r2, r0
	ldr r0, _08021CA4 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r3, _08021CA8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r3, _08021CAC @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	strb r6, [r2, #1]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2, #2]
_08021C56:
	movs r1, #1
	add sl, r1
_08021C5A:
	adds r6, #1
	ldr r1, _08021CB0 @ =gUnknown_08090974
	ldr r0, _08021CA4 @ =gUnknown_08499590
	ldr r0, [r0]
_08021C62:
	ldrh r0, [r0]
	cmp r6, r0
	blt _08021B94
	ldr r2, [sp, #4]
	str r2, [sp]
	ldr r1, _08021CB0 @ =gUnknown_08090974
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _08021C7A
	b _08021B64
_08021C7A:
	mov r3, sl
	cmp r3, #0x5b
	bgt _08021C8A
	ldr r0, _08021CA0 @ =gUnknown_03003150
	lsls r1, r3, #2
	adds r1, r1, r0
	movs r0, #0xff
	strb r0, [r1]
_08021C8A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021C9C: .4byte gUnknown_03003FC0
_08021CA0: .4byte gUnknown_03003150
_08021CA4: .4byte gUnknown_08499590
_08021CA8: .4byte 0x0000417A
_08021CAC: .4byte 0x00001432
_08021CB0: .4byte gUnknown_08090974

