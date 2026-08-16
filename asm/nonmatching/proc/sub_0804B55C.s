	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B55C
sub_0804B55C: @ 0x0804B55C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r5, [r1, #2]
	ldrb r6, [r1, #3]
	ldr r0, _0804B594 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0804B598 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0804B59C @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	bl sub_08024984
	adds r2, r0, #0
	subs r0, r4, #1
	cmp r0, #7
	bhi _0804B63C
	lsls r0, r0, #2
	ldr r1, _0804B5A0 @ =_0804B5A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B594: .4byte gUnknown_08499590
_0804B598: .4byte 0x0000417A
_0804B59C: .4byte 0x00001432
_0804B5A0: .4byte _0804B5A4
_0804B5A4: @ jump table
	.4byte _0804B5C4 @ case 0
	.4byte _0804B63C @ case 1
	.4byte _0804B614 @ case 2
	.4byte _0804B624 @ case 3
	.4byte _0804B5F4 @ case 4
	.4byte _0804B5D8 @ case 5
	.4byte _0804B63C @ case 6
	.4byte _0804B634 @ case 7
_0804B5C4:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0804B42C
	lsls r0, r0, #0x18
	ldr r1, _0804B5D4 @ =gUnknown_08551C00
	b _0804B600
	.align 2, 0
_0804B5D4: .4byte gUnknown_08551C00
_0804B5D8:
	ldr r1, _0804B5F0 @ =gUnknown_08551C88
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
	bl sub_080129E0
	movs r1, #1
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r4, [r1]
	b _0804B63C
	.align 2, 0
_0804B5F0: .4byte gUnknown_08551C88
_0804B5F4:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0804B4C4
	lsls r0, r0, #0x18
	ldr r1, _0804B610 @ =gUnknown_08551C3A
_0804B600:
	lsrs r0, r0, #0x17
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0
	beq _0804B63C
	adds r4, r0, #0
	b _0804B63C
	.align 2, 0
_0804B610: .4byte gUnknown_08551C3A
_0804B614:
	bl sub_080129E0
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804B63C
	movs r4, #0x2c
	b _0804B63C
_0804B624:
	bl sub_080129E0
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804B63C
	movs r4, #0x2d
	b _0804B63C
_0804B634:
	adds r0, r2, #0
	adds r0, #0x2d
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0804B63C:
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

