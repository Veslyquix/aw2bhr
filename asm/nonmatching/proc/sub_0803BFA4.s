	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BFA4
sub_0803BFA4: @ 0x0803BFA4
	ldr r1, _0803BFB4 @ =gUnknown_020288B0
	ldr r0, _0803BFB8 @ =gUnknown_0849ECDC
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	adds r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803BFB4: .4byte gUnknown_020288B0
_0803BFB8: .4byte gUnknown_0849ECDC

