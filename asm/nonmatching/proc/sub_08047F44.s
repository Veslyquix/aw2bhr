	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047F44
sub_08047F44: @ 0x08047F44
	movs r1, #0x31
	strh r1, [r0, #0x26]
	movs r1, #0x10
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0

