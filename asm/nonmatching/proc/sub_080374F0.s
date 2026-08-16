	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080374F0
sub_080374F0: @ 0x080374F0
	ldr r0, _08037504 @ =gUnknown_02027F74
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x37
	movs r1, #0xff
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037504: .4byte gUnknown_02027F74

