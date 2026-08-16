	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023860
sub_08023860: @ 0x08023860
	push {r4, lr}
	ldr r0, _080238E0 @ =gUnknown_08499B4C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	ldr r4, _080238E4 @ =gUnknown_08090A14
	cmp r0, r1
	beq _08023892
	ldr r3, _080238E8 @ =gUnknown_03001FF8
	ldr r0, [r4]
	ldr r2, [r0]
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #4
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r3]
	ldr r3, _080238EC @ =gUnknown_03001418
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #4
	ldrh r0, [r2, #6]
	subs r0, r0, r1
	strh r0, [r3]
_08023892:
	ldr r2, _080238F0 @ =gUnknown_03002B34
	ldr r0, [r4]
	ldr r1, [r0]
	ldrh r0, [r1, #0xc]
	lsls r0, r0, #4
	ldrh r3, [r1, #4]
	subs r0, r3, r0
	strh r0, [r2]
	ldr r4, _080238F4 @ =gUnknown_03002F18
	ldrh r0, [r1, #0xe]
	lsls r0, r0, #4
	ldrh r2, [r1, #6]
	subs r0, r2, r0
	adds r0, #3
	strh r0, [r4]
	ldr r4, _080238F8 @ =gUnknown_030030A0
	ldrh r0, [r1, #0xc]
	lsls r0, r0, #4
	subs r0, r3, r0
	strh r0, [r4]
	ldr r4, _080238FC @ =gUnknown_03001400
	ldrh r0, [r1, #0xe]
	lsls r0, r0, #4
	subs r0, r2, r0
	strh r0, [r4]
	ldr r4, _08023900 @ =gUnknown_0300200C
	ldrh r0, [r1, #0xc]
	lsls r0, r0, #4
	subs r3, r3, r0
	strh r3, [r4]
	ldr r3, _08023904 @ =gUnknown_03002000
	ldrh r0, [r1, #0xe]
	lsls r0, r0, #4
	subs r2, r2, r0
	strh r2, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080238E0: .4byte gUnknown_08499B4C
_080238E4: .4byte gUnknown_08090A14
_080238E8: .4byte gUnknown_03001FF8
_080238EC: .4byte gUnknown_03001418
_080238F0: .4byte gUnknown_03002B34
_080238F4: .4byte gUnknown_03002F18
_080238F8: .4byte gUnknown_030030A0
_080238FC: .4byte gUnknown_03001400
_08023900: .4byte gUnknown_0300200C
_08023904: .4byte gUnknown_03002000

