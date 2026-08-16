	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022AAC
sub_08022AAC: @ 0x08022AAC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08022AC8 @ =gUnknown_030033E4
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r2, _08022ACC @ =gUnknown_030033E0
	lsls r0, r0, #4
	strh r0, [r2]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_08022AC8: .4byte gUnknown_030033E4
_08022ACC: .4byte gUnknown_030033E0

