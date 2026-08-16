	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080FD8
sub_08080FD8: @ 0x08080FD8
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

