	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032BA4
sub_08032BA4: @ 0x08032BA4
	push {lr}
	ldr r1, _08032BC0 @ =0x04000010
	ldr r0, _08032BC4 @ =gUnknown_03001FF8
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0
	bl sub_08063980
	ldr r0, _08032BC8 @ =sub_08032B84
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_08032BC0: .4byte 0x04000010
_08032BC4: .4byte gUnknown_03001FF8
_08032BC8: .4byte sub_08032B84

