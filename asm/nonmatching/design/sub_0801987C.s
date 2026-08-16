	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801987C
sub_0801987C: @ 0x0801987C
	ldr r1, _08019884 @ =gUnknown_03003FC0
	movs r0, #1
	strb r0, [r1, #6]
	bx lr
	.align 2, 0
_08019884: .4byte gUnknown_03003FC0

