	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074AD0
sub_08074AD0: @ 0x08074AD0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r6, #1
	ldrh r1, [r0, #0x2c]
	ldrh r0, [r0, #0x30]
	subs r3, r1, r0
	cmp r3, #0
	bge _08074AE2
	rsbs r3, r3, #0
_08074AE2:
	mov r0, ip
	ldrh r1, [r0, #0x2e]
	ldrh r0, [r0, #0x32]
	subs r2, r1, r0
	cmp r2, #0
	bge _08074AF0
	rsbs r2, r2, #0
_08074AF0:
	cmp r3, r2
	ble _08074B00
	mov r0, ip
	adds r0, #0x40
	strb r6, [r0]
	mov r1, ip
	strh r3, [r1, #0x38]
	b _08074B0C
_08074B00:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r0, ip
	strh r2, [r0, #0x38]
_08074B0C:
	mov r1, ip
	movs r2, #0x38
	ldrsh r3, [r1, r2]
	movs r4, #0
	lsls r0, r6, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r7, _08074B24 @ =gUnknown_081CC4D4
	cmp r0, #0
	bge _08074B28
	ldr r0, [r7]
	b _08074B4E
	.align 2, 0
_08074B24: .4byte gUnknown_081CC4D4
_08074B28:
	lsls r1, r6, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	ldr r5, [r7]
	adds r0, r4, r5
	strb r1, [r0]
	cmp r2, #0xf
	bgt _08074B40
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08074B40:
	adds r4, #1
	lsls r0, r6, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge _08074B28
	adds r0, r4, r5
_08074B4E:
	strb r3, [r0]
	mov r0, ip
	str r4, [r0, #0x3c]
	ldrh r0, [r0, #0x38]
	mov r1, ip
	strh r0, [r1, #0x3a]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

