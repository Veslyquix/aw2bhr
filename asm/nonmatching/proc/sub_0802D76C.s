	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D76C
sub_0802D76C: @ 0x0802D76C
	push {r4, r5, r6, lr}
	movs r2, #5
	ldr r6, _0802D7AC @ =gUnknown_08499578
	movs r5, #0
_0802D774:
	movs r1, #1
	lsls r4, r2, #0x10
	asrs r3, r4, #0xb
_0802D77A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, r0
	ldr r2, [r6]
	lsls r1, r1, #1
	adds r1, r1, r2
	strh r5, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0802D77A
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x12
	ble _0802D774
	bl sub_08013AEC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D7AC: .4byte gUnknown_08499578

