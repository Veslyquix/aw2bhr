	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025CC8
sub_08025CC8: @ 0x08025CC8
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
	beq _08025CE8
	bl sub_080258CC
	adds r0, r4, #0
	b _08025CEA
_08025CE8:
	movs r0, #0
_08025CEA:
	pop {r4}
	pop {r1}
	bx r1

