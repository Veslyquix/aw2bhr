	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080724D4
sub_080724D4: @ 0x080724D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _080724FC
	ldr r0, _080724F8 @ =gUnknown_08613F24
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _08072588
	.align 2, 0
_080724F8: .4byte gUnknown_08613F24
_080724FC:
	cmp r4, #0
	bge _0807250E
	ldr r0, _08072518 @ =gUnknown_08613F28
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	rsbs r4, r4, #0
	movs r5, #2
_0807250E:
	ldr r0, _0807251C @ =0x0001869F
	cmp r4, r0
	ble _08072520
	adds r5, #0xa
	b _0807254E
	.align 2, 0
_08072518: .4byte gUnknown_08613F28
_0807251C: .4byte 0x0001869F
_08072520:
	ldr r0, _0807252C @ =0x0000270F
	cmp r4, r0
	ble _08072530
	adds r5, #8
	b _0807254E
	.align 2, 0
_0807252C: .4byte 0x0000270F
_08072530:
	ldr r0, _0807253C @ =0x000003E7
	cmp r4, r0
	ble _08072540
	adds r5, #6
	b _0807254E
	.align 2, 0
_0807253C: .4byte 0x000003E7
_08072540:
	cmp r4, #0x63
	ble _08072548
	adds r5, #4
	b _0807254E
_08072548:
	cmp r4, #9
	ble _0807254E
	adds r5, #2
_0807254E:
	mov r8, r5
	cmp r4, #0
	ble _0807257A
	ldr r7, _08072594 @ =gUnknown_08613F24
_08072556:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r1, r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _08072556
_0807257A:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_08072588:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08072594: .4byte gUnknown_08613F24

