	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CE28
sub_0803CE28: @ 0x0803CE28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0803CE74 @ =gUnknown_02000000
	ldr r0, _0803CE78 @ =gUnknown_0809113C
	adds r1, r5, #0
	movs r2, #1
	bl sub_0803CFA4
	adds r0, r5, #0
	bl sub_08037B84
	bl sub_0803D6D0
	ldr r0, _0803CE7C @ =gUnknown_03002B6C
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	ldr r1, _0803CE80 @ =gUnknown_08499578
	lsls r4, r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r1, [r1]
	adds r1, r1, r4
	movs r2, #1
	movs r3, #5
	bl sub_08037638
	movs r0, #0
	bl sub_08013AD4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE74: .4byte gUnknown_02000000
_0803CE78: .4byte gUnknown_0809113C
_0803CE7C: .4byte gUnknown_03002B6C
_0803CE80: .4byte gUnknown_08499578

