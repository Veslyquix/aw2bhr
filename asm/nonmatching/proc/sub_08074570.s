	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074570
sub_08074570: @ 0x08074570
	ldrb r1, [r0]
	cmp r1, #7
	beq _08074582
_08074576:
	cmp r1, #8
	beq _08074582
	adds r0, #8
	ldrb r1, [r0]
	cmp r1, #7
	bne _08074576
_08074582:
	bx lr

