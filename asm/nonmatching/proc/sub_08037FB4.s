	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037FB4
sub_08037FB4: @ 0x08037FB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801237C
	bl sub_08012358
	movs r0, #1
	adds r1, r4, #0
	bl sub_08049F08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

