	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A180
sub_0806A180: @ 0x0806A180
	push {lr}
	ldr r1, _0806A19C @ =0x04000010
	ldr r0, _0806A1A0 @ =gUnknown_0202F20C
	ldr r0, [r0]
	strh r0, [r1]
	movs r0, #0
	bl sub_08063980
	ldr r0, _0806A1A4 @ =sub_0806A158
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_0806A19C: .4byte 0x04000010
_0806A1A0: .4byte gUnknown_0202F20C
_0806A1A4: .4byte sub_0806A158

