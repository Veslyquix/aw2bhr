	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B2A8
sub_0804B2A8: @ 0x0804B2A8
	push {r4, r5, lr}
	ldr r2, _0804B318 @ =gUnknown_03001470
	ldr r0, _0804B31C @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r2, #0x34
	adds r1, r1, r2
	ldrh r4, [r1]
	ldr r1, _0804B320 @ =gUnknown_02029690
	lsls r0, r3, #4
	adds r1, r0, r1
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _0804B310
	ldrh r0, [r1]
	cmp r0, #0
	beq _0804B310
	ldr r2, _0804B324 @ =gUnknown_02029A10
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r3, r0
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r2, [r1, #0xa]
	ldr r0, _0804B328 @ =gUnknown_084C3F70
	lsls r3, r3, #2
	adds r0, r3, r0
	ldr r4, [r0]
	ldr r0, _0804B32C @ =gUnknown_084C3F78
	adds r3, r3, r0
	ldr r3, [r3]
	ldrh r1, [r1, #8]
	ldrh r0, [r4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r3]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	bl sub_080155C0
_0804B310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B318: .4byte gUnknown_03001470
_0804B31C: .4byte gUnknown_03001FBC
_0804B320: .4byte gUnknown_02029690
_0804B324: .4byte gUnknown_02029A10
_0804B328: .4byte gUnknown_084C3F70
_0804B32C: .4byte gUnknown_084C3F78

