	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031CD4
sub_08031CD4: @ 0x08031CD4
	ldr r0, _08031CE0 @ =gUnknown_0849B060
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08031CE0: .4byte gUnknown_0849B060

