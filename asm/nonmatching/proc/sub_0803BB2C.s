	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB2C
sub_0803BB2C: @ 0x0803BB2C
	push {lr}
	bl sub_0803BB5C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _0803BB3E
	movs r0, #0
	b _0803BB40
_0803BB3E:
	movs r0, #1
_0803BB40:
	pop {r1}
	bx r1

