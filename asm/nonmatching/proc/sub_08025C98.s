	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025C98
sub_08025C98: @ 0x08025C98
	push {r4, lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_08025C5C
	adds r4, r0, #0
	cmp r4, #0
	beq _08025CC0
	ldrb r1, [r4, #1]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #1]
	bl sub_080258CC
	adds r0, r4, #0
	b _08025CC2
_08025CC0:
	movs r0, #0
_08025CC2:
	pop {r4}
	pop {r1}
	bx r1

