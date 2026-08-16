	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064CE0
sub_08064CE0: @ 0x08064CE0
	ldr r1, _08064CF8 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	movs r3, #0
	strb r1, [r2]
	movs r1, #2
	strh r1, [r0, #0x3c]
	strh r3, [r0, #0x3a]
	bx lr
	.align 2, 0
_08064CF8: .4byte gUnknown_08580934

