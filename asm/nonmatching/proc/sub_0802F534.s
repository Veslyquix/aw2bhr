	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F534
sub_0802F534: @ 0x0802F534
	push {r4, r5, lr}
	ldr r2, _0802F578 @ =gUnknown_08090C7C
	ldr r0, [r2]
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	movs r0, #0
	strb r0, [r1, #7]
	movs r4, #0
	adds r5, r2, #0
_0802F546:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802F562
	ldr r0, [r5]
	ldr r1, [r0]
	ldrb r0, [r1, #7]
	adds r0, #1
	ldrb r2, [r1, #7]
	strb r0, [r1, #7]
_0802F562:
	adds r4, #1
	cmp r4, #3
	ble _0802F546
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F578: .4byte gUnknown_08090C7C

