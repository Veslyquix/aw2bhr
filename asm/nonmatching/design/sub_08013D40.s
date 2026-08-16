	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013D40
sub_08013D40: @ 0x08013D40
	ldr r1, _08013D48 @ =gUnknown_03002514
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08013D48: .4byte gUnknown_03002514

