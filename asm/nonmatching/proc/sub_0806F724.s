	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F724
sub_0806F724: @ 0x0806F724
	lsls r1, r1, #2
	adds r0, #0x3c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #1
	strb r1, [r0]
	bx lr

