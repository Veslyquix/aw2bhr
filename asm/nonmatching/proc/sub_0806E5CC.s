	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E5CC
sub_0806E5CC: @ 0x0806E5CC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0806E5EC @ =gUnknown_08582B2C
	bl Proc_Start
	strh r4, [r0, #0x34]
	movs r1, #0xa0
	lsls r1, r1, #1
	str r1, [r0, #0x2c]
	movs r1, #0xa0
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E5EC: .4byte gUnknown_08582B2C

