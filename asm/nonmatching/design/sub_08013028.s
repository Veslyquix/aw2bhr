	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013028
sub_08013028: @ 0x08013028
	ldr r1, _08013030 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08013030: .4byte gUnknown_03002F1C

