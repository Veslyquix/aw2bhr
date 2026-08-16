	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803628C
sub_0803628C: @ 0x0803628C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802759C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080362A2
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	strb r0, [r1]
_080362A2:
	pop {r4}
	pop {r0}
	bx r0

