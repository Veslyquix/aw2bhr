	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070A28
sub_08070A28: @ 0x08070A28
	push {r4, r5, r6, r7, lr}
	ldr r0, _08070A74 @ =gUnknown_03007FF0
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _08070A78 @ =0x68736D53
	cmp r1, r0
	bne _08070A6E
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_08070A42:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _08070A42
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _08070A6A
	movs r5, #1
	movs r7, #0
_08070A56:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl _call_via_r1
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _08070A56
_08070A6A:
	ldr r0, _08070A78 @ =0x68736D53
	str r0, [r6]
_08070A6E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070A74: .4byte gUnknown_03007FF0
_08070A78: .4byte 0x68736D53

