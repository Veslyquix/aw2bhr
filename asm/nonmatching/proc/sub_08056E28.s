	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056E28
sub_08056E28: @ 0x08056E28
	push {r4, r5, lr}
	ldr r4, _08056E98 @ =gUnknown_02029A10
	ldrh r2, [r0, #2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r0]
	movs r3, #0xb4
	muls r2, r3, r2
	adds r1, r1, r2
	adds r1, r1, r4
	ldrh r2, [r0, #4]
	strh r2, [r1, #0xc]
	ldrh r2, [r0, #2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r0]
	muls r2, r3, r2
	adds r1, r1, r2
	adds r1, r1, r4
	ldrh r2, [r0, #6]
	strh r2, [r1, #0x10]
	ldrh r2, [r0, #2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r0]
	muls r2, r3, r2
	adds r1, r1, r2
	adds r1, r1, r4
	ldrh r2, [r0, #8]
	strh r2, [r1, #0xe]
	ldrh r2, [r0, #2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r2, [r0]
	muls r2, r3, r2
	adds r1, r1, r2
	adds r1, r1, r4
	ldrh r2, [r0, #0xa]
	strh r2, [r1, #0x12]
	ldrh r5, [r0, #0xc]
	ldrh r2, [r0, #2]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	adds r1, r1, r4
	strh r5, [r1, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056E98: .4byte gUnknown_02029A10

