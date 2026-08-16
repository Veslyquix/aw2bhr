	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064124
sub_08064124: @ 0x08064124
	muls r0, r3, r0
	muls r1, r2, r1
	subs r0, r0, r1
	bx lr

