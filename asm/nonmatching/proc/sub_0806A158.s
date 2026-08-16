	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A158
sub_0806A158: @ 0x0806A158
	push {lr}
	ldr r1, _0806A174 @ =0x04000010
	ldr r0, _0806A178 @ =gUnknown_0202F20C
	ldr r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r1]
	movs r0, #0x50
	bl sub_08063980
	ldr r0, _0806A17C @ =sub_0806A180
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_0806A174: .4byte 0x04000010
_0806A178: .4byte gUnknown_0202F20C
_0806A17C: .4byte sub_0806A180

