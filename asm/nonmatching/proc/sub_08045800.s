	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045800
sub_08045800: @ 0x08045800
	push {lr}
	movs r0, #3
	bl sub_0803E388
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08045812
	movs r0, #0
	b _08045814
_08045812:
	movs r0, #1
_08045814:
	pop {r1}
	bx r1

