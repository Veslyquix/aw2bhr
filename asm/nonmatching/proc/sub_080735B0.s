	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080735B0
sub_080735B0: @ 0x080735B0
	ldr r1, _080735C8 @ =0x040000BA
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080735CC @ =0x040000B0
	movs r1, #0
	str r1, [r0]
	adds r0, #4
	str r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_080735C8: .4byte 0x040000BA
_080735CC: .4byte 0x040000B0

