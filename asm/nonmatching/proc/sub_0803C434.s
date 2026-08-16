	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C434
sub_0803C434: @ 0x0803C434
	push {lr}
	movs r0, #0x28
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C446
	movs r0, #1
	rsbs r0, r0, #0
	b _0803C456
_0803C446:
	movs r0, #0x21
	bl sub_0803CBD8
	cmp r0, #0
	beq _0803C454
	movs r0, #1
	b _0803C456
_0803C454:
	movs r0, #0
_0803C456:
	pop {r1}
	bx r1
	.align 2, 0

