	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019870
sub_08019870: @ 0x08019870
	ldr r1, _08019878 @ =gUnknown_03003FC0
	movs r0, #0
	strb r0, [r1, #6]
	bx lr
	.align 2, 0
_08019878: .4byte gUnknown_03003FC0

