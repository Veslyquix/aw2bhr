	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B7E8
sub_0802B7E8: @ 0x0802B7E8
	push {r4, r5, lr}
	ldr r4, _0802B820 @ =gUnknown_08090BBC
	ldr r5, [r4]
	ldrb r0, [r5, #0x10]
	ldrb r1, [r5, #0x11]
	bl sub_0802B6C8
	ldr r1, _0802B824 @ =gUnknown_0849A2A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x98
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, [r5, #0xc]
	cmp r2, #0x93
	ble _0802B834
	movs r0, #0
	strb r0, [r5, #8]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	subs r0, r1, #1
	cmp r2, r0
	blt _0802B828
	movs r0, #0x5a
	rsbs r0, r0, #0
	b _0802B832
	.align 2, 0
_0802B820: .4byte gUnknown_08090BBC
_0802B824: .4byte gUnknown_0849A2A0
_0802B828:
	subs r0, r2, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
_0802B832:
	str r0, [r5, #0xc]
_0802B834:
	ldr r3, [r4]
	ldr r2, [r3, #0xc]
	cmp r2, #2
	bgt _0802B854
	cmp r2, #1
	ble _0802B844
	movs r0, #3
	b _0802B84E
_0802B844:
	subs r0, r2, #3
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
_0802B84E:
	str r0, [r3, #0xc]
	bl sub_0802B750
_0802B854:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	cmp r0, #3
	bne _0802B860
	bl sub_0802B750
_0802B860:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

