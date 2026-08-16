	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049E38
sub_08049E38: @ 0x08049E38
	ldr r1, _08049E48 @ =gUnknown_02028E3C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08049E4C @ =gUnknown_084C3240
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_08049E48: .4byte gUnknown_02028E3C
_08049E4C: .4byte gUnknown_084C3240

