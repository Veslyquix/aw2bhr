	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804450C
sub_0804450C: @ 0x0804450C
	ldrb r2, [r0, #1]
	movs r1, #0xfe
	ands r1, r2
	strb r1, [r0, #1]
	bx lr
	.align 2, 0

