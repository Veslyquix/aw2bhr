	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039930
sub_08039930: @ 0x08039930
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08039944 @ =gUnknown_0849D7FC
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039944: .4byte gUnknown_0849D7FC

