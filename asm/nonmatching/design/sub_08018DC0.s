	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018DC0
sub_08018DC0: @ 0x08018DC0
	ldr r3, _08018DF0 @ =gUnknown_030033E4
	ldr r2, _08018DF4 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldrh r0, [r0, #8]
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	ldr r0, [r1]
	ldrh r0, [r0, #0xa]
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #2]
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08018DF0: .4byte gUnknown_030033E4
_08018DF4: .4byte gUnknown_0200C528

