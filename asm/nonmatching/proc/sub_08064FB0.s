	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064FB0
sub_08064FB0: @ 0x08064FB0
	ldr r1, _08064FC4 @ =gUnknown_08580934
	ldr r2, [r1]
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	movs r1, #0xe
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
_08064FC4: .4byte gUnknown_08580934

