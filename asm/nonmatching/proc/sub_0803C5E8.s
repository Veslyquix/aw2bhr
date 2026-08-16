	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C5E8
sub_0803C5E8: @ 0x0803C5E8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803CAD4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C5FC
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C60E
_0803C5FC:
	adds r0, r4, #0
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C60C
	movs r0, #1
	b _0803C60E
_0803C60C:
	movs r0, #0
_0803C60E:
	pop {r4}
	pop {r1}
	bx r1

