	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039EA8
sub_08039EA8: @ 0x08039EA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08039EC4 @ =gUnknown_0810BB9C
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x34]
	ldrh r1, [r4, #0x2c]
	strh r1, [r0, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039EC4: .4byte gUnknown_0810BB9C

