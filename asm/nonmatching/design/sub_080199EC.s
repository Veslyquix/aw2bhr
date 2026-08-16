	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199EC
sub_080199EC: @ 0x080199EC
	ldr r1, _080199F4 @ =gUnknown_03003FC0
	ldrb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080199F4: .4byte gUnknown_03003FC0

