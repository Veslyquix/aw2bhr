	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A1A0
sub_0801A1A0: @ 0x0801A1A0
	push {r4, lr}
	adds r2, r0, #0
	ldrb r1, [r2, #1]
	ldrb r0, [r2, #2]
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r2]
	cmp r1, r0
	bhi _0801A1B8
	movs r0, #0
	b _0801A1D2
_0801A1B8:
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	ldrb r1, [r2, #3]
	subs r0, r0, r1
	ldrb r4, [r2, #5]
	cmp r0, r4
	ble _0801A1D0
	cmp r1, r3
	bhi _0801A1D0
	adds r0, r1, #1
	strb r0, [r2, #3]
_0801A1D0:
	movs r0, #1
_0801A1D2:
	pop {r4}
	pop {r1}
	bx r1

