	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E354
sub_0803E354: @ 0x0803E354
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803E364 @ =gUnknown_02028360
	ldrh r1, [r2, #2]
	movs r3, #0xf0
	lsls r3, r3, #2
	b _0803E378
	.align 2, 0
_0803E364: .4byte gUnknown_02028360
_0803E368:
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, r4
	bne _0803E374
	adds r0, r2, #0
	b _0803E382
_0803E374:
	adds r2, #8
	ldrh r1, [r2, #2]
_0803E378:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0803E368
	movs r0, #0
_0803E382:
	pop {r4}
	pop {r1}
	bx r1

