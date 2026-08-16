	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030C54
sub_08030C54: @ 0x08030C54
	push {r4, r5, r6, lr}
	movs r0, #0
	ldr r6, _08030C94 @ =gUnknown_08090CE8
_08030C5A:
	lsls r4, r0, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	adds r1, #0xa
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x10
	ldr r5, [r6]
	ldr r0, [r5]
	adds r0, #0x16
	adds r0, r0, r4
	ldrb r2, [r0]
	movs r0, #0xa0
	bl sub_0802BD54
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r0, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #3
	ble _08030C5A
	ldr r0, [r5]
	ldrb r2, [r0, #0x1b]
	movs r0, #0xa0
	movs r1, #0x78
	bl sub_0802BD54
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030C94: .4byte gUnknown_08090CE8

