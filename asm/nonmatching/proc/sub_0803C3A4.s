	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C3A4
sub_0803C3A4: @ 0x0803C3A4
	push {lr}
	bl sub_0803CA70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C3B6
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C3C8
_0803C3B6:
	movs r0, #2
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C3C6
	movs r0, #1
	b _0803C3C8
_0803C3C6:
	movs r0, #0
_0803C3C8:
	pop {r1}
	bx r1

