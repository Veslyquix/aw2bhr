	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013D64
sub_08013D64: @ 0x08013D64
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, [r2, #0x28]
	adds r0, r0, r1
	adds r2, #0x31
	ldrb r1, [r2]
	lsls r1, r1, #6
	adds r0, r0, r1
	bx lr
	.align 2, 0

