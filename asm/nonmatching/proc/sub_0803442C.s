	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803442C
sub_0803442C: @ 0x0803442C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r5, #0
	movs r7, #0xff
	adds r4, r6, #0
	adds r1, r0, #0
_08034438:
	ldrb r0, [r1]
	lsrs r2, r0, #4
	cmp r2, #0xf
	bne _08034444
	strb r7, [r4]
	b _08034446
_08034444:
	strb r2, [r4]
_08034446:
	lsls r3, r5, #1
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	cmp r2, #0xf
	bne _08034458
	adds r0, r3, r6
	strb r7, [r0, #1]
	b _0803445C
_08034458:
	adds r0, r3, r6
	strb r2, [r0, #1]
_0803445C:
	adds r4, #2
	adds r1, #1
	adds r5, #1
	cmp r5, #5
	ble _08034438
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

