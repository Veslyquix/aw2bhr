	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034400
sub_08034400: @ 0x08034400
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	movs r5, #0
	movs r6, #0xf
	adds r4, r0, #0
_0803440A:
	adds r3, r7, r5
	ldrb r0, [r4]
	adds r1, r6, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	ands r0, r2
	orrs r1, r0
	strb r1, [r3]
	adds r4, #2
	adds r5, #1
	cmp r5, #5
	ble _0803440A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

