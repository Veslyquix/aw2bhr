	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802428C
sub_0802428C: @ 0x0802428C
	ldr r2, _080242A4 @ =gUnknown_030033E4
	ldr r1, _080242A8 @ =gUnknown_030040A4
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r1, [r1, #2]
	strh r1, [r2, #2]
	ldr r2, _080242AC @ =gUnknown_030033E0
	lsls r0, r0, #4
	strh r0, [r2]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_080242A4: .4byte gUnknown_030033E4
_080242A8: .4byte gUnknown_030040A4
_080242AC: .4byte gUnknown_030033E0

