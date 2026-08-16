	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032B84
sub_08032B84: @ 0x08032B84
	push {lr}
	ldr r0, _08032B9C @ =0x04000010
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x50
	bl sub_08063980
	ldr r0, _08032BA0 @ =sub_08032BA4
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_08032B9C: .4byte 0x04000010
_08032BA0: .4byte sub_08032BA4

