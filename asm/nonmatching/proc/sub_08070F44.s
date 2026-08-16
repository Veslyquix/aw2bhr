	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070F44
sub_08070F44: @ 0x08070F44
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _08070F64
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _08070F70
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _08070F7E
_08070F64:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _08070F70
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _08070F7E
_08070F70:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _08070F8E
_08070F7E:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _08070F90
	movs r0, #0xf
_08070F8E:
	strb r0, [r1, #0xa]
_08070F90:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

