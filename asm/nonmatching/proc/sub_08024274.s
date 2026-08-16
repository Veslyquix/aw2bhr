	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024274
sub_08024274: @ 0x08024274
	ldr r2, _08024284 @ =gUnknown_030040A4
	ldr r1, _08024288 @ =gUnknown_030033E4
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_08024284: .4byte gUnknown_030040A4
_08024288: .4byte gUnknown_030033E4

