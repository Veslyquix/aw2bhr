	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078E14
sub_08078E14: @ 0x08078E14
	ldr r0, _08078E1C @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	subs r0, #0x89
	bx lr
	.align 2, 0
_08078E1C: .4byte gUnknown_03003FC0

