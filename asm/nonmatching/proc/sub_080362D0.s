	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080362D0
sub_080362D0: @ 0x080362D0
	ldrh r1, [r0, #0x3e]
	subs r1, #1
	strh r1, [r0, #0x3e]
	bx lr

