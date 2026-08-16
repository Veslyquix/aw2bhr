	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C48C
sub_0803C48C: @ 0x0803C48C
	push {lr}
	bl sub_0803CAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C49E
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C4AE
_0803C49E:
	movs r0, #0x23
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C4AC
	movs r0, #1
	b _0803C4AE
_0803C4AC:
	movs r0, #0
_0803C4AE:
	pop {r1}
	bx r1
	.align 2, 0

