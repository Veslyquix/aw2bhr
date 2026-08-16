	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806464C
sub_0806464C: @ 0x0806464C
	ldr r0, _0806465C @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0806465C: .4byte gUnknown_08580934

