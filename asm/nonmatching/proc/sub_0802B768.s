	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B768
sub_0802B768: @ 0x0802B768
	push {r4, r5, r6, lr}
	ldr r5, _0802B7A0 @ =gUnknown_0849A2A0
	ldr r4, _0802B7A4 @ =gUnknown_08090BB8
	ldr r6, [r4]
	ldrb r0, [r6, #0x10]
	ldrb r1, [r6, #0x11]
	bl sub_0802B6C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	adds r0, r0, r5
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, [r6, #0xc]
	cmp r2, #3
	bgt _0802B7B4
	movs r0, #1
	strb r0, [r6, #8]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #1
	cmp r2, r0
	bgt _0802B7A8
	movs r0, #0xf2
	b _0802B7B2
	.align 2, 0
_0802B7A0: .4byte gUnknown_0849A2A0
_0802B7A4: .4byte gUnknown_08090BB8
_0802B7A8:
	subs r0, r2, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
_0802B7B2:
	str r0, [r6, #0xc]
_0802B7B4:
	ldr r3, [r4]
	ldr r2, [r3, #0xc]
	cmp r2, #0x94
	ble _0802B7D6
	cmp r2, #0x95
	bgt _0802B7C4
	movs r0, #0x94
	b _0802B7D0
_0802B7C4:
	adds r0, r2, #0
	subs r0, #0x94
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
_0802B7D0:
	str r0, [r3, #0xc]
	bl sub_0802B750
_0802B7D6:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	cmp r0, #0x94
	bne _0802B7E2
	bl sub_0802B750
_0802B7E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

