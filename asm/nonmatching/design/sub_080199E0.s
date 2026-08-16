	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199E0
sub_080199E0: @ 0x080199E0
	ldr r1, _080199E8 @ =gUnknown_03003FC0
	ldrb r0, [r1, #2]
	strb r0, [r1, #3]
	bx lr
	.align 2, 0
_080199E8: .4byte gUnknown_03003FC0

