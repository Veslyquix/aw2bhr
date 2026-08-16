	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BB14
sub_0803BB14: @ 0x0803BB14
	push {lr}
	bl sub_0803BB44
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _0803BB26
	movs r0, #0
	b _0803BB28
_0803BB26:
	movs r0, #1
_0803BB28:
	pop {r1}
	bx r1

