	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CC64
sub_0803CC64: @ 0x0803CC64
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0803CC7A
	cmp r0, #0
	bne _0803CC7E
_0803CC7A:
	movs r0, #0
	b _0803CC80
_0803CC7E:
	movs r0, #1
_0803CC80:
	pop {r1}
	bx r1

