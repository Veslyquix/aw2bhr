	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065050
sub_08065050: @ 0x08065050
	movs r2, #0
	ldr r1, _0806505C @ =0x0000FFFE
	strh r1, [r0, #0x3c]
	strh r2, [r0, #0x3a]
	bx lr
	.align 2, 0
_0806505C: .4byte 0x0000FFFE

