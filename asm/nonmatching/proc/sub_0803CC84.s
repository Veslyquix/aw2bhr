	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CC84
sub_0803CC84: @ 0x0803CC84
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803CCAC
_0803CC92:
	adds r2, r5, r3
	adds r1, r4, r3
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC92
_0803CCAC:
	adds r1, r5, r3
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

