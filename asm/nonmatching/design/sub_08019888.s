	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019888
sub_08019888: @ 0x08019888
	ldr r1, _08019890 @ =gUnknown_03003FC0
	movs r0, #1
	strb r0, [r1, #7]
	bx lr
	.align 2, 0
_08019890: .4byte gUnknown_03003FC0

