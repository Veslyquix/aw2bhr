	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044DF8
sub_08044DF8: @ 0x08044DF8
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x29
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	adds r3, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x2b
	strb r1, [r0]
	bx lr

