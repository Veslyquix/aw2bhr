	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C4DC
sub_0803C4DC: @ 0x0803C4DC
	push {lr}
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C4EE
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C4FE
_0803C4EE:
	movs r0, #0x25
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C4FC
	movs r0, #1
	b _0803C4FE
_0803C4FC:
	movs r0, #0
_0803C4FE:
	pop {r1}
	bx r1
	.align 2, 0

