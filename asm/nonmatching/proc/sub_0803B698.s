	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B698
sub_0803B698: @ 0x0803B698
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	movs r1, #0x80
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0

