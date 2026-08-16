	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039DA0
sub_08039DA0: @ 0x08039DA0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	ldrh r2, [r2, #0x2c]
	adds r2, #0xc0
	bl sub_08039BB4
	pop {r0}
	bx r0
	.align 2, 0

