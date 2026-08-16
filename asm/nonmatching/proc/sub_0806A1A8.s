	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A1A8
sub_0806A1A8: @ 0x0806A1A8
	push {lr}
	movs r1, #0
	str r1, [r0, #0x58]
	ldr r1, _0806A1C8 @ =gUnknown_0202F20C
	movs r0, #0xf0
	rsbs r0, r0, #0
	str r0, [r1]
	movs r0, #0
	bl sub_08063980
	ldr r0, _0806A1CC @ =sub_0806A158
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_0806A1C8: .4byte gUnknown_0202F20C
_0806A1CC: .4byte sub_0806A158

