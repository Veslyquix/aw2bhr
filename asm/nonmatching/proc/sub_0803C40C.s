	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C40C
sub_0803C40C: @ 0x0803C40C
	push {lr}
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C41E
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C42E
_0803C41E:
	movs r0, #0x21
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C42C
	movs r0, #1
	b _0803C42E
_0803C42C:
	movs r0, #0
_0803C42E:
	pop {r1}
	bx r1
	.align 2, 0

