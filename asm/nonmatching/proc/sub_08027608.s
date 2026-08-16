	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027608
sub_08027608: @ 0x08027608
	push {r4, lr}
	ldr r0, _08027654 @ =gUnknown_08090AA0
	ldr r3, [r0]
	ldr r2, [r3, #4]
	adds r4, r0, #0
	cmp r2, #0xac
	ble _08027632
	movs r0, #0
	strb r0, [r3]
	adds r0, r2, #0
	subs r0, #0xfa
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
	str r0, [r3, #4]
	cmp r0, #0xf8
	ble _08027632
	movs r0, #0x57
	rsbs r0, r0, #0
	str r0, [r3, #4]
_08027632:
	ldr r3, [r4]
	ldr r2, [r3, #4]
	cmp r2, #2
	bgt _0802764E
	subs r0, r2, #3
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r0, r2, r0
	str r0, [r3, #4]
	cmp r0, #1
	ble _0802764E
	movs r0, #3
	str r0, [r3, #4]
_0802764E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027654: .4byte gUnknown_08090AA0

