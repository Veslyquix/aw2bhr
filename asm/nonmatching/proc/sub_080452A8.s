	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080452A8
sub_080452A8: @ 0x080452A8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080452B8
	bl sub_08035144
_080452B8:
	bl sub_08039F58
	pop {r0}
	bx r0

