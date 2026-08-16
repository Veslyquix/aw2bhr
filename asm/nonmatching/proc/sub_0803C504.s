	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C504
sub_0803C504: @ 0x0803C504
	push {lr}
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C516
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C526
_0803C516:
	movs r0, #0x26
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C524
	movs r0, #1
	b _0803C526
_0803C524:
	movs r0, #0
_0803C526:
	pop {r1}
	bx r1
	.align 2, 0

