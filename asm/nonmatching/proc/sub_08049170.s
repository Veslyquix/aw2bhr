	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049170
sub_08049170: @ 0x08049170
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

