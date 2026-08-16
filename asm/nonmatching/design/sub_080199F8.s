	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080199F8
sub_080199F8: @ 0x080199F8
	ldr r2, _08019A08 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08019A08: .4byte gUnknown_030030CC

