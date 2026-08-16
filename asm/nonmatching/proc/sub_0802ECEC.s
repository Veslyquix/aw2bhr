	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802ECEC
sub_0802ECEC: @ 0x0802ECEC
	ldr r1, _0802ECFC @ =0x0400010C
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	bx lr
	.align 2, 0
_0802ECFC: .4byte 0x0400010C

