	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C3CC
sub_0803C3CC: @ 0x0803C3CC
	push {lr}
	bl sub_0803CA70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C3DE
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C3F0
_0803C3DE:
	movs r0, #3
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C3EE
	movs r0, #1
	b _0803C3F0
_0803C3EE:
	movs r0, #0
_0803C3F0:
	pop {r1}
	bx r1

