	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034FB0
sub_08034FB0: @ 0x08034FB0
	ldr r1, _08034FBC @ =gUnknown_030040E8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08034FBC: .4byte gUnknown_030040E8

