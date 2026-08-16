	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BEF8
sub_0803BEF8: @ 0x0803BEF8
	ldr r0, _0803BF04 @ =gUnknown_0849ECDC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0803BF04: .4byte gUnknown_0849ECDC

