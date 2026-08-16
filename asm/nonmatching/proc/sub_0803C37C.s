	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C37C
sub_0803C37C: @ 0x0803C37C
	push {lr}
	bl sub_0803CA70
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C38E
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C3A0
_0803C38E:
	movs r0, #7
	bl sub_0803CA9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C39E
	movs r0, #1
	b _0803C3A0
_0803C39E:
	movs r0, #0
_0803C3A0:
	pop {r1}
	bx r1

