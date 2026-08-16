	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027414
sub_08027414: @ 0x08027414
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08034F8C
	ldr r0, [r4, #0x50]
	bl sub_0801C240
	pop {r4}
	pop {r0}
	bx r0

