	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040C88
sub_08040C88: @ 0x08040C88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_0801C240
	ldr r0, [r4, #0x34]
	bl sub_0801C240
	ldr r0, [r4, #0x38]
	bl sub_0801C240
	pop {r4}
	pop {r0}
	bx r0

