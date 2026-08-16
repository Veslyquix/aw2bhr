	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014074
sub_08014074: @ 0x08014074
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x39
	movs r1, #0xfe
	strb r1, [r0]
	bx lr

