	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031F10
sub_08031F10: @ 0x08031F10
	push {lr}
	movs r1, #0x20
	strh r1, [r0, #0x1e]
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_080139C4
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0

