	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C9B4
sub_0806C9B4: @ 0x0806C9B4
	ldr r1, _0806C9BC @ =0x00000A8C
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_0806C9BC: .4byte 0x00000A8C

