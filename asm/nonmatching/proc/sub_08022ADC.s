	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022ADC
sub_08022ADC: @ 0x08022ADC
	ldr r2, _08022AF0 @ =gUnknown_030033E0
	ldr r1, _08022AF4 @ =gUnknown_030033E4
	ldrh r0, [r1]
	lsls r0, r0, #4
	strh r0, [r2]
	ldrh r0, [r1, #2]
	lsls r0, r0, #4
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08022AF0: .4byte gUnknown_030033E0
_08022AF4: .4byte gUnknown_030033E4

