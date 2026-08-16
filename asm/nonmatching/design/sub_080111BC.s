	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080111BC
sub_080111BC: @ 0x080111BC
	ldr r1, _080111C4 @ =0x040000BA
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080111C4: .4byte 0x040000BA

