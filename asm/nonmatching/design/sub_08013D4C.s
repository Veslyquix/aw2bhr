	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013D4C
sub_08013D4C: @ 0x08013D4C
	adds r2, r0, #0
	adds r0, #0x32
	ldrb r1, [r0]
	lsls r1, r1, #1
	ldr r0, [r2, #0x28]
	adds r0, r0, r1
	adds r2, #0x33
	ldrb r1, [r2]
	lsls r1, r1, #6
	adds r0, r0, r1
	bx lr
	.align 2, 0

