	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034780
sub_08034780: @ 0x08034780
	push {r4, r5, r6, r7, lr}
	ldr r0, _08034828 @ =gUnknown_030040F0
	movs r4, #0
	str r4, [r0]
	ldr r0, _0803482C @ =gUnknown_030044A0
	str r4, [r0]
	ldr r7, _08034830 @ =gUnknown_03003FC0
	adds r0, r7, #0
	adds r0, #0x39
	movs r5, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	subs r0, #8
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r6, #3
	strb r6, [r1]
	adds r2, r7, #0
	adds r2, #0x37
	movs r1, #4
	strb r1, [r2]
	adds r2, #7
	strb r5, [r2]
	adds r2, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x40
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x41
	movs r0, #0xb
	strb r0, [r1]
	bl sub_08026900
	adds r0, r7, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0xfa
	lsls r0, r0, #2
	str r0, [r7, #0x28]
	str r4, [r7, #0x24]
	str r4, [r7, #0x14]
	str r4, [r7, #0x18]
	str r4, [r7, #0x1c]
	str r4, [r7, #0x20]
	strb r4, [r7, #0xd]
	adds r0, r7, #0
	adds r0, #0x2f
	strb r4, [r0]
	subs r0, #3
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	strb r6, [r7, #4]
	strb r5, [r7, #5]
	strb r4, [r7, #6]
	strb r5, [r7, #8]
	strb r5, [r7, #7]
	ldr r1, _08034834 @ =gUnknown_0200C420
	ldrb r0, [r1, #0xe]
	strb r0, [r7, #9]
	movs r2, #0
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _0803481E
	movs r2, #1
_0803481E:
	strb r2, [r7, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034828: .4byte gUnknown_030040F0
_0803482C: .4byte gUnknown_030044A0
_08034830: .4byte gUnknown_03003FC0
_08034834: .4byte gUnknown_0200C420

