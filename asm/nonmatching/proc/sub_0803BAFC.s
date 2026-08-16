	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BAFC
sub_0803BAFC: @ 0x0803BAFC
	push {lr}
	bl sub_0803BB74
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _0803BB0E
	movs r0, #0
	b _0803BB10
_0803BB0E:
	movs r0, #1
_0803BB10:
	pop {r1}
	bx r1

