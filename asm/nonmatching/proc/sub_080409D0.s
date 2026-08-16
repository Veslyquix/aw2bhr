	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080409D0
sub_080409D0: @ 0x080409D0
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	adds r2, r3, #0
	adds r2, #0x4a
	ldrh r2, [r2]
	bl sub_08040624
	pop {r0}
	bx r0
	.align 2, 0

