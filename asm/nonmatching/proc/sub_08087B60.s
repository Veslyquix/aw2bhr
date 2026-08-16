	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087B60
sub_08087B60: @ 0x08087B60
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08087B74
	adds r0, r4, #0
	bl sub_08087C14
	pop {r4}
	pop {r0}
	bx r0

