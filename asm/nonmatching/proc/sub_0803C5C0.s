	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C5C0
sub_0803C5C0: @ 0x0803C5C0
	push {lr}
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C5D2
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C5E2
_0803C5D2:
	movs r0, #0x22
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C5E0
	movs r0, #1
	b _0803C5E2
_0803C5E0:
	movs r0, #0
_0803C5E2:
	pop {r1}
	bx r1
	.align 2, 0

