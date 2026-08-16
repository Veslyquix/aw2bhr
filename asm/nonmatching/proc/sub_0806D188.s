	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D188
sub_0806D188: @ 0x0806D188
	ldr r0, _0806D198 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0806D198: .4byte gUnknown_08580934

