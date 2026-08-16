	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067554
sub_08067554: @ 0x08067554
	movs r2, #0
	str r2, [r0, #0x58]
	str r2, [r0, #0x5c]
	movs r1, #0x14
	str r1, [r0, #0x60]
	adds r0, #0x64
	strh r2, [r0]
	bx lr

