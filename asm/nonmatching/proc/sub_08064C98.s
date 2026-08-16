	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064C98
sub_08064C98: @ 0x08064C98
	movs r2, #0
	ldr r1, _08064CA4 @ =0x0000FFFE
	strh r1, [r0, #0x3c]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0
_08064CA4: .4byte 0x0000FFFE

