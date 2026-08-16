	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199C4
sub_080199C4: @ 0x080199C4
	ldr r1, _080199CC @ =gUnknown_03002EE4
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080199CC: .4byte gUnknown_03002EE4

