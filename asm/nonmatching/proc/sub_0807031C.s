	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807031C
sub_0807031C: @ 0x0807031C
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

