	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080674F4
sub_080674F4: @ 0x080674F4
	ldr r1, _08067500 @ =gUnknown_08580E64
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08067500: .4byte gUnknown_08580E64

