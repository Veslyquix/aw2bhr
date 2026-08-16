	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801297C
sub_0801297C: @ 0x0801297C
	ldr r2, _08012988 @ =gDispIo
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08012988: .4byte gDispIo

