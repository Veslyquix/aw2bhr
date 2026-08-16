	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D48C
sub_0803D48C: @ 0x0803D48C
	push {r4, lr}
	movs r4, #0
_0803D490:
	adds r0, r4, #0
	bl sub_0803D4A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xb
	bls _0803D490
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

