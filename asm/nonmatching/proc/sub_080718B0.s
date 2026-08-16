	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080718B0
sub_080718B0: @ 0x080718B0
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

