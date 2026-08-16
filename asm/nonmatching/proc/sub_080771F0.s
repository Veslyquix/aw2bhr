	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080771F0
sub_080771F0: @ 0x080771F0
	push {lr}
	ldr r0, _0807720C @ =0x04000012
	movs r1, #0
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	movs r0, #0x80
	bl sub_08063980
	ldr r0, _08077210 @ =sub_080771C0
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_0807720C: .4byte 0x04000012
_08077210: .4byte sub_080771C0

