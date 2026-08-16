	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D1F0
sub_0806D1F0: @ 0x0806D1F0
	ldr r1, _0806D204 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	movs r1, #0x10
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_0806D204: .4byte gUnknown_08580934

